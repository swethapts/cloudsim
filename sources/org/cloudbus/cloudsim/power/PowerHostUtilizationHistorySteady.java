/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.power;

import java.util.List;

import org.cloudbus.cloudsim.PeSteady;
import org.cloudbus.cloudsim.VmSchedulerSteady;
import org.cloudbus.cloudsim.power.models.PowerModelSteady;
import org.cloudbus.cloudsim.provisioners.BwProvisionerSteady;
import org.cloudbus.cloudsim.provisioners.RamProvisionerSteady;
import org.cloudbus.cloudsim.util.MathUtil;

/**
 * The class of a host that stores its CPU utilization history. The history is used by VM allocation
 * and selection policies.
 * 
 * If you are using any algorithms, policies or workload included in the power package please cite
 * the following paper:
 * 
 * Anton Beloglazov, and Rajkumar Buyya, "Optimal Online Deterministic Algorithms and Adaptive
 * Heuristics for Energy and Performance Efficient Dynamic Consolidation of Virtual Machines in
 * Cloud Data Centers", Concurrency and Computation: Practice and Experience (CCPE), Volume 24,
 * Issue 13, Pages: 1397-1420, John Wiley & Sons, Ltd, New York, USA, 2012
 * 
 * @author Anton Beloglazov
 * @since CloudSim Toolkit 2.0
 */
public class PowerHostUtilizationHistorySteady extends PowerHostSteady {

	/**
	 * Instantiates a new power host utilization history.
	 * 
	 * @param id the id
	 * @param ramProvisioner the ram provisioner
	 * @param bwProvisioner the bw provisioner
	 * @param storage the storage
	 * @param peList the pe list
	 * @param vmScheduler the vm scheduler
	 * @param powerModel the power model
	 */
	public PowerHostUtilizationHistorySteady(
			int id,
			RamProvisionerSteady ramProvisioner,
			BwProvisionerSteady bwProvisioner,
			long storage,
			List<? extends PeSteady> peList,
			VmSchedulerSteady vmScheduler,
			PowerModelSteady powerModel) {
		super(id, ramProvisioner, bwProvisioner, storage, peList, vmScheduler, powerModel);
	}

	/**
	 * Gets the host utilization history.
	 * 
	 * @return the host utilization history
	 */
	protected double[] getUtilizationHistory() {
		double[] utilizationHistory = new double[PowerVmSteady.HISTORY_LENGTH];
		double hostMips = getTotalMips();
		for (PowerVmSteady vm : this.<PowerVmSteady> getVmList()) {
			for (int i = 0; i < vm.getUtilizationHistory().size(); i++) {
				utilizationHistory[i] += vm.getUtilizationHistory().get(i) * vm.getMips() / hostMips;
			}
		}
		return MathUtil.trimZeroTail(utilizationHistory);
	}

}
