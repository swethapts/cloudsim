/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.lists;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.cloudbus.cloudsim.VmSteady;

/**
 * VmList is a collection of operations on lists of VMs.
 * 
 * @author Anton Beloglazov
 * @since CloudSim Toolkit 2.0
 */
public class VmListSteady {

	/**
	 * Return a reference to a VmSteady object from its ID.
	 * 
	 * @param id ID of required VM
	 * @param vmList the vm list
	 * @return VmSteady with the given ID, $null if not found
	 * @pre $none
	 * @post $none
	 */
	public static <T extends VmSteady> T getById(List<T> vmList, int id) {
		for (T vm : vmList) {
			if (vm.getId() == id) {
				return vm;
			}
		}
		return null;
	}

	/**
	 * Return a reference to a VmSteady object from its ID and user ID.
	 * 
	 * @param id ID of required VM
	 * @param userId the user ID
	 * @param vmList the vm list
	 * @return VmSteady with the given ID, $null if not found
	 * @pre $none
	 * @post $none
	 */
	public static <T extends VmSteady> T getByIdAndUserId(List<T> vmList, int id, int userId) {
		for (T vm : vmList) {
			if (vm.getId() == id && vm.getUserId() == userId) {
				return vm;
			}
		}
		return null;
	}
	public static <T extends VmSteady> void sortByMips(List<T> vmList) {
		Collections.sort(vmList, new Comparator<T>() {

			@Override
			public int compare(T a, T b) throws ClassCastException {
				Double aMips = a.getMips();
				Double bMips = b.getMips();
				return bMips.compareTo(aMips);
			}
		});
	}

}
