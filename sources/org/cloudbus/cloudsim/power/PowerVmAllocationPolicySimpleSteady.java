/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.power;

import java.util.List;
import java.util.Map;

import org.cloudbus.cloudsim.HostSteady;
import org.cloudbus.cloudsim.Log;
import org.cloudbus.cloudsim.VmSteady;
import org.cloudbus.cloudsim.core.CloudSim;

/**
 * This a simple class representing a simple VM allocation policy that does not perform any
 * optimization of the VM allocation.
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
public class PowerVmAllocationPolicySimpleSteady extends PowerVmAllocationPolicyAbstractSteady {

	/**
	 * Instantiates a new power vm allocation policy simple.
	 * 
	 * @param list the list
	 */
	public PowerVmAllocationPolicySimpleSteady(List<? extends HostSteady> list) {
		super(list);
	}

	/*
	 * (non-Javadoc)
	 * @see org.cloudbus.cloudsim.VmAllocationPolicy#optimizeAllocation(java.util.List)
	 */
	@Override
	public List<Map<String, Object>> optimizeAllocation(List<? extends VmSteady> vmList) {
		// This policy does not optimize the VM allocation
		return null;
	}
	@Override
	public void changeMipsOfPes(){
		for (PowerHostSteady host : this.<PowerHostSteady> getHostList()) {
			host.changeMipsOfPes();
		}
	}
	@Override
	public void reallocateRemainingMips(){
		for (PowerHostSteady host : this.<PowerHostSteady> getHostList()) {
			host.reallocateRemainingMips();
		}
	}
	@Override
	public boolean allocateHostForVm(VmSteady vm, HostSteady host) {
		if (host == null) {
			Log.formatLine("%.2f: No suitable host found for VM #" + vm.getId() + "\n", CloudSim.clock());
			return false;
		}
		if (host.vmCreate(vm)) { // if vm has been succesfully created in the host
			getVmTable().put(vm.getUid(), host);
			Log.formatLine(
					"%.2f: VM #" + vm.getId() + " of MIPS " + vm.getMips()+" has been alLlocated to the host #" + host.getId(),
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
	@Override
	public PowerHostSteady findHostForVm(VmSteady vm) {
		for (PowerHostSteady host : this.<PowerHostSteady> getHostList()) {
			if (host.isSuitableForVm(vm)) {
				return host;
			}
			//else{
			//	System.out.println("rejecting host#"+ host.getId());
			//}
		}
		return null;
	}

}
