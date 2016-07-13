/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.power;

import java.util.List;
import java.util.ArrayList;

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
	
	private double avgFreq=0.0;
	
	private double runTime=1.0;

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
			//System.out.println("host: "+getId() + " util: "+utilization + "freq:"+Math.round(getTotalMips() / getNumberOfPes()));
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
		//double fromPower = getPower(fromUtilization);
		//double toPower = getPower(toUtilization);
		return getPower(toUtilization);//(fromPower + (toPower - fromPower) / 2) * time;
	}
	public void changeMipsOfPes(){
		int maxAvailableMips=-1;
		if(getPeList().get(0).getPeProvisioner().getTotalAllocatedMips()>0){
			for (int i=0;i<getPeList().size();i++){
				if(maxAvailableMips==-1 || maxAvailableMips < getPeList().get(i).getPeProvisioner().getAvailableMips()){
					maxAvailableMips = (int) getPeList().get(i).getPeProvisioner().getAvailableMips();
				}
			}
			int maxAllocatedMips=(int) (getPeList().get(0).getPeProvisioner().getMipsList().get(getPeList().get(0).getPeProvisioner().getMipsList().size()-1).doubleValue()) - maxAvailableMips;
			int newLeastMipsIndex=getLeastMips(maxAllocatedMips);
//			if (getPeList().get(0).getPeProvisioner().getMipsList().get(newLeastMipsIndex)!=getPeList().get(0).getPeProvisioner().getMipsList().get(getPeList().get(0).getPeProvisioner().getMipsList().size()-1)){
				for (int i=0;i<getPeList().size();i++){
					getPeList().get(i).getPeProvisioner().setMips(getPeList().get(i).getPeProvisioner().getMipsList().get(newLeastMipsIndex));
				}
//			}
		}
	}
	//change this to be called only when a cloudlet is received!! save processing power!!
	public void reallocateRemainingMips(){
		if(getVmList().size()>0){
			double hostAllocatedMips = getPeList().get(0).getPeProvisioner().getTotalAllocatedMips();
			double hostRemainingMips = getPeList().get(0).getPeProvisioner().getAvailableMips();
			double remainingMips=hostRemainingMips;
			for(int vmIndex = 0; vmIndex < getVmList().size() && hostRemainingMips > 0; vmIndex++){
				double vmAllocatedMips = getPeList().get(0).getPeProvisioner().getTotalAllocatedMipsForVm(getVmList().get(vmIndex));
				double additionalMips = Math.floor(hostRemainingMips * (vmAllocatedMips/hostAllocatedMips));
				double vmNewAllocatedMips = (remainingMips < additionalMips) ? remainingMips : (vmAllocatedMips + additionalMips);
				remainingMips -= additionalMips;
				//Each cloudlet is single threaded and hence the summation of mips per pe = max freq
				if (vmNewAllocatedMips > (hostAllocatedMips + hostRemainingMips)/getPeList().size())
					vmNewAllocatedMips = Math.floor((hostAllocatedMips + hostRemainingMips)/getPeList().size());
				List<Double> vmNewAllocatedMipsList = new ArrayList<Double>();
				double totalVmNewAllocatedMips=0;
				for (int i=0;i<getPeList().size();i++){
					totalVmNewAllocatedMips+=vmNewAllocatedMips;
					getPeList().get(i).getPeProvisioner().deallocateMipsForVm(getVmList().get(vmIndex));
					getPeList().get(i).getPeProvisioner().allocateMipsForVm(getVmList().get(vmIndex), vmNewAllocatedMips);
				}
				vmNewAllocatedMipsList.add(totalVmNewAllocatedMips);
				getVmScheduler().setAllocatedMipsForVm(getVmList().get(vmIndex),vmNewAllocatedMipsList);
			}
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

	public double getAvgFreq() {
		return avgFreq;
	}

	public void setAvgFreq(double currFreq,double timeDiff) {
		System.out.println("host: #" + getId() + " currFreq="+ currFreq);
		if(getAvgFreq()==0.0){
			this.avgFreq = currFreq;
			setRunTime(getRunTime()+timeDiff);
			return;
		}
		this.avgFreq = (getAvgFreq()*getRunTime() + currFreq)/(getRunTime()+timeDiff);
		setRunTime(getRunTime()+timeDiff);
	}

	public double getRunTime() {
		return runTime;
	}

	public void setRunTime(double runTime) {
		this.runTime = runTime;
	}

}
