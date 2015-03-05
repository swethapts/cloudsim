/*
 *
 */
package org.cloudbus.cloudsim.examples.power.steady;

import java.util.ArrayList;
import java.util.List;

import org.cloudbus.cloudsim.Cloudlet;
import org.cloudbus.cloudsim.UtilizationModel;
import org.cloudbus.cloudsim.UtilizationModelNull;
import org.cloudbus.cloudsim.UtilizationModelFull;
import org.cloudbus.cloudsim.examples.power.ConstantsSteady;

/**
 * The Helper class for the steady workload.
 * 
 * If you are using any algorithms, policies or workload included in the power
 * package please cite the following paper:
 * 
 * Anton Beloglazov, and Rajkumar Buyya, "Optimal Online Deterministic
 * Algorithms and Adaptive Heuristics for Energy and Performance Efficient
 * Dynamic Consolidation of Virtual Machines in Cloud Data Centers", Concurrency
 * and Computation: Practice and Experience (CCPE), Volume 24, Issue 13, Pages:
 * 1397-1420, John Wiley & Sons, Ltd, New York, USA, 2012
 * 
 * @author Anton Beloglazov
 * @since Jan 5, 2012
 */
public class SteadyHelper {

	/**
	 * Creates the cloudlet list.
	 * 
	 * @param brokerId
	 *            the broker id
	 * @param cloudletsNumber
	 *            the cloudlets number
	 * 
	 * @return the list< cloudlet>
	 */
	public static List<Cloudlet> createCloudletList(int brokerId,
			int cloudletsNumber) {
		List<Cloudlet> list = new ArrayList<Cloudlet>();

		long fileSize = 300;
		long outputSize = 300;
		long seed = SteadyConstants.CLOUDLET_UTILIZATION_SEED;
		UtilizationModel utilizationModelNull = new UtilizationModelNull();

		for (int i = 0; i < cloudletsNumber; i++) {
			Cloudlet cloudlet = null;
			if (seed == -1) {
				cloudlet = new Cloudlet(i, ConstantsSteady.CLOUDLET_LENGTH[ConstantsSteady.VM_MIPS[i%ConstantsSteady.VM_MIPS.length][1]],/*change this or pass this*/
						ConstantsSteady.CLOUDLET_PES, fileSize, outputSize,
						new UtilizationModelFull(), utilizationModelNull,
						utilizationModelNull);
			} else {
				cloudlet = new Cloudlet(i, ConstantsSteady.CLOUDLET_LENGTH[ConstantsSteady.VM_MIPS[i%ConstantsSteady.VM_MIPS.length][1]],
						ConstantsSteady.CLOUDLET_PES, fileSize, outputSize,
						new UtilizationModelFull(),
						utilizationModelNull, utilizationModelNull);
				System.out.println(ConstantsSteady.CLOUDLET_LENGTH[ConstantsSteady.VM_MIPS[i%ConstantsSteady.VM_MIPS.length][1]]+"xx");
			}
			cloudlet.setUserId(brokerId);
			cloudlet.setVmId(i);
			list.add(cloudlet);
		}

		return list;
	}

}
