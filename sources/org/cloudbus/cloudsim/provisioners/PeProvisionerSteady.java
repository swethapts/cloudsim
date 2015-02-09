/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.provisioners;

import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;

import org.cloudbus.cloudsim.VmSteady;

/**
 * The Class PeProvisioner.
 * 
 * @author Anton Beloglazov
 * @since CloudSim Toolkit 2.0
 */
public abstract class PeProvisionerSteady {

	/** The mips. */
	private double mips;

	/** The available mips. */
	private double availableMips;

	private List<Double> mipsList;
	/**
	 * Creates the new PeProvisioner.
	 * 
	 * @param mips overall amount of MIPS available in the Pe
	 * 
	 * @pre mips>=0
	 * @post $none
	 */
	public PeProvisionerSteady(double mips) {
		setMips(mips);
		setAvailableMips(mips);
		if(mipsList.size()==0){
			setMipsList(new ArrayList<Double>(Arrays.asList(mips)));
		}
	}
	public PeProvisionerSteady(List<Double> mipsList) {
		setMipsList(mipsList);
		mips = mipsList.get(mipsList.size()-2);
		setMips(mips);
		setAvailableMips(mips);
	}

	public void setMipsList(List<Double> mipsList) {
		this.mipsList = mipsList;
		setMips(mipsList.get(mipsList.size()-2));
		
	}
	public List<Double> getMipsList() {
		return mipsList;
	}
	/**
	 * Allocates MIPS for a given VM.
	 * 
	 * @param vm virtual machine for which the MIPS are being allocated
	 * @param mips the mips
	 * 
	 * @return $true if the MIPS could be allocated; $false otherwise
	 * 
	 * @pre $none
	 * @post $none
	 */
	public abstract boolean allocateMipsForVm(VmSteady vm, double mips);

	/**
	 * Allocates MIPS for a given VM.
	 * 
	 * @param vmUid the vm uid
	 * @param mips the mips
	 * 
	 * @return $true if the MIPS could be allocated; $false otherwise
	 * 
	 * @pre $none
	 * @post $none
	 */
	public abstract boolean allocateMipsForVm(String vmUid, double mips);

	/**
	 * Allocates MIPS for a given VM.
	 * 
	 * @param vm virtual machine for which the MIPS are being allocated
	 * @param mips the mips for each virtual Pe
	 * 
	 * @return $true if the MIPS could be allocated; $false otherwise
	 * 
	 * @pre $none
	 * @post $none
	 */
	public abstract boolean allocateMipsForVm(VmSteady vm, List<Double> mips);

	/**
	 * Gets allocated MIPS for a given VM.
	 * 
	 * @param vm virtual machine for which the MIPS are being allocated
	 * 
	 * @return array of allocated MIPS
	 * 
	 * @pre $none
	 * @post $none
	 */
	public abstract List<Double> getAllocatedMipsForVm(VmSteady vm);

	/**
	 * Gets total allocated MIPS for a given VM for all PEs.
	 * 
	 * @param vm virtual machine for which the MIPS are being allocated
	 * 
	 * @return total allocated MIPS
	 * 
	 * @pre $none
	 * @post $none
	 */
	public abstract double getTotalAllocatedMipsForVm(VmSteady vm);

	/**
	 * Gets allocated MIPS for a given VM for a given virtual Pe.
	 * 
	 * @param vm virtual machine for which the MIPS are being allocated
	 * @param peId the pe id
	 * 
	 * @return allocated MIPS
	 * 
	 * @pre $none
	 * @post $none
	 */
	public abstract double getAllocatedMipsForVmByVirtualPeId(VmSteady vm, int peId);

	/**
	 * Releases MIPS used by a VM.
	 * 
	 * @param vm the vm
	 * 
	 * @pre $none
	 * @post none
	 */
	public abstract void deallocateMipsForVm(VmSteady vm);

	/**
	 * Releases MIPS used by all VMs.
	 * 
	 * @pre $none
	 * @post none
	 */
	public void deallocateMipsForAllVms() {
		setAvailableMips(getMips());
	}

	/**
	 * Gets the MIPS.
	 * 
	 * @return the MIPS
	 */
	public double getMips() {
		return mips;
	}

	/**
	 * Sets the MIPS.
	 * 
	 * @param mips the MIPS to set
	 */
	public void setMips(double mips) {
		this.mips = mips;
	}

	/**
	 * Gets the available MIPS in the PE.
	 * 
	 * @return available MIPS
	 * 
	 * @pre $none
	 * @post $none
	 */
	public double getAvailableMips() {
		return availableMips;
	}

	/**
	 * Sets the available MIPS.
	 * 
	 * @param availableMips the availableMips to set
	 */
	protected void setAvailableMips(double availableMips) {
		this.availableMips = availableMips;
	}

	/**
	 * Gets the total allocated MIPS.
	 * 
	 * @return the total allocated MIPS
	 */
	public double getTotalAllocatedMips() {
		double totalAllocatedMips = getMips() - getAvailableMips();
		if (totalAllocatedMips > 0) {
			return totalAllocatedMips;
		}
		return 0;
	}

	/**
	 * Gets the utilization of the Pe in percents.
	 * 
	 * @return the utilization
	 */
	public double getUtilization() {
		return getTotalAllocatedMips() / getMips();
	}
	public int getMipsIndex(double mips){
		return(mipsList.indexOf(mips));
	}

}
