/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.power;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cloudbus.cloudsim.HostSteady;
import org.cloudbus.cloudsim.Log;
import org.cloudbus.cloudsim.VmSteady;
import org.cloudbus.cloudsim.VmAllocationPolicySteady;
import org.cloudbus.cloudsim.core.CloudSim;

/**
 * The class of an abstract power-aware VM allocation policy.
 * 
 * If you are using any algorithms, policies or workload included in the power package, please cite
 * the following paper:
 * 
 * Anton Beloglazov, and Rajkumar Buyya, "Optimal Online Deterministic Algorithms and Adaptive
 * Heuristics for Energy and Performance Efficient Dynamic Consolidation of Virtual Machines in
 * Cloud Data Centers", Concurrency and Computation: Practice and Experience (CCPE), Volume 24,
 * Issue 13, Pages: 1397-1420, John Wiley & Sons, Ltd, New York, USA, 2012
 * 
 * @author Anton Beloglazov
 * @since CloudSim Toolkit 3.0
 */
public abstract class PowerVmAllocationPolicyAbstractSteady extends VmAllocationPolicySteady {

	/** The vm table. */
	private final Map<String, HostSteady> vmTable = new HashMap<String, HostSteady>();

	/**
	 * Instantiates a new power vm allocation policy abstract.
	 * 
	 * @param list the list
	 */
	public PowerVmAllocationPolicyAbstractSteady(List<? extends HostSteady> list) {
		super(list);
	}

	/*
	 * (non-Javadoc)
	 * @see org.cloudbus.cloudsim.VmAllocationPolicySteady#allocateHostForVm(org.cloudbus.cloudsim.VmSteady)
	 */
	@Override
	public boolean allocateHostForVm(VmSteady vm) {
		return allocateHostForVm(vm, findHostForVm(vm));
	}

	/*
	 * (non-Javadoc)
	 * @see org.cloudbus.cloudsim.VmAllocationPolicySteady#allocateHostForVm(org.cloudbus.cloudsim.VmSteady,
	 * org.cloudbus.cloudsim.HostSteady)
	 */
	@Override
	public boolean allocateHostForVm(VmSteady vm, HostSteady host) {
		if (host == null) {
			Log.formatLine("%.2f: No suitable host found for VM #" + vm.getId() + "\n", CloudSim.clock());
			return false;
		}
		if (host.vmCreate(vm)) { // if vm has been succesfully created in the host
			getVmTable().put(vm.getUid(), host);
			Log.formatLine(
					"%.2f: VM #" + vm.getId() + " has been allocated to the host #" + host.getId(),
					CloudSim.clock());
			return true;
		}
		Log.formatLine(
				"%.2f: Creation of VM #" + vm.getId() + " on the host #" + host.getId() + " failed\n",
				CloudSim.clock());
		return false;
	}

	/**
	 * Find host for vm.
	 * 
	 * @param vm the vm
	 * @return the power host
	 */
	public PowerHostSteady findHostForVm(VmSteady vm) {
		for (PowerHostSteady host : this.<PowerHostSteady> getHostList()) {
			if (host.isSuitableForVm(vm)) {
				return host;
			}
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * @see org.cloudbus.cloudsim.VmAllocationPolicySteady#deallocateHostForVm(org.cloudbus.cloudsim.VmSteady)
	 */
	@Override
	public void deallocateHostForVm(VmSteady vm) {
		HostSteady host = getVmTable().remove(vm.getUid());
		if (host != null) {
			host.vmDestroy(vm);
		}
	}

	/*
	 * (non-Javadoc)
	 * @see org.cloudbus.cloudsim.VmAllocationPolicySteady#getHost(org.cloudbus.cloudsim.VmSteady)
	 */
	@Override
	public HostSteady getHost(VmSteady vm) {
		return getVmTable().get(vm.getUid());
	}

	/*
	 * (non-Javadoc)
	 * @see org.cloudbus.cloudsim.VmAllocationPolicySteady#getHost(int, int)
	 */
	@Override
	public HostSteady getHost(int vmId, int userId) {
		return getVmTable().get(VmSteady.getUid(userId, vmId));
	}

	/**
	 * Gets the vm table.
	 * 
	 * @return the vm table
	 */
	public Map<String, HostSteady> getVmTable() {
		return vmTable;
	}
	@Override
	public void changeMipsOfPes(){
		for (PowerHostSteady host : this.<PowerHostSteady> getHostList()) {
			host.changeMipsOfPes();
		}
	}

}
