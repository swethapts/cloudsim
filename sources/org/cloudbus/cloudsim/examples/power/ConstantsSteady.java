package org.cloudbus.cloudsim.examples.power;

import org.cloudbus.cloudsim.power.models.PowerModelSteady;
import org.cloudbus.cloudsim.power.models.PowerModeli7;
//import org.cloudbus.cloudsim.power.models.PowerModelSpecPowerHpProLiantMl110G4Xeon3040;

/**
 * If you are using any algorithms, policies or workload included in the power package, please cite
 * the following paper:
 *
 * Anton Beloglazov, and Rajkumar Buyya, "Optimal Online Deterministic Algorithms and Adaptive
 * Heuristics for Energy and Performance Efficient Dynamic Consolidation of Virtual Machines in
 * Cloud Data Centers", Concurrency and Computation: Practice and Experience (CCPE), Volume 24,
 * Issue 13, Pages: 1397-1420, John Wiley & Sons, Ltd, New York, USA, 2012
 *
 * @author Anton Beloglazov
 * @since Jan 6, 2012
 */
public class ConstantsSteady {

	public final static boolean ENABLE_OUTPUT = true;
	public final static boolean OUTPUT_CSV    = false;

	public final static double SCHEDULING_INTERVAL = 1;//300;
	public final static double SIMULATION_LIMIT = 1700;//24 * 60 * 60;

	public final static int CLOUDLET_LENGTH	= 2500 * 1000;//mi //(int) SIMULATION_LIMIT;
	public final static int CLOUDLET_PES	= 1;

	/*
	 * VM instance types:
	 *   High-Memory Extra Large Instance: 3.25 EC2 Compute Units, 8.55 GB // too much MIPS
	 *   High-CPU Medium Instance: 2.5 EC2 Compute Units, 0.85 GB
	 *   Extra Large Instance: 2 EC2 Compute Units, 3.75 GB
	 *   Small Instance: 1 EC2 Compute Unit, 1.7 GB
	 *   Micro Instance: 0.5 EC2 Compute Unit, 0.633 GB
	 *   We decrease the memory size two times to enable oversubscription
	 *
	 */
	public final static int VM_TYPES	= 4;
	public final static int[] VM_CT_SLA	= { 1000, 1250, 2500, 5000 };//seconds
	public final static int[] VM_MIPS	= getVmMips(VM_CT_SLA);//{ 2500, 2000, 1000, 500 };
	public final static int[] VM_PES	= { 1, 1, 1, 1 };
	public final static int[] VM_RAM	= { 870,  1740, 1740, 613 };
	public final static int VM_BW		= 100000; // 100 Mbit/s
	public final static int VM_SIZE		= 2500; // 2.5 GB

	/*
	 * Host types:
	 *   HP ProLiant ML110 G4 (1 x [Xeon 3040 1860 MHz, 2 cores], 4GB)
	 *   HP ProLiant ML110 G5 (1 x [Xeon 3075 2660 MHz, 2 cores], 4GB)
	 *   We increase the memory size to enable over-subscription (x4)
	 */
	public final static int HOST_TYPES	 = 1;//2;
	public final static double[][] HOST_MIPS	 = { /*1860,*/ {1600,2600,3400} };
	public final static int[] HOST_PES	 = { /*2,*/ 2 };
	public final static int[] HOST_RAM	 = { /*4096,*/ 4096 };
	public final static int HOST_BW		 = 1000000; // 1 Gbit/s
	public final static int HOST_STORAGE = 1000000; // 1 GB

	public final static PowerModelSteady[] HOST_POWER = {
		/*new PowerModelSpecPowerHpProLiantMl110G4Xeon3040(),*/
		new PowerModeli7()
	};

	private static int[] getVmMips(int[] vmCtSla) {
		int[] vmMips = new int[vmCtSla.length];
		for (int i=0; i<vmCtSla.length;i++){
			vmMips[i] = (int) (CLOUDLET_LENGTH/vmCtSla[i]) ;
		}
		return vmMips;
	}

}
