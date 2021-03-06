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
import static java.lang.Math.abs;

import org.cloudbus.cloudsim.HostSteady;
import org.cloudbus.cloudsim.VmSteady;
import org.cloudbus.cloudsim.examples.power.VmSlaCloudletListListSteady;

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
public class PowerVmAllocationPolicyFfCtAverageSteady extends PowerVmAllocationPolicyAbstractSteady {

	/**
	 * Instantiates a new power vm allocation policy simple.
	 * 
	 * @param list the list
	 */
	public PowerVmAllocationPolicyFfCtAverageSteady(List<? extends HostSteady> list) {
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
	public PowerHostSteady findHostForVm(VmSteady vm) {
		for (PowerHostSteady host : this.<PowerHostSteady> getHostList()) {
//			double minCt = Double.MAX_VALUE;
			if (host.isSuitableForVm(vm)) {
				try {
					//double utilizationAfterAllocation = getMaxUtilizationAfterAllocation(host, vm);
					//if (utilizationAfterAllocation != -1) {
						List<VmSteady> vmList = host.getVmList();
						double avgHostCt = 0;
						int numVms = 0;
						if (vmList.size()==0) { //ct threshold
							return host;
						}
						for(VmSteady vm1 : vmList){ //find host max ct
							//if(VmSlaCloudletListListSteady.getByMips((int)vm1.getMips()).getSla()>maxHostCt){
							avgHostCt+=VmSlaCloudletListListSteady.getById((int)vm1.getId()).getSla();
							numVms++;
							//}
						}
						avgHostCt=avgHostCt/numVms;
						double ctDiff = VmSlaCloudletListListSteady.getById((int)vm.getId()).getSla();
						//System.out.println("Ct......would be:"+ctDiff + " now  "+ VmSlaCloudletListListSteady.getByMips((int)vm.getMips()).getSla()+"num vms: " + vmList.size());
//						if ((ctDiff <= 4.00*avgHostCt && ctDiff >= 0.10*avgHostCt) || vmList==null) { //ct threshold 95%
						if ((Math.abs(ctDiff-avgHostCt)/avgHostCt <= 0.10) || vmList==null) { //ct threshold 05%
							System.out.print(host.getAvailableMips()+" :available; total: "+host.getTotalMips()+" llll for" + host.getId());
							return host;
						}
						//if((host.getUtilizationOfCpu()<=0.8)){
						//	System.out.print(host.getUtilizationMips()/host.getTotalMips()+"llll");
						//	return host;
						//}
					//}
				} catch (Exception e) {
				}
			}
		}
		return null;
	}

}
