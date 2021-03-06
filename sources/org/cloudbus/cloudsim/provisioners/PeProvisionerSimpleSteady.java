/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.provisioners;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.cloudbus.cloudsim.VmSteady;

/**
 * The Class PeProvisionerSimple.
 * 
 * @author Anton Beloglazov
 * @since CloudSim Toolkit 2.0
 */
public class PeProvisionerSimpleSteady extends PeProvisionerSteady {

	/** The pe table. */
	private Map<String, List<Double>> peTable;

	/**
	 * Creates the PeProvisionerSimple object.
	 * 
	 * @param availableMips the available mips
	 * 
	 * @pre $none
	 * @post $none
	 */
	public PeProvisionerSimpleSteady(double availableMips) {
		super(availableMips);
		setPeTable(new HashMap<String, ArrayList<Double>>());
	}
	public PeProvisionerSimpleSteady(List<Double> mipsList) {
		super(mipsList);
		setPeTable(new HashMap<String, ArrayList<Double>>());
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.PeProvisioner#allocateMipsForVM(cloudsim.power.VM, int)
	 */
	@Override
	public boolean allocateMipsForVm(VmSteady vm, double mips) {
		return allocateMipsForVm(vm.getUid(), mips);
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.PeProvisioner#allocateMipsForVm(java.lang.String, double)
	 */
	@Override
	public boolean allocateMipsForVm(String vmUid, double mips) {
//		System.out.println(new Exception().getStackTrace()[1].getClassName()+new Exception().getStackTrace()[1].getMethodName());
		if (getAvailableMips() < mips) {
			return false;
		}
		List<Double> allocatedMips;

		if (getPeTable().containsKey(vmUid)) {
			allocatedMips = getPeTable().get(vmUid);
		} else {
			allocatedMips = new ArrayList<Double>();
		}

		allocatedMips.add(mips);
//		System.out.println("xx: " + allocatedMips.toString()+" getAvailableMips(): "+ getAvailableMips() + " mips: "+mips);

		setAvailableMips(getAvailableMips() - mips);
		getPeTable().put(vmUid, allocatedMips);
//		System.out.println("PeProvisioner#allocateMipsForVm " + vmUid);
//		Map<String, List<Double>> peTablexx = getPeTable();
//		for (Map.Entry<String, List<Double>> entry : peTablexx.entrySet()) {
//		    String key = entry.getKey();
//		    List<Double> values = entry.getValue();
//		    for (Double value: values)
//		    	System.out.println("xxx "+value.floatValue()+ " " + key);
//		}
//		System.out.println("----");
		
		return true;
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.PeProvisioner#allocateMipsForVM(cloudsim.power.VM,
	 * java.util.ArrayList)
	 */
	@Override
	public boolean allocateMipsForVm(VmSteady vm, List<Double> mips) {
		int totalMipsToAllocate = 0;
		for (double _mips : mips) {
			totalMipsToAllocate += _mips;
		}
		if (getAvailableMips() + getTotalAllocatedMipsForVm(vm) < totalMipsToAllocate) {
			return false;
		}

		setAvailableMips(getAvailableMips() + getTotalAllocatedMipsForVm(vm) - totalMipsToAllocate);

		getPeTable().put(vm.getUid(), mips);
		
		return true;
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.PeProvisioner#deallocateMipsForAllVms()
	 */
	@Override
	public void deallocateMipsForAllVms() {
		super.deallocateMipsForAllVms();
		getPeTable().clear();
	}

	/*
	 * (non-Javadoc)
	 * @see
	 * cloudsim.provisioners.PeProvisioner#getAllocatedMipsForVMByVirtualPeId(cloudsim.power.VM,
	 * int)
	 */
	@Override
	public double getAllocatedMipsForVmByVirtualPeId(VmSteady vm, int peId) {
		if (getPeTable().containsKey(vm.getUid())) {
			try {
				return getPeTable().get(vm.getUid()).get(peId);
			} catch (Exception e) {
			}
		}
		return 0;
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.PeProvisioner#getAllocatedMipsForVM(cloudsim.power.VM)
	 */
	@Override
	public List<Double> getAllocatedMipsForVm(VmSteady vm) {
		if (getPeTable().containsKey(vm.getUid())) {
			return getPeTable().get(vm.getUid());
		}
		return null;
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.PeProvisioner#getTotalAllocatedMipsForVM(cloudsim.power.VM)
	 */
	@Override
	public double getTotalAllocatedMipsForVm(VmSteady vm) {
		if (getPeTable().containsKey(vm.getUid())) {
			double totalAllocatedMips = 0.0;
			for (double mips : getPeTable().get(vm.getUid())) {
				totalAllocatedMips += mips;
			}
			return totalAllocatedMips;
		}
		return 0;
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.provisioners.PeProvisioner#deallocateMipsForVM(cloudsim.power.VM)
	 */
	@Override
	public void deallocateMipsForVm(VmSteady vm) {
		if (getPeTable().containsKey(vm.getUid())) {
			for (double mips : getPeTable().get(vm.getUid())) {
				setAvailableMips(getAvailableMips() + mips);
			}
			getPeTable().remove(vm.getUid());
		}
	}

	/**
	 * Gets the pe table.
	 * 
	 * @return the peTable
	 */
	protected Map<String, List<Double>> getPeTable() {
		return peTable;
	}

	/**
	 * Sets the pe table.
	 * 
	 * @param peTable the peTable to set
	 */
	@SuppressWarnings("unchecked")
	protected void setPeTable(Map<String, ? extends List<Double>> peTable) {
		this.peTable = (Map<String, List<Double>>) peTable;
	}

}
