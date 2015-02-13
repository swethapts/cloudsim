/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * VmSchedulerSpaceShared is a VMM allocation policy that allocates one or more PeSteady to a VM, and
 * doesn't allow sharing of PEs. If there is no free PEs to the VM, allocation fails. Free PEs are
 * not allocated to VMs
 * 
 * @author Rodrigo N. Calheiros
 * @author Anton Beloglazov
 * @since CloudSim Toolkit 1.0
 */
public class VmSchedulerSpaceSharedSteady extends VmSchedulerSteady {

	/** Map containing VM ID and a vector of PEs allocated to this VM. */
	private Map<String, List<PeSteady>> peAllocationMap;

	/** The free pes vector. */
	private List<PeSteady> freePes;

	/**
	 * Instantiates a new vm scheduler space shared.
	 * 
	 * @param pelist the pelist
	 */
	public VmSchedulerSpaceSharedSteady(List<? extends PeSteady> pelist) {
		super(pelist);
		setPeAllocationMap(new HashMap<String, List<PeSteady>>());
		setFreePes(new ArrayList<PeSteady>());
		getFreePes().addAll(pelist);
	}

	/*
	 * (non-Javadoc)
	 * @see org.cloudbus.cloudsim.VmSchedulerSteady#allocatePesForVm(org.cloudbus.cloudsim.VmSteady,
	 * java.util.List)
	 */
	@Override
	public boolean allocatePesForVm(VmSteady vm, List<Double> mipsShare) {
		// if there is no enough free PEs, fails
		if (getFreePes().size() < mipsShare.size()) {
			return false;
		}

		List<PeSteady> selectedPes = new ArrayList<PeSteady>();
		Iterator<PeSteady> peIterator = getFreePes().iterator();
		PeSteady pe = peIterator.next();
		double totalMips = 0;
		for (Double mips : mipsShare) {
			if (mips <= pe.getMips()) {
				selectedPes.add(pe);
				if (!peIterator.hasNext()) {
					break;
				}
				pe = peIterator.next();
				totalMips += mips;
			}
		}
		if (mipsShare.size() > selectedPes.size()) {
			return false;
		}

		getFreePes().removeAll(selectedPes);

		getPeAllocationMap().put(vm.getUid(), selectedPes);
		getMipsMap().put(vm.getUid(), mipsShare);
		setAvailableMips(getAvailableMips() - totalMips);
		return true;
	}

	/*
	 * (non-Javadoc)
	 * @see org.cloudbus.cloudsim.VmSchedulerSteady#deallocatePesForVm(org.cloudbus.cloudsim.VmSteady)
	 */
	@Override
	public void deallocatePesForVm(VmSteady vm) {
		getFreePes().addAll(getPeAllocationMap().get(vm.getUid()));
		getPeAllocationMap().remove(vm.getUid());

		double totalMips = 0;
		for (double mips : getMipsMap().get(vm.getUid())) {
			totalMips += mips;
		}
		setAvailableMips(getAvailableMips() + totalMips);

		getMipsMap().remove(vm.getUid());
	}

	/**
	 * Sets the pe allocation map.
	 * 
	 * @param peAllocationMap the pe allocation map
	 */
	protected void setPeAllocationMap(Map<String, List<PeSteady>> peAllocationMap) {
		this.peAllocationMap = peAllocationMap;
	}

	/**
	 * Gets the pe allocation map.
	 * 
	 * @return the pe allocation map
	 */
	protected Map<String, List<PeSteady>> getPeAllocationMap() {
		return peAllocationMap;
	}

	/**
	 * Sets the free pes vector.
	 * 
	 * @param freePes the new free pes vector
	 */
	protected void setFreePes(List<PeSteady> freePes) {
		this.freePes = freePes;
	}

	/**
	 * Gets the free pes vector.
	 * 
	 * @return the free pes vector
	 */
	protected List<PeSteady> getFreePes() {
		return freePes;
	}

}
