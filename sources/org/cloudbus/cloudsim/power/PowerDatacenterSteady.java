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

import org.cloudbus.cloudsim.DatacenterSteady;
import org.cloudbus.cloudsim.DatacenterCharacteristicsSteady;
import org.cloudbus.cloudsim.Log;
import org.cloudbus.cloudsim.Storage;
import org.cloudbus.cloudsim.VmSteady;
import org.cloudbus.cloudsim.VmAllocationPolicySteady;
import org.cloudbus.cloudsim.core.CloudSim;
import org.cloudbus.cloudsim.core.CloudSimTags;
import org.cloudbus.cloudsim.core.SimEvent;
import org.cloudbus.cloudsim.core.predicates.PredicateType;

/**
 * PowerDatacenter is a class that enables simulation of power-aware data centers.
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
public class PowerDatacenterSteady extends DatacenterSteady {

	/** The power. */
	private double power;

	/** The disable migrations. */
	private boolean disableMigrations;

	/** The cloudlet submited. */
	private double cloudletSubmitted;

	/** The migration count. */
	private int migrationCount;
	
		/** The avgAvgFreq. */
	private double avgAvgFreq;

	/**
	 * Instantiates a new datacenter.
	 * 
	 * @param name the name
	 * @param characteristics the res config
	 * @param schedulingInterval the scheduling interval
	 * @param utilizationBound the utilization bound
	 * @param vmAllocationPolicy the vm provisioner
	 * @param storageList the storage list
	 * @throws Exception the exception
	 */
	public PowerDatacenterSteady(
			String name,
			DatacenterCharacteristicsSteady characteristics,
			VmAllocationPolicySteady vmAllocationPolicy,
			List<Storage> storageList,
			double schedulingInterval) throws Exception {
		super(name, characteristics, vmAllocationPolicy, storageList, schedulingInterval);

		setPower(0.0);
		setDisableMigrations(false);
		setCloudletSubmitted(-1);
		setMigrationCount(0);
	}

	/**
	 * Updates processing of each cloudlet running in this PowerDatacenter. It is necessary because
	 * Hosts and VirtualMachines are simple objects, not entities. So, they don't receive events and
	 * updating cloudlets inside them must be called from the outside.
	 * 
	 * @pre $none
	 * @post $none
	 */
	@Override
	protected void updateCloudletProcessing() {
		if (getCloudletSubmitted() == -1 || getCloudletSubmitted() == CloudSim.clock()) {
			CloudSim.cancelAll(getId(), new PredicateType(CloudSimTags.VM_DATACENTER_EVENT));
			schedule(getId(), getSchedulingInterval(), CloudSimTags.VM_DATACENTER_EVENT);
			return;
		}
		double currentTime = CloudSim.clock();

		// if some time passed since last processing
		if (currentTime > getLastProcessTime()) {
			//System.out.print(currentTime + " frequency resizing needs to be inserted here\n");
			//if(currentTime <2.0){
			//	getVmAllocationPolicy().changeMipsOfPes();
			//}
			double minTime = updateCloudetProcessingWithoutSchedulingFutureEventsForce();

			if (!isDisableMigrations()) {
				List<Map<String, Object>> migrationMap = getVmAllocationPolicy().optimizeAllocation(
						getVmList());

				if (migrationMap != null) {
					for (Map<String, Object> migrate : migrationMap) {
						VmSteady vm = (VmSteady) migrate.get("vm");
						PowerHostSteady targetHost = (PowerHostSteady) migrate.get("host");
						PowerHostSteady oldHost = (PowerHostSteady) vm.getHost();

						if (oldHost == null) {
							Log.formatLine(
									"%.2f: Migration of VM #%d to Host #%d is started",
									currentTime,
									vm.getId(),
									targetHost.getId());
						} else {
							Log.formatLine(
									"%.2f: Migration of VM #%d from Host #%d to Host #%d is started",
									currentTime,
									vm.getId(),
									oldHost.getId(),
									targetHost.getId());
						}

						targetHost.addMigratingInVm(vm);
						incrementMigrationCount();

						/** VM migration delay = RAM / bandwidth **/
						// we use BW / 2 to model BW available for migration purposes, the other
						// half of BW is for VM communication
						// around 16 seconds for 1024 MB using 1 Gbit/s network
						send(
								getId(),
								vm.getRam() / ((double) targetHost.getBw() / (2 * 8000)),
								CloudSimTags.VM_MIGRATE,
								migrate);
					}
				}
			}

			// schedules an event to the next time
			if (minTime != Double.MAX_VALUE) {
				CloudSim.cancelAll(getId(), new PredicateType(CloudSimTags.VM_DATACENTER_EVENT));
				send(getId(), getSchedulingInterval(), CloudSimTags.VM_DATACENTER_EVENT);
			}

			setLastProcessTime(currentTime);
			//System.out.print(currentTime + " frequency resizing needs to be inserted here\n");
			//if(currentTime <2.0){
				getVmAllocationPolicy().changeMipsOfPes(); /*can change this to only when VM dies*/
			//}
		}

	}

	/**
	 * Update cloudet processing without scheduling future events.
	 * 
	 * @return the double
	 */
	protected double updateCloudetProcessingWithoutSchedulingFutureEvents() {
		if (CloudSim.clock() > getLastProcessTime()) {
			return updateCloudetProcessingWithoutSchedulingFutureEventsForce();
		}
		return 0;
	}

	/**
	 * Update cloudet processing without scheduling future events.
	 * 
	 * @return the double
	 */
	protected double updateCloudetProcessingWithoutSchedulingFutureEventsForce() {
		double currentTime = CloudSim.clock();
		double minTime = Double.MAX_VALUE;
		double timeDiff = currentTime - getLastProcessTime();
		double timeFrameDatacenterEnergy = 0.0;
		double timeFrameDatacenterFreq = 0.0;

//		Log.printLine("\n\n--------------------------------------------------------------\n\n");
//		Log.formatLine("New resource usage for the time frame starting at %.2f:", currentTime);

		for (PowerHostSteady host : this.<PowerHostSteady> getHostList()) {
			//Log.printLine();

			double time = host.updateVmsProcessing(currentTime); // inform VMs to update processing
			if (time < minTime) {
				minTime = time;
			}
			if((host.getUtilizationOfCpu() * 100) > 0){
//				Log.formatLine(
//					"%.2f: [Host #%d] utilization is %.2f%%",
//					currentTime,
//					host.getId(),
//					host.getUtilizationOfCpu() * 100);
			
			}
		}

		if (timeDiff > 0) {
//			Log.formatLine(
//					"\nEnergy consumption for the last time frame from %.2f to %.2f:",
//					getLastProcessTime(),
//					currentTime);

			for (PowerHostSteady host : this.<PowerHostSteady> getHostList()) {
				double previousUtilizationOfCpu = host.getPreviousUtilizationOfCpu();
				double utilizationOfCpu = host.getUtilizationOfCpu();
				double timeFrameHostEnergy = host.getEnergyLinearInterpolation(
						previousUtilizationOfCpu,
						utilizationOfCpu,
						timeDiff);
				timeFrameDatacenterEnergy += timeFrameHostEnergy;

				if(previousUtilizationOfCpu * 100 > 0.000){
//					Log.printLine();
//					Log.formatLine(
//							"%.2f: [Host #%d] utilization at %.2f was %.2f%%, now is %.2f%%",
//							currentTime,
//							host.getId(),
//							getLastProcessTime(),
//							previousUtilizationOfCpu * 100,
//							utilizationOfCpu * 100);
//					Log.formatLine(
//							"%.2f: [Host #%d] energy is %.2f W*sec",
//							currentTime,
//							host.getId(),
//							timeFrameHostEnergy);
					host.setAvgFreq((double)host.getPeList().get(0).getMips(),timeDiff);
				}
			}

//			Log.formatLine(
//					"\n%.2f: Data center's energy is %.2f W*sec\n",
//					currentTime,
//					timeFrameDatacenterEnergy);
//			Log.formatLine(
//					"\n%.2f: %.2f W*sec\n",
//					currentTime,
//					timeFrameDatacenterEnergy);
		}

		setPower(getPower() + timeFrameDatacenterEnergy);
		setAvgAvgFreq(getAvgAvgFreq() + timeFrameDatacenterFreq);

		checkCloudletCompletion();

		/** Remove completed VMs **/
		for (PowerHostSteady host : this.<PowerHostSteady> getHostList()) {
			for (VmSteady vm : host.getCompletedVms()) {
				getVmAllocationPolicy().deallocateHostForVm(vm);
				getVmList().remove(vm);
				Log.printLine("VM #" + vm.getId() + " has been dealLlocated from host #" + host.getId());
			}
		}

		//Log.printLine();

		setLastProcessTime(currentTime);
		return minTime;
	}

	/*
	 * (non-Javadoc)
	 * @see org.cloudbus.cloudsim.DatacenterSteady#processVmMigrate(org.cloudbus.cloudsim.core.SimEvent,
	 * boolean)
	 */
	@Override
	protected void processVmMigrate(SimEvent ev, boolean ack) {
		Log.print("here in processVmMigrate");
		updateCloudetProcessingWithoutSchedulingFutureEvents();
		super.processVmMigrate(ev, ack);
		SimEvent event = CloudSim.findFirstDeferred(getId(), new PredicateType(CloudSimTags.VM_MIGRATE));
		if (event == null || event.eventTime() > CloudSim.clock()) {
			updateCloudetProcessingWithoutSchedulingFutureEventsForce();
		}
	}

	/*
	 * (non-Javadoc)
	 * @see cloudsim.DatacenterSteady#processCloudletSubmit(cloudsim.core.SimEvent, boolean)
	 */
	@Override
	protected void processCloudletSubmit(SimEvent ev, boolean ack) {
		super.processCloudletSubmit(ev, ack);
		setCloudletSubmitted(CloudSim.clock());
	}
	@Override
	protected void processCloudletReturn(SimEvent ev, boolean ack) {
		super.processCloudletReturn(ev, ack);
	}

	/**
	 * Gets the power.
	 * 
	 * @return the power
	 */
	public double getPower() {
		return power;
	}

	/**
	 * Sets the power.
	 * 
	 * @param power the new power
	 */
	protected void setPower(double power) {
		this.power = power;
	}

	/**
	 * Checks if PowerDatacenter is in migration.
	 * 
	 * @return true, if PowerDatacenter is in migration
	 */
	protected boolean isInMigration() {
		boolean result = false;
		for (VmSteady vm : getVmList()) {
			if (vm.isInMigration()) {
				result = true;
				break;
			}
		}
		return result;
	}

	/**
	 * Checks if is disable migrations.
	 * 
	 * @return true, if is disable migrations
	 */
	public boolean isDisableMigrations() {
		return disableMigrations;
	}

	/**
	 * Sets the disable migrations.
	 * 
	 * @param disableMigrations the new disable migrations
	 */
	public void setDisableMigrations(boolean disableMigrations) {
		this.disableMigrations = disableMigrations;
	}

	/**
	 * Checks if is cloudlet submited.
	 * 
	 * @return true, if is cloudlet submited
	 */
	protected double getCloudletSubmitted() {
		return cloudletSubmitted;
	}

	/**
	 * Sets the cloudlet submited.
	 * 
	 * @param cloudletSubmitted the new cloudlet submited
	 */
	protected void setCloudletSubmitted(double cloudletSubmitted) {
		this.cloudletSubmitted = cloudletSubmitted;
	}

	/**
	 * Gets the migration count.
	 * 
	 * @return the migration count
	 */
	public int getMigrationCount() {
		return migrationCount;
	}

	/**
	 * Sets the migration count.
	 * 
	 * @param migrationCount the new migration count
	 */
	protected void setMigrationCount(int migrationCount) {
		this.migrationCount = migrationCount;
	}

	/**
	 * Increment migration count.
	 */
	protected void incrementMigrationCount() {
		setMigrationCount(getMigrationCount() + 1);
	}

	public double getAvgAvgFreq() {
		double avgAvgFreq = 0;
		int count = 0;
		for (PowerHostSteady host : this.<PowerHostSteady> getHostList()) {
			if(host.getAvgFreq()>0){
				avgAvgFreq += host.getAvgFreq();
				count+=1;
			}
		}
		avgAvgFreq /= count;
		System.out.println("AvgAvgFreq= " + avgAvgFreq);
		return avgAvgFreq;
	}

	public void setAvgAvgFreq(double avgAvgFreq) {
		this.avgAvgFreq = avgAvgFreq;
	}

}
