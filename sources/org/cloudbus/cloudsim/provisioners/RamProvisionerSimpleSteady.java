/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.provisioners;

import java.util.HashMap;
import java.util.Map;

import org.cloudbus.cloudsim.VmSteady;

/**
 * RamProvisionerSimple is an extension of RamProvisioner which uses a best-effort policy to
 * allocate memory to a VM.
 * 
 * @author Rodrigo N. Calheiros
 * @author Anton Beloglazov
 * @since CloudSim Toolkit 1.0
 */
public class RamProvisionerSimpleSteady extends RamProvisionerSteady {

	/** The RAM table. */
	private Map<String, Integer> ramTable;

	/**
	 * Instantiates a new ram provisioner simple.
	 * 
	 * @param availableRam the available ram
	 */
	public RamProvisionerSimpleSteady(int availableRam) {
		super(availableRam);
		setRamTable(new HashMap<String, Integer>());
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.RamProvisioner#allocateRamForVm(cloudsim.VmSteady, int)
	 */
	@Override
	public boolean allocateRamForVm(VmSteady vm, int ram) {
		int maxRam = vm.getRam();

		if (ram >= maxRam) {
			ram = maxRam;
		}

		deallocateRamForVm(vm);

		if (getAvailableRam() >= ram) {
			setAvailableRam(getAvailableRam() - ram);
			getRamTable().put(vm.getUid(), ram);
			vm.setCurrentAllocatedRam(getAllocatedRamForVm(vm));
			return true;
		}

		vm.setCurrentAllocatedRam(getAllocatedRamForVm(vm));

		return false;
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.RamProvisioner#getAllocatedRamForVm(cloudsim.VmSteady)
	 */
	@Override
	public int getAllocatedRamForVm(VmSteady vm) {
		if (getRamTable().containsKey(vm.getUid())) {
			return getRamTable().get(vm.getUid());
		}
		return 0;
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.RamProvisioner#deallocateRamForVm(cloudsim.VmSteady)
	 */
	@Override
	public void deallocateRamForVm(VmSteady vm) {
		if (getRamTable().containsKey(vm.getUid())) {
			int amountFreed = getRamTable().remove(vm.getUid());
			setAvailableRam(getAvailableRam() + amountFreed);
			vm.setCurrentAllocatedRam(0);
		}
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.RamProvisioner#deallocateRamForVm(cloudsim.VmSteady)
	 */
	@Override
	public void deallocateRamForAllVms() {
		super.deallocateRamForAllVms();
		getRamTable().clear();
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.RamProvisioner#isSuitableForVm(cloudsim.VmSteady, int)
	 */
	@Override
	public boolean isSuitableForVm(VmSteady vm, int ram) {
		int allocatedRam = getAllocatedRamForVm(vm);
		boolean result = allocateRamForVm(vm, ram);
		deallocateRamForVm(vm);
		if (allocatedRam > 0) {
			allocateRamForVm(vm, allocatedRam);
		}
		return result;
	}

	/**
	 * Gets the ram table.
	 * 
	 * @return the ram table
	 */
	protected Map<String, Integer> getRamTable() {
		return ramTable;
	}

	/**
	 * Sets the ram table.
	 * 
	 * @param ramTable the ram table
	 */
	protected void setRamTable(Map<String, Integer> ramTable) {
		this.ramTable = ramTable;
	}

}
