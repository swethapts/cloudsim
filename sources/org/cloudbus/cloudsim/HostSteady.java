/*
 * Title: CloudSim Toolkit Description: CloudSim (Cloud Simulation) Toolkit for Modeling and
 * Simulation of Clouds Licence: GPL - http://www.gnu.org/copyleft/gpl.html
 * 
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim;

import java.util.ArrayList;
import java.util.List;

import org.cloudbus.cloudsim.core.CloudSim;
import org.cloudbus.cloudsim.lists.PeListSteady;
import org.cloudbus.cloudsim.provisioners.BwProvisionerSteady;
import org.cloudbus.cloudsim.provisioners.RamProvisionerSteady;

/**
 * Host executes actions related to management of virtual machines (e.g., creation and destruction).
 * A host has a defined policy for provisioning memory and bw, as well as an allocation policy for
 * PeSteady's to virtual machines. A host is associated to a datacenter. It can host virtual machines.
 * 
 * @author Rodrigo N. Calheiros
 * @author Anton Beloglazov
 * @since CloudSim Toolkit 1.0
 */
public class HostSteady {

	/** The id. */
	private int id;

	/** The storage. */
	private long storage;

	/** The ram provisioner. */
	private RamProvisionerSteady ramProvisioner;

	/** The bw provisioner. */
	private BwProvisionerSteady bwProvisioner;

	/** The allocation policy. */
	private VmSchedulerSteady vmScheduler;

	/** The vm list. */
	private final List<? extends VmSteady> vmList = new ArrayList<VmSteady>();

	/** The pe list. */
	private List<? extends PeSteady> peList;

	/** Tells whether this machine is working properly or has failed. */
	private boolean failed;

	/** The vms migrating in. */
	private final List<VmSteady> vmsMigratingIn = new ArrayList<VmSteady>();

	/** The datacenter where the host is placed. */
	private DatacenterSteady datacenter;
	
	private boolean used;

	/**
	 * Instantiates a new host.
	 * 
	 * @param id the id
	 * @param ramProvisioner the ram provisioner
	 * @param bwProvisioner the bw provisioner
	 * @param storage the storage
	 * @param peList the pe list
	 * @param vmScheduler the vm scheduler
	 */
	public HostSteady(
			int id,
			RamProvisionerSteady ramProvisioner,
			BwProvisionerSteady bwProvisioner,
			long storage,
			List<? extends PeSteady> peList,
			VmSchedulerSteady vmScheduler) {
		setId(id);
		setRamProvisioner(ramProvisioner);
		setBwProvisioner(bwProvisioner);
		setStorage(storage);
		setVmScheduler(vmScheduler);

		setPeList(peList);
		setFailed(false);
	}

	/**
	 * Requests updating of processing of cloudlets in the VMs running in this host.
	 * 
	 * @param currentTime the current time
	 * @return expected time of completion of the next cloudlet in all VMs in this host.
	 *         Double.MAX_VALUE if there is no future events expected in this host
	 * @pre currentTime >= 0.0
	 * @post $none
	 */
	public double updateVmsProcessing(double currentTime) {
		double smallerTime = Double.MAX_VALUE;

		for (VmSteady vm : getVmList()) {
			double time = vm.updateVmProcessing(currentTime, getVmScheduler().getAllocatedMipsForVm(vm));
			if (time > 0.0 && time < smallerTime) {
				smallerTime = time;
			}
		}

		return smallerTime;
	}

	/**
	 * Adds the migrating in vm.
	 * 
	 * @param vm the vm
	 */
	public void addMigratingInVm(VmSteady vm) {
		vm.setInMigration(true);

		if (!getVmsMigratingIn().contains(vm)) {
			if (getStorage() < vm.getSize()) {
				Log.printLine("[VmSchedulerSteady.addMigratingInVm] Allocation of VM #" + vm.getId() + " to Host #"
						+ getId() + " failed by storage");
				System.exit(0);
			}

			if (!getRamProvisioner().allocateRamForVm(vm, vm.getCurrentRequestedRam())) {
				Log.printLine("[VmSchedulerSteady.addMigratingInVm] Allocation of VM #" + vm.getId() + " to Host #"
						+ getId() + " failed by RAM");
				System.exit(0);
			}

			if (!getBwProvisioner().allocateBwForVm(vm, vm.getCurrentRequestedBw())) {
				Log.printLine("[VmSchedulerSteady.addMigratingInVm] Allocation of VM #" + vm.getId() + " to Host #"
						+ getId() + " failed by BW");
				System.exit(0);
			}

			getVmScheduler().getVmsMigratingIn().add(vm.getUid());
			if (!getVmScheduler().allocatePesForVm(vm, vm.getCurrentRequestedMips())) {
				Log.printLine("[VmSchedulerSteady.addMigratingInVm] Allocation of VM #" + vm.getId() + " to Host #"
						+ getId() + " failed by MIPS");
				System.exit(0);
			}

			setStorage(getStorage() - vm.getSize());

			getVmsMigratingIn().add(vm);
			getVmList().add(vm);
			updateVmsProcessing(CloudSim.clock());
			vm.getHost().updateVmsProcessing(CloudSim.clock());
		}
	}

	/**
	 * Removes the migrating in vm.
	 * 
	 * @param vm the vm
	 */
	public void removeMigratingInVm(VmSteady vm) {
		vmDeallocate(vm);
		getVmsMigratingIn().remove(vm);
		getVmList().remove(vm);
		getVmScheduler().getVmsMigratingIn().remove(vm.getUid());
		vm.setInMigration(false);
	}

	/**
	 * Reallocate migrating in vms.
	 */
	public void reallocateMigratingInVms() {
		for (VmSteady vm : getVmsMigratingIn()) {
			if (!getVmList().contains(vm)) {
				getVmList().add(vm);
			}
			if (!getVmScheduler().getVmsMigratingIn().contains(vm.getUid())) {
				getVmScheduler().getVmsMigratingIn().add(vm.getUid());
			}
			getRamProvisioner().allocateRamForVm(vm, vm.getCurrentRequestedRam());
			getBwProvisioner().allocateBwForVm(vm, vm.getCurrentRequestedBw());
			getVmScheduler().allocatePesForVm(vm, vm.getCurrentRequestedMips());
			setStorage(getStorage() - vm.getSize());
		}
	}

	/**
	 * Checks if is suitable for vm.
	 * 
	 * @param vm the vm
	 * @return true, if is suitable for vm
	 */
	public boolean isSuitableForVm(VmSteady vm) {
		return (getVmScheduler().getPeCapacity() >= vm.getCurrentRequestedMaxMips()
				&& getVmScheduler().getAvailableMips() >= vm.getCurrentRequestedTotalMips()
				&& getRamProvisioner().isSuitableForVm(vm, vm.getCurrentRequestedRam()) && getBwProvisioner()
				.isSuitableForVm(vm, vm.getCurrentRequestedBw()));
	}

	/**
	 * Allocates PEs and memory to a new VM in the Host.
	 * 
	 * @param vm VmSteady being started
	 * @return $true if the VM could be started in the host; $false otherwise
	 * @pre $none
	 * @post $none
	 */
	public boolean vmCreate(VmSteady vm) {
		if (getStorage() < vm.getSize()) {
			Log.printLine("[VmSchedulerSteady.vmCreate] Allocation of VM #" + vm.getId() + " to Host #" + getId()
					+ " failed by storage");
			return false;
		}

		if (!getRamProvisioner().allocateRamForVm(vm, vm.getCurrentRequestedRam())) {
			Log.printLine("[VmSchedulerSteady.vmCreate] Allocation of VM #" + vm.getId() + " to Host #" + getId()
					+ " failed by RAM");
			return false;
		}

		if (!getBwProvisioner().allocateBwForVm(vm, vm.getCurrentRequestedBw())) {
			Log.printLine("[VmSchedulerSteady.vmCreate] Allocation of VM #" + vm.getId() + " to Host #" + getId()
					+ " failed by BW");
			getRamProvisioner().deallocateRamForVm(vm);
			return false;
		}

		if (!getVmScheduler().allocatePesForVm(vm, vm.getCurrentRequestedMips())) {
			Log.printLine("[VmSchedulerSteady.vmCreate] Allocation of VM #" + vm.getId() + " to Host #" + getId()
					+ " failed by MIPS");
			getRamProvisioner().deallocateRamForVm(vm);
			getBwProvisioner().deallocateBwForVm(vm);
			return false;
		}

		setStorage(getStorage() - vm.getSize());
		getVmList().add(vm);
		vm.setHost(this);
		setUsed(true);
		return true;
	}

	/**
	 * Destroys a VM running in the host.
	 * 
	 * @param vm the VM
	 * @pre $none
	 * @post $none
	 */
	public void vmDestroy(VmSteady vm) {
		if (vm != null) {
			vmDeallocate(vm);
			getVmList().remove(vm);
			vm.setHost(null);
		}
	}

	/**
	 * Destroys all VMs running in the host.
	 * 
	 * @pre $none
	 * @post $none
	 */
	public void vmDestroyAll() {
		vmDeallocateAll();
		for (VmSteady vm : getVmList()) {
			vm.setHost(null);
			setStorage(getStorage() + vm.getSize());
		}
		getVmList().clear();
	}

	/**
	 * Deallocate all hostList for the VM.
	 * 
	 * @param vm the VM
	 */
	protected void vmDeallocate(VmSteady vm) {
		getRamProvisioner().deallocateRamForVm(vm);
		getBwProvisioner().deallocateBwForVm(vm);
		getVmScheduler().deallocatePesForVm(vm);
		setStorage(getStorage() + vm.getSize());
	}

	/**
	 * Deallocate all hostList for the VM.
	 */
	protected void vmDeallocateAll() {
		getRamProvisioner().deallocateRamForAllVms();
		getBwProvisioner().deallocateBwForAllVms();
		getVmScheduler().deallocatePesForAllVms();
	}

	/**
	 * Returns a VM object.
	 * 
	 * @param vmId the vm id
	 * @param userId ID of VM's owner
	 * @return the virtual machine object, $null if not found
	 * @pre $none
	 * @post $none
	 */
	public VmSteady getVm(int vmId, int userId) {
		for (VmSteady vm : getVmList()) {
			if (vm.getId() == vmId && vm.getUserId() == userId) {
				return vm;
			}
		}
		return null;
	}

	/**
	 * Gets the pes number.
	 * 
	 * @return the pes number
	 */
	public int getNumberOfPes() {
		return getPeList().size();
	}

	/**
	 * Gets the free pes number.
	 * 
	 * @return the free pes number
	 */
	public int getNumberOfFreePes() {
		return PeListSteady.getNumberOfFreePes(getPeList());
	}

	/**
	 * Gets the total mips.
	 * 
	 * @return the total mips
	 */
	public int getTotalMips() {
		return PeListSteady.getTotalMips(getPeList());
	}
	public int getMipsIndex(double mips){
		return PeListSteady.getMipsIndex(getPeList(),mips);
	}

	/**
	 * Allocates PEs for a VM.
	 * 
	 * @param vm the vm
	 * @param mipsShare the mips share
	 * @return $true if this policy allows a new VM in the host, $false otherwise
	 * @pre $none
	 * @post $none
	 */
	public boolean allocatePesForVm(VmSteady vm, List<Double> mipsShare) {
		return getVmScheduler().allocatePesForVm(vm, mipsShare);
	}

	/**
	 * Releases PEs allocated to a VM.
	 * 
	 * @param vm the vm
	 * @pre $none
	 * @post $none
	 */
	public void deallocatePesForVm(VmSteady vm) {
		getVmScheduler().deallocatePesForVm(vm);
	}

	/**
	 * Returns the MIPS share of each PeSteady that is allocated to a given VM.
	 * 
	 * @param vm the vm
	 * @return an array containing the amount of MIPS of each pe that is available to the VM
	 * @pre $none
	 * @post $none
	 */
	public List<Double> getAllocatedMipsForVm(VmSteady vm) {
		return getVmScheduler().getAllocatedMipsForVm(vm);
	}

	/**
	 * Gets the total allocated MIPS for a VM over all the PEs.
	 * 
	 * @param vm the vm
	 * @return the allocated mips for vm
	 */
	public double getTotalAllocatedMipsForVm(VmSteady vm) {
		return getVmScheduler().getTotalAllocatedMipsForVm(vm);
	}

	/**
	 * Returns maximum available MIPS among all the PEs.
	 * 
	 * @return max mips
	 */
	public double getMaxAvailableMips() {
		return getVmScheduler().getMaxAvailableMips();
	}

	/**
	 * Gets the free mips.
	 * 
	 * @return the free mips
	 */
	public double getAvailableMips() {
		return getVmScheduler().getAvailableMips();
	}

	/**
	 * Gets the machine bw.
	 * 
	 * @return the machine bw
	 * @pre $none
	 * @post $result > 0
	 */
	public long getBw() {
		return getBwProvisioner().getBw();
	}

	/**
	 * Gets the machine memory.
	 * 
	 * @return the machine memory
	 * @pre $none
	 * @post $result > 0
	 */
	public int getRam() {
		return getRamProvisioner().getRam();
	}

	/**
	 * Gets the machine storage.
	 * 
	 * @return the machine storage
	 * @pre $none
	 * @post $result >= 0
	 */
	public long getStorage() {
		return storage;
	}

	/**
	 * Gets the id.
	 * 
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * Sets the id.
	 * 
	 * @param id the new id
	 */
	protected void setId(int id) {
		this.id = id;
	}

	/**
	 * Gets the ram provisioner.
	 * 
	 * @return the ram provisioner
	 */
	public RamProvisionerSteady getRamProvisioner() {
		return ramProvisioner;
	}

	/**
	 * Sets the ram provisioner.
	 * 
	 * @param ramProvisioner the new ram provisioner
	 */
	protected void setRamProvisioner(RamProvisionerSteady ramProvisioner) {
		this.ramProvisioner = ramProvisioner;
	}

	/**
	 * Gets the bw provisioner.
	 * 
	 * @return the bw provisioner
	 */
	public BwProvisionerSteady getBwProvisioner() {
		return bwProvisioner;
	}

	/**
	 * Sets the bw provisioner.
	 * 
	 * @param bwProvisioner the new bw provisioner
	 */
	protected void setBwProvisioner(BwProvisionerSteady bwProvisioner) {
		this.bwProvisioner = bwProvisioner;
	}

	/**
	 * Gets the VM scheduler.
	 * 
	 * @return the VM scheduler
	 */
	public VmSchedulerSteady getVmScheduler() {
		return vmScheduler;
	}

	/**
	 * Sets the VM scheduler.
	 * 
	 * @param vmScheduler the vm scheduler
	 */
	protected void setVmScheduler(VmSchedulerSteady vmScheduler) {
		this.vmScheduler = vmScheduler;
	}

	/**
	 * Gets the pe list.
	 * 
	 * @param <T> the generic type
	 * @return the pe list
	 */
	@SuppressWarnings("unchecked")
	public <T extends PeSteady> List<T> getPeList() {
		return (List<T>) peList;
	}

	/**
	 * Sets the pe list.
	 * 
	 * @param <T> the generic type
	 * @param peList the new pe list
	 */
	protected <T extends PeSteady> void setPeList(List<T> peList) {
		this.peList = peList;
	}

	/**
	 * Gets the vm list.
	 * 
	 * @param <T> the generic type
	 * @return the vm list
	 */
	@SuppressWarnings("unchecked")
	public <T extends VmSteady> List<T> getVmList() {
		return (List<T>) vmList;
	}

	/**
	 * Sets the storage.
	 * 
	 * @param storage the new storage
	 */
	protected void setStorage(long storage) {
		this.storage = storage;
	}

	/**
	 * Checks if is failed.
	 * 
	 * @return true, if is failed
	 */
	public boolean isFailed() {
		return failed;
	}

	/**
	 * Sets the PEs of this machine to a FAILED status. NOTE: <tt>resName</tt> is used for debugging
	 * purposes, which is <b>ON</b> by default. Use {@link #setFailed(boolean)} if you do not want
	 * this information.
	 * 
	 * @param resName the name of the resource
	 * @param failed the failed
	 * @return <tt>true</tt> if successful, <tt>false</tt> otherwise
	 */
	public boolean setFailed(String resName, boolean failed) {
		// all the PEs are failed (or recovered, depending on fail)
		this.failed = failed;
		PeListSteady.setStatusFailed(getPeList(), resName, getId(), failed);
		return true;
	}

	/**
	 * Sets the PEs of this machine to a FAILED status.
	 * 
	 * @param failed the failed
	 * @return <tt>true</tt> if successful, <tt>false</tt> otherwise
	 */
	public boolean setFailed(boolean failed) {
		// all the PEs are failed (or recovered, depending on fail)
		this.failed = failed;
		PeListSteady.setStatusFailed(getPeList(), failed);
		return true;
	}

	/**
	 * Sets the particular PeSteady status on this Machine.
	 * 
	 * @param peId the pe id
	 * @param status PeSteady status, either <tt>PeSteady.FREE</tt> or <tt>PeSteady.BUSY</tt>
	 * @return <tt>true</tt> if the PeSteady status has changed, <tt>false</tt> otherwise (PeSteady id might not
	 *         be exist)
	 * @pre peID >= 0
	 * @post $none
	 */
	public boolean setPeStatus(int peId, int status) {
		return PeListSteady.setPeStatus(getPeList(), peId, status);
	}

	/**
	 * Gets the vms migrating in.
	 * 
	 * @return the vms migrating in
	 */
	public List<VmSteady> getVmsMigratingIn() {
		return vmsMigratingIn;
	}

	/**
	 * Gets the data center.
	 * 
	 * @return the data center where the host runs
	 */
	public DatacenterSteady getDatacenter() {
		return datacenter;
	}

	/**
	 * Sets the data center.
	 * 
	 * @param datacenter the data center from this host
	 */
	public void setDatacenter(DatacenterSteady datacenter) {
		this.datacenter = datacenter;
	}
	
	public void setUsed(boolean used){
		this.used = used;
	}
	
	public boolean getUsed(){
		return used;
	}

}
