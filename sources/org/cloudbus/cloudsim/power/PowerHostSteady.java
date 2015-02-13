/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.power;

import java.util.List;

import org.cloudbus.cloudsim.HostSteadyWorkload;
import org.cloudbus.cloudsim.PeSteady;
import org.cloudbus.cloudsim.VmSchedulerSteady;
import org.cloudbus.cloudsim.VmSteady;
import org.cloudbus.cloudsim.power.models.PowerModelSteady;
import org.cloudbus.cloudsim.provisioners.BwProvisionerSteady;
import org.cloudbus.cloudsim.provisioners.RamProvisionerSteady;

/**
 * PowerHostSteady class enables simulation of power-aware hosts.
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
public class PowerHostSteady extends HostSteadyWorkload {

	/** The power model. */
	private PowerModelSteady powerModel;

	/**
	 * Instantiates a new host.
	 * 
	 * @param id the id
	 * @param ramProvisioner the ram provisioner
	 * @param bwProvisioner the bw provisioner
	 * @param storage the storage
	 * @param peList the pe list
	 * @param vmScheduler the VM scheduler
	 */
	public PowerHostSteady(
			int id,
			RamProvisionerSteady ramProvisioner,
			BwProvisionerSteady bwProvisioner,
			long storage,
			List<? extends PeSteady> peList,
			VmSchedulerSteady vmScheduler,
			PowerModelSteady powerModel) {
		super(id, ramProvisioner, bwProvisioner, storage, peList, vmScheduler);
		setPowerModel(powerModel);
	}

	/**
	 * Gets the power. For this moment only consumed by all PEs.
	 * 
	 * @return the power
	 */
	public double getPower() {
		return getPower(getUtilizationOfCpu());
	}

	/**
	 * Gets the power. For this moment only consumed by all PEs.
	 * 
	 * @param utilization the utilization
	 * @return the power
	 */
	protected double getPower(double utilization) {
		double power = 0;
		//int mipsIndex = getMipsIndex(getTotalMips() / getNumberOfPes());
		try {
			power = getPowerModel().getPower(Math.round(getTotalMips() / getNumberOfPes()),utilization);
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(0);
		}
		return power;
	}

	/**
	 * Gets the max power that can be consumed by the host.
	 * 
	 * @return the max power
	 */
	public double getMaxPower() {
		double power = 0;
		try {
			power = getPowerModel().getPower(1);
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(0);
		}
		return power;
	}

	/**
	 * Gets the energy consumption using linear interpolation of the utilization change.
	 * 
	 * @param fromUtilization the from utilization
	 * @param toUtilization the to utilization
	 * @param time the time
	 * @return the energy
	 */
	public double getEnergyLinearInterpolation(double fromUtilization, double toUtilization, double time) {
		if (fromUtilization == 0) {
			return 0;
		}
		double fromPower = getPower(fromUtilization);
		double toPower = getPower(toUtilization);
		return (fromPower + (toPower - fromPower) / 2) * time;
	}
	public void changeMipsOfPes(){
		int maxAllocatedMips=-1;
		for (int i=0;i<getPeList().size();i++){
			if(maxAllocatedMips==-1 || maxAllocatedMips < getPeList().get(i).getPeProvisioner().getTotalAllocatedMips()){
				maxAllocatedMips = (int) getPeList().get(i).getPeProvisioner().getTotalAllocatedMips();
			}
			System.out.println("Pe allocated: " + getPeList().get(i).getPeProvisioner().getTotalAllocatedMips()+", getMips: "+getPeList().get(i).getPeProvisioner().getMips());
		}
		System.out.println("Pe with max util: " + maxAllocatedMips);
		int newLeastMipsIndex=getLeastMips(maxAllocatedMips);
		for (int i=0;i<getPeList().size();i++){
			getPeList().get(i).getPeProvisioner().setMips(getPeList().get(i).getPeProvisioner().getMipsList().get(newLeastMipsIndex));
			System.out.println("Pe: " + getPeList().get(i).getPeProvisioner().getMips());
		}
	}

	protected int getLeastMips(int maxAllocatedMips) {
		int[] mipsList = getPeList().get(0).getMipsList();
		int potentialMipsIndex = mipsList.length-1;
		for(int i=mipsList.length-2; i>=0;i--){
			if(maxAllocatedMips<=mipsList[i]){
				potentialMipsIndex=i;
			}
			else 
				return potentialMipsIndex;
		}
		return potentialMipsIndex;
	}

	/**
	 * Sets the power model.
	 * 
	 * @param powerModel the new power model
	 */
	protected void setPowerModel(PowerModelSteady powerModel) {
		this.powerModel = powerModel;
	}

	/**
	 * Gets the power model.
	 * 
	 * @return the power model
	 */
	public PowerModelSteady getPowerModel() {
		return powerModel;
	}
	public boolean vmCreate(VmSteady vm) {
		System.out.println("ahaa");
		return super.vmCreate(vm);
	}

}
