package org.cloudbus.cloudsim.examples.power.planetlab;

import java.io.IOException;

/**
 * A simulation of a heterogeneous power aware data center that applies the
 * Local Regression Robust (LRR) VM allocation policy and Maximum Correlation
 * (MC) VM selection policy.
 * 
 * This example uses a real PlanetLab workload: 20110303.
 * 
 * The remaining configuration parameters are in the Constants and
 * PlanetLabConstants classes.
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
public class LrrMc {

	/**
	 * The main method.
	 * 
	 * @param args
	 *            the arguments
	 * @throws IOException
	 *             Signals that an I/O exception has occurred.
	 */
	public static void main(String[] args) throws IOException {
		boolean enableOutput = true;
		boolean outputToFile = false;
		String inputFolder = LrrMc.class.getClassLoader()
				.getResource("workload/planetlab").getPath();
		String outputFolder = "output";
		String workload = "20110303"; // PlanetLab workload
		String vmAllocationPolicy = "lrr"; // Local Regression Robust (LRR) VM
											// allocation policy
		String vmSelectionPolicy = "mc"; // Maximum Correlation (MC) VM
											// selection policy
		String parameter = "1.2"; // the safety parameter of the LRR policy

		new PlanetLabRunner(enableOutput, outputToFile, inputFolder,
				outputFolder, workload, vmAllocationPolicy, vmSelectionPolicy,
				parameter);
	}

}