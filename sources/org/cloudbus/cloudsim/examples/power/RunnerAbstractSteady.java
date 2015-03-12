package org.cloudbus.cloudsim.examples.power;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.cloudbus.cloudsim.Cloudlet;
import org.cloudbus.cloudsim.DatacenterBrokerSteady;
import org.cloudbus.cloudsim.Log;
import org.cloudbus.cloudsim.VmSteady;
import org.cloudbus.cloudsim.VmAllocationPolicySteady;
import org.cloudbus.cloudsim.core.CloudSim;
import org.cloudbus.cloudsim.power.PowerDatacenterSteady;
import org.cloudbus.cloudsim.power.PowerHostSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyMigrationAbstractSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyMigrationInterQuartileRangeSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyMigrationLocalRegressionSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyMigrationLocalRegressionRobustSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyMigrationMedianAbsoluteDeviationSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyMigrationStaticThresholdSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicySimpleSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicySimpleSteadyModified;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyBestFitSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyBestFitCtSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyBestFitCtAverageSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyFfCtSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyFfCtAverageSteady;
import org.cloudbus.cloudsim.power.PowerVmAllocationPolicyWorstFitSteady;
import org.cloudbus.cloudsim.power.PowerVmSelectionPolicySteady;
import org.cloudbus.cloudsim.power.PowerVmSelectionPolicyMaximumCorrelationSteady;
import org.cloudbus.cloudsim.power.PowerVmSelectionPolicyMinimumMigrationTimeSteady;
import org.cloudbus.cloudsim.power.PowerVmSelectionPolicyMinimumUtilizationSteady;
import org.cloudbus.cloudsim.power.PowerVmSelectionPolicyRandomSelectionSteady;

/**
 * The Class RunnerAbstract.
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
 */
public abstract class RunnerAbstractSteady {

	/** The enable output. */
	private static boolean enableOutput;

	/** The broker. */

	protected static DatacenterBrokerSteady broker;

	/** The cloudlet list. */
	protected static List<Cloudlet> cloudletList;

	/** The vm list. */
	protected static List<VmSteady> vmList;

	/** The host list. */
	protected static List<PowerHostSteady> hostList;

	/**
	 * Run.
	 * 
	 * @param enableOutput the enable output
	 * @param outputToFile the output to file
	 * @param inputFolder the input folder
	 * @param outputFolder the output folder
	 * @param workload the workload
	 * @param vmAllocationPolicy the vm allocation policy
	 * @param vmSelectionPolicy the vm selection policy
	 * @param parameter the parameter
	 */
	public RunnerAbstractSteady(
			boolean enableOutput,
			boolean outputToFile,
			String inputFolder,
			String outputFolder,
			String workload,
			String vmAllocationPolicy,
			String vmSelectionPolicy,
			String parameter) {
		try {
			initLogOutput(
					enableOutput,
					outputToFile,
					outputFolder,
					workload,
					vmAllocationPolicy,
					vmSelectionPolicy,
					parameter);
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(0);
		}

		init(inputFolder + "/" + workload);
		start(
				getExperimentName(workload, vmAllocationPolicy, vmSelectionPolicy, parameter),
				outputFolder,
				getVmAllocationPolicy(vmAllocationPolicy, vmSelectionPolicy, parameter));
	}

	/**
	 * Inits the log output.
	 * 
	 * @param enableOutput the enable output
	 * @param outputToFile the output to file
	 * @param outputFolder the output folder
	 * @param workload the workload
	 * @param vmAllocationPolicy the vm allocation policy
	 * @param vmSelectionPolicy the vm selection policy
	 * @param parameter the parameter
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws FileNotFoundException the file not found exception
	 */
	protected void initLogOutput(
			boolean enableOutput,
			boolean outputToFile,
			String outputFolder,
			String workload,
			String vmAllocationPolicy,
			String vmSelectionPolicy,
			String parameter) throws IOException, FileNotFoundException {
		setEnableOutput(enableOutput);
		Log.setDisabled(!isEnableOutput());
		if (isEnableOutput() && outputToFile) {
			File folder = new File(outputFolder);
			if (!folder.exists()) {
				folder.mkdir();
			}

			File folder2 = new File(outputFolder + "/log");
			if (!folder2.exists()) {
				folder2.mkdir();
			}

			File file = new File(outputFolder + "/log/"
					+ getExperimentName(workload, vmAllocationPolicy, vmSelectionPolicy, parameter) + ".txt");
			file.createNewFile();
			Log.setOutput(new FileOutputStream(file));
		}
	}

	/**
	 * Inits the simulation.
	 * 
	 * @param inputFolder the input folder
	 */
	protected abstract void init(String inputFolder);

	/**
	 * Starts the simulation.
	 * 
	 * @param experimentName the experiment name
	 * @param outputFolder the output folder
	 * @param vmAllocationPolicy the vm allocation policy
	 */

	protected void start(String experimentName, String outputFolder, VmAllocationPolicySteady vmAllocationPolicy) {
		System.out.println("Starting " + experimentName);

		try {
			PowerDatacenterSteady datacenter = (PowerDatacenterSteady) HelperSteady.createDatacenter(
					"Datacenter",
					PowerDatacenterSteady.class,
					hostList,
					vmAllocationPolicy);

			datacenter.setDisableMigrations(false);

			broker.submitVmList(vmList);
			broker.submitCloudletList(cloudletList);

			CloudSim.terminateSimulation(ConstantsSteady.SIMULATION_LIMIT);
			double lastClock = CloudSim.startSimulation();

			List<Cloudlet> newList = broker.getCloudletReceivedList();
			Log.printLine("Received " + newList.size() + " cloudlets");

			CloudSim.stopSimulation();

			HelperSteady.printResults(
					datacenter,
					vmList,
					lastClock,
					experimentName,
					ConstantsSteady.OUTPUT_CSV,
					outputFolder);

		} catch (Exception e) {
			e.printStackTrace();
			Log.printLine("The simulation has been terminated due to an unexpected error");
			System.exit(0);
		}

		Log.printLine("Finished " + experimentName);
	}

	/**
	 * Gets the experiment name.
	 * 
	 * @param args the args
	 * @return the experiment name
	 */
	protected String getExperimentName(String... args) {
		StringBuilder experimentName = new StringBuilder();
		for (int i = 0; i < args.length; i++) {
			if (args[i].isEmpty()) {
				continue;
			}
			if (i != 0) {
				experimentName.append("_");
			}
			experimentName.append(args[i]);
		}
		return experimentName.toString();
	}

	/**
	 * Gets the vm allocation policy.
	 * 
	 * @param vmAllocationPolicyName the vm allocation policy name
	 * @param vmSelectionPolicyName the vm selection policy name
	 * @param parameterName the parameter name
	 * @return the vm allocation policy
	 */

	protected VmAllocationPolicySteady getVmAllocationPolicy(
			String vmAllocationPolicyName,
			String vmSelectionPolicyName,
			String parameterName) {
		VmAllocationPolicySteady vmAllocationPolicy = null;
		PowerVmSelectionPolicySteady vmSelectionPolicy = null;

		if (!vmSelectionPolicyName.isEmpty()) {
			vmSelectionPolicy = getVmSelectionPolicy(vmSelectionPolicyName);
		}
		double parameter = 0;
		if (!parameterName.isEmpty()) {
			parameter = Double.valueOf(parameterName);
		}
		if (vmAllocationPolicyName.equals("iqr")) {
			PowerVmAllocationPolicyMigrationAbstractSteady fallbackVmSelectionPolicy = new PowerVmAllocationPolicyMigrationStaticThresholdSteady(
					hostList,
					vmSelectionPolicy,
					0.7);
			vmAllocationPolicy = new PowerVmAllocationPolicyMigrationInterQuartileRangeSteady(
					hostList,
					vmSelectionPolicy,
					parameter,
					fallbackVmSelectionPolicy);
		} else if (vmAllocationPolicyName.equals("mad")) {

			PowerVmAllocationPolicyMigrationAbstractSteady fallbackVmSelectionPolicy = new PowerVmAllocationPolicyMigrationStaticThresholdSteady(
					hostList,
					vmSelectionPolicy,
					0.7);
			vmAllocationPolicy = new PowerVmAllocationPolicyMigrationMedianAbsoluteDeviationSteady(
					hostList,
					vmSelectionPolicy,
					parameter,
					fallbackVmSelectionPolicy);
		} else if (vmAllocationPolicyName.equals("lr")) {
			PowerVmAllocationPolicyMigrationAbstractSteady fallbackVmSelectionPolicy = new PowerVmAllocationPolicyMigrationStaticThresholdSteady(
					hostList,
					vmSelectionPolicy,
					0.7);
			vmAllocationPolicy = new PowerVmAllocationPolicyMigrationLocalRegressionSteady(
					hostList,
					vmSelectionPolicy,
					parameter,
					ConstantsSteady.SCHEDULING_INTERVAL,
					fallbackVmSelectionPolicy);
		} else if (vmAllocationPolicyName.equals("lrr")) {
			PowerVmAllocationPolicyMigrationAbstractSteady fallbackVmSelectionPolicy = new PowerVmAllocationPolicyMigrationStaticThresholdSteady(
					hostList,
					vmSelectionPolicy,
					0.7);
			vmAllocationPolicy = new PowerVmAllocationPolicyMigrationLocalRegressionRobustSteady(
					hostList,
					vmSelectionPolicy,
					parameter,
					ConstantsSteady.SCHEDULING_INTERVAL,
					fallbackVmSelectionPolicy);
		} else if (vmAllocationPolicyName.equals("thr")) {
			vmAllocationPolicy = new PowerVmAllocationPolicyMigrationStaticThresholdSteady(
					hostList,
					vmSelectionPolicy,
					parameter);
		} else if (vmAllocationPolicyName.equals("dvfs")) {
			vmAllocationPolicy = new PowerVmAllocationPolicySimpleSteady(hostList);
		} else if (vmAllocationPolicyName.equals("dvfsModified")) {
			vmAllocationPolicy = new PowerVmAllocationPolicySimpleSteadyModified(hostList);
		} else if (vmAllocationPolicyName.equals("dvfsBF")) {
			vmAllocationPolicy = new PowerVmAllocationPolicyBestFitSteady(hostList);
		} else if (vmAllocationPolicyName.equals("dvfsFFCt")) {
			vmAllocationPolicy = new PowerVmAllocationPolicyFfCtSteady(hostList);
		} else if (vmAllocationPolicyName.equals("dvfsFFCtAvg")) {
			vmAllocationPolicy = new PowerVmAllocationPolicyFfCtAverageSteady(hostList);
		} else if (vmAllocationPolicyName.equals("dvfsBFCt")) {
			vmAllocationPolicy = new PowerVmAllocationPolicyBestFitCtSteady(hostList);
		} else if (vmAllocationPolicyName.equals("dvfsBFCtAvg")) {
			vmAllocationPolicy = new PowerVmAllocationPolicyBestFitCtAverageSteady(hostList);
		} else if (vmAllocationPolicyName.equals("dvfsWF")) {
			vmAllocationPolicy = new PowerVmAllocationPolicyWorstFitSteady(hostList);
		}else {
			System.out.println("Unknown VM allocation policy: " + vmAllocationPolicyName);
			System.exit(0);
		}
		return vmAllocationPolicy;
	}

	/**
	 * Gets the vm selection policy.
	 * 
	 * @param vmSelectionPolicyName the vm selection policy name
	 * @return the vm selection policy
	 */
	protected PowerVmSelectionPolicySteady getVmSelectionPolicy(String vmSelectionPolicyName) {
		PowerVmSelectionPolicySteady vmSelectionPolicy = null;
		if (vmSelectionPolicyName.equals("mc")) {
			vmSelectionPolicy = new PowerVmSelectionPolicyMaximumCorrelationSteady(
					new PowerVmSelectionPolicyMinimumMigrationTimeSteady());
		} else if (vmSelectionPolicyName.equals("mmt")) {
			vmSelectionPolicy = new PowerVmSelectionPolicyMinimumMigrationTimeSteady();
		} else if (vmSelectionPolicyName.equals("mu")) {
			vmSelectionPolicy = new PowerVmSelectionPolicyMinimumUtilizationSteady();
		} else if (vmSelectionPolicyName.equals("rs")) {
			vmSelectionPolicy = new PowerVmSelectionPolicyRandomSelectionSteady();
		} else {
			System.out.println("Unknown VM selection policy: " + vmSelectionPolicyName);
			System.exit(0);
		}
		return vmSelectionPolicy;
	}

	/**
	 * Sets the enable output.
	 * 
	 * @param enableOutput the new enable output
	 */
	public void setEnableOutput(boolean enableOutput) {
		RunnerAbstractSteady.enableOutput = enableOutput;
	}

	/**
	 * Checks if is enable output.
	 * 
	 * @return true, if is enable output
	 */
	public boolean isEnableOutput() {
		return enableOutput;
	}

}
