/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.lists;

import java.util.List;

import org.cloudbus.cloudsim.Log;
import org.cloudbus.cloudsim.PeSteady;
import org.cloudbus.cloudsim.VmSteady;

/**
 * PeList is a collection of operations on lists of PEs.
 * 
 * @author Anton Beloglazov
 * @since CloudSim Toolkit 2.0
 */
public class PeListSteady {

	/**
	 * Gets MIPS Rating for a specified PeSteady ID.
	 * 
	 * @param id the PeSteady ID
	 * @param peList the pe list
	 * @return the MIPS rating if exists, otherwise returns -1
	 * @pre id >= 0
	 * @post $none
	 */
	public static <T extends PeSteady> PeSteady getById(List<T> peList, int id) {
		for (PeSteady pe : peList) {
			if (pe.getId() == id) {
				return pe;
			}
		}
		return null;
	}

	/**
	 * Gets MIPS Rating for a specified PeSteady ID.
	 * 
	 * @param id the PeSteady ID
	 * @param peList the pe list
	 * @return the MIPS rating if exists, otherwise returns -1
	 * @pre id >= 0
	 * @post $none
	 */
	public static <T extends PeSteady> int getMips(List<T> peList, int id) {
		PeSteady pe = getById(peList, id);
		if (pe != null) {
			return pe.getMips();
		}
		return -1;
	}

	/**
	 * Gets total MIPS Rating for all PEs.
	 * 
	 * @param peList the pe list
	 * @return the total MIPS Rating
	 * @pre $none
	 * @post $none
	 */
	public static <T extends PeSteady> int getTotalMips(List<T> peList) {
		int totalMips = 0;
		for (PeSteady pe : peList) {
			totalMips += pe.getMips();
		}
		return totalMips;
	}

	/**
	 * Gets the max utilization among by all PEs.
	 * 
	 * @param peList the pe list
	 * @return the utilization
	 */
	public static <T extends PeSteady> double getMaxUtilization(List<T> peList) {
		double maxUtilization = 0;
		for (PeSteady pe : peList) {
			double utilization = pe.getPeProvisioner().getUtilization();
			if (utilization > maxUtilization) {
				maxUtilization = utilization;
			}
		}
		return maxUtilization;
	}

	/**
	 * Gets the max utilization among by all PEs allocated to the VM.
	 * 
	 * @param vm the vm
	 * @param peList the pe list
	 * @return the utilization
	 */
	public static <T extends PeSteady> double getMaxUtilizationAmongVmsPes(List<T> peList, VmSteady vm) {
		double maxUtilization = 0;
		for (PeSteady pe : peList) {
			if (pe.getPeProvisioner().getAllocatedMipsForVm(vm) == null) {
				continue;
			}
			double utilization = pe.getPeProvisioner().getUtilization();
			if (utilization > maxUtilization) {
				maxUtilization = utilization;
			}
		}
		return maxUtilization;
	}

	/**
	 * Gets a PeSteady ID which is FREE.
	 * 
	 * @param peList the pe list
	 * @return a PeSteady ID if it is FREE, otherwise returns -1
	 * @pre $none
	 * @post $none
	 */
	public static <T extends PeSteady> PeSteady getFreePe(List<T> peList) {
		for (PeSteady pe : peList) {
			if (pe.getStatus() == PeSteady.FREE) {
				return pe;
			}
		}
		return null;
	}

	/**
	 * Gets the number of <tt>FREE</tt> or non-busy PeSteady.
	 * 
	 * @param peList the pe list
	 * @return number of PeSteady
	 * @pre $none
	 * @post $result >= 0
	 */
	public static <T extends PeSteady> int getNumberOfFreePes(List<T> peList) {
		int cnt = 0;
		for (PeSteady pe : peList) {
			if (pe.getStatus() == PeSteady.FREE) {
				cnt++;
			}
		}
		return cnt;
	}

	/**
	 * Sets the PeSteady status.
	 * 
	 * @param status PeSteady status, either <tt>PeSteady.FREE</tt> or <tt>PeSteady.BUSY</tt>
	 * @param id the id
	 * @param peList the pe list
	 * @return <tt>true</tt> if the PeSteady status has been changed, <tt>false</tt> otherwise (PeSteady id might
	 *         not be exist)
	 * @pre peID >= 0
	 * @post $none
	 */
	public static <T extends PeSteady> boolean setPeStatus(List<T> peList, int id, int status) {
		PeSteady pe = getById(peList, id);
		if (pe != null) {
			pe.setStatus(status);
			return true;
		}
		return false;
	}

	/**
	 * Gets the number of <tt>BUSY</tt> PeSteady.
	 * 
	 * @param peList the pe list
	 * @return number of PeSteady
	 * @pre $none
	 * @post $result >= 0
	 */
	public static <T extends PeSteady> int getNumberOfBusyPes(List<T> peList) {
		int cnt = 0;
		for (PeSteady pe : peList) {
			if (pe.getStatus() == PeSteady.BUSY) {
				cnt++;
			}
		}
		return cnt;
	}

	/**
	 * Sets the status of PEs of this machine to FAILED. NOTE: <tt>resName</tt> and
	 * <tt>machineID</tt> are used for debugging purposes, which is <b>ON</b> by default. Use
	 * {@link #setStatusFailed(boolean)} if you do not want this information.
	 * 
	 * @param resName the name of the resource
	 * @param hostId the id of this machine
	 * @param failed the new value for the "failed" parameter
	 */
	public static <T extends PeSteady> void setStatusFailed(
			List<T> peList,
			String resName,
			int hostId,
			boolean failed) {
		String status = null;
		if (failed) {
			status = "FAILED";
		} else {
			status = "WORKING";
		}

		Log.printLine(resName + " - Machine: " + hostId + " is " + status);

		setStatusFailed(peList, failed);
	}

	/**
	 * Sets the status of PEs of this machine to FAILED.
	 * 
	 * @param failed the new value for the "failed" parameter
	 * @param peList the pe list
	 */
	public static <T extends PeSteady> void setStatusFailed(List<T> peList, boolean failed) {
		// a loop to set the status of all the PEs in this machine
		for (PeSteady pe : peList) {
			if (failed) {
				pe.setStatus(PeSteady.FAILED);
			} else {
				pe.setStatus(PeSteady.FREE);
			}
		}
	}
	public static <T extends PeSteady> int getMipsIndex(List<T> peList,double mips){
		int freqIndex=-1;
		for(PeSteady pe : peList){
			if(freqIndex==pe.getMipsIndex(mips) || freqIndex==-1){
				freqIndex=pe.getMipsIndex(mips);
			}
		}
		return freqIndex;
	}

}