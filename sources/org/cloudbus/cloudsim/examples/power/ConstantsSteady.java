package org.cloudbus.cloudsim.examples.power;

import java.util.*;
import org.cloudbus.cloudsim.power.models.PowerModelSteady;
import org.cloudbus.cloudsim.examples.power.ConstantsSteadyWorkload;
import org.cloudbus.cloudsim.power.models.PowerModeli7;
//import org.cloudbus.cloudsim.power.models.PowerModelE5507;

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
	public final static double SIMULATION_LIMIT = 43200;//24 * 60 * 60;

	private final static int  [] CLOUDLET_LENGTH_PRIVATE = ConstantsSteadyWorkload.CLOUDLET_LENGTH_CEA;//getCloudletLengthPrivate();  
		
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
	
	public final static boolean VM_SLA_SORTING_ASCENDING=true;//false;//true //therefore, mips is sorted in descending order
	public final static boolean VM_MIPS_SORTING=false;// = true; //if false(default) do not sort by mips
	
	private final static int[][] VM_CT_SLA_UNSORTED = ConstantsSteadyWorkload.VM_CT_UNSORTED;

						//*/								
	public final static int VM_TYPES	= VM_CT_SLA_UNSORTED[0].length*CLOUDLET_LENGTH_PRIVATE.length;
	public final static int[][] VM_CT_SLA = getSortedSla(VM_CT_SLA_UNSORTED);//seconds
	public final static int[] VM_MIPS	= getVmMips(VM_CT_SLA);//{ 2500, 2000, 1000, 500 };
	public final static int[] VM_PES	= getPes(); 
	public final static int[] VM_RAM_UNSORTED	= getRam();
	//public final static int[] VM_RAM	= getSortedRam(VM_RAM_UNSORTED);
	public final static int[] VM_RAM	= VM_RAM_UNSORTED;
	public final static int VM_BW		= 1;//100000; // 100 Mbit/s
	public final static int VM_SIZE		= 1;//2500; // 2.5 GB
	
	public final static int[] CLOUDLET_LENGTH	= getCloudletList();//mi //(int) SIMULATION_LIMIT;
	public final static int CLOUDLET_PES	= 1;
	public final static int CLOUDLET_TYPES = CLOUDLET_LENGTH.length;

	//public static VmSlaCloudletListListSteady vmVmSlaCloudletListSteadyPublic;
	/*
	 * Host types:
	 *   HP ProLiant ML110 G4 (1 x [Xeon 3040 1860 MHz, 2 cores], 4GB)
	 *   HP ProLiant ML110 G5 (1 x [Xeon 3075 2660 MHz, 2 cores], 4GB)
	 *   We increase the memory size to enable over-subscription (x4)
	 */
	public final static int HOST_TYPES	 = 1;//2;
	public final static double[][] HOST_MIPS	 = /*{{1597,1730,1863,1996,2129,2262}};*/ {{1600,1800,2000,2200,2400,2600,2800,3000,3200,3400}}; ////change for E5507
	public final static int[] HOST_PES	 = { /*2,*/ 4 }; ////change for E5507
	public final static int[] HOST_RAM	 = { /*4096,*/ 65536 };
	public final static int HOST_BW		 = 10000000; // 1 Gbit/s
	public final static int HOST_STORAGE = 1000000; // 1 GB

	public final static PowerModelSteady[] HOST_POWER = {
		//new PowerModelE5507()
		new PowerModeli7()
	};

	private static int[][] getSortedSla(int[][] slaUnsorted){
		int [][] vmSlas = new int[slaUnsorted.length][slaUnsorted[0].length];
		for(int i=0;i<slaUnsorted.length;i++){
			vmSlas[i] = Arrays.copyOf(slaUnsorted[i], slaUnsorted[i].length);
//			Arrays.sort(vmSlas[i]);
		}
//		if(VM_SLA_SORTING_ASCENDING ==false){
//			Integer[][] vmSlasInteger = new Integer[CLOUDLET_LENGTH_PRIVATE.length][vmSlas[0].length];
//			int rowIndex=0;
//			for(int[] line : vmSlas){
//				for(int i=line.length-1;i>=0;i-- )//reversing
//					vmSlasInteger[rowIndex][i] = line[line.length-1-i];
//				rowIndex++;
//			}
//			rowIndex=0;
//			for(int[] line : vmSlas){
//				for(int i=line.length-1;i>=0;i-- )//copying
//					line[i] = vmSlasInteger[rowIndex][i].intValue();
//				rowIndex++;
//			}
//		}
		return vmSlas;
	}
	



	private static int[] getPes() {
		int [] pes = new int [ConstantsSteadyWorkload.CLOUDLET_LENGTH_CEA.length] ;
		for (int i =0; i< ConstantsSteadyWorkload.CLOUDLET_LENGTH_CEA.length ; i++){
			pes[i]=1;
		}
		return pes;
	}

	private static int[] getRam() {
		int [] ram = new int [ConstantsSteadyWorkload.CLOUDLET_LENGTH_CEA.length] ;
		for (int i =0; i< ConstantsSteadyWorkload.CLOUDLET_LENGTH_CEA.length ; i++){
			ram[i]=1;//1024;
		}
		return ram;
	}


	private static int[] getVmMips(int[][] vmCtSla) {
		int[] vmMipsInt = new int[vmCtSla[0].length*CLOUDLET_LENGTH_PRIVATE.length];
		//List<Integer> vmMips = new ArrayList<>();
		List<VmSlaCloudletListSteady> vmVmSlaCloudletListSteady = new ArrayList<>();
		System.out.println("Completion Time\tMips");
		for (int i=0; i<vmCtSla[0].length*CLOUDLET_LENGTH_PRIVATE.length;i++){
//			System.out.println("cloudlength: "+i+"\t"+(int) (CLOUDLET_LENGTH_PRIVATE[i%CLOUDLET_LENGTH_PRIVATE.length]*1/vmCtSla[i%CLOUDLET_LENGTH_PRIVATE.length][i/CLOUDLET_LENGTH_PRIVATE.length]) + "\t"+ vmCtSla[i%CLOUDLET_LENGTH_PRIVATE.length][i/CLOUDLET_LENGTH_PRIVATE.length]+"\t"+CLOUDLET_LENGTH_PRIVATE[i%CLOUDLET_LENGTH_PRIVATE.length]);
//			vmMips.add((int) (CLOUDLET_LENGTH_PRIVATE[i%CLOUDLET_LENGTH_PRIVATE.length]/vmCtSla[i%CLOUDLET_LENGTH_PRIVATE.length][i/CLOUDLET_LENGTH_PRIVATE.length]));
//			vmMipsInt[i][1]=i%CLOUDLET_LENGTH_PRIVATE.length;
//---*1000			
			vmVmSlaCloudletListSteady.add(new VmSlaCloudletListSteady(i,(int) (CLOUDLET_LENGTH_PRIVATE[i%CLOUDLET_LENGTH_PRIVATE.length]*1000/vmCtSla[i%CLOUDLET_LENGTH_PRIVATE.length][i/CLOUDLET_LENGTH_PRIVATE.length]),vmCtSla[i%CLOUDLET_LENGTH_PRIVATE.length][i/CLOUDLET_LENGTH_PRIVATE.length],CLOUDLET_LENGTH_PRIVATE[i%CLOUDLET_LENGTH_PRIVATE.length]*1000));
//-otherworkload			vmVmSlaCloudletListSteady.add(new VmSlaCloudletListSteady(i,(int) (CLOUDLET_LENGTH_PRIVATE[i%CLOUDLET_LENGTH_PRIVATE.length]*1/vmCtSla[i%CLOUDLET_LENGTH_PRIVATE.length][i/CLOUDLET_LENGTH_PRIVATE.length]),vmCtSla[i%CLOUDLET_LENGTH_PRIVATE.length][i/CLOUDLET_LENGTH_PRIVATE.length],CLOUDLET_LENGTH_PRIVATE[i%CLOUDLET_LENGTH_PRIVATE.length]*1));
//			System.out.println(vmCtSla[i%CLOUDLET_LENGTH_PRIVATE.length][i/CLOUDLET_LENGTH_PRIVATE.length]+"\t"+(int) (CLOUDLET_LENGTH_PRIVATE[i%CLOUDLET_LENGTH_PRIVATE.length]/vmCtSla[i%CLOUDLET_LENGTH_PRIVATE.length][i/CLOUDLET_LENGTH_PRIVATE.length])+"\t"+CLOUDLET_LENGTH_PRIVATE[i%CLOUDLET_LENGTH_PRIVATE.length]);
		}

		//VmSlaCloudletListSteady.sortByMipsDescending(vmVmSlaCloudletListSteady);
		//System.out.println("ccc");

//		VmSlaCloudletListListSteady.copy(vmVmSlaCloudletListSteady);
		
		//for (VmSlaCloudletListSteady ll : VmSlaCloudletListListSteady.getList()){
		//	System.out.println("ccc"+ll.getTuple().length);
		//}
		
		//System.out.println("ccc"+vmVmSlaCloudletListSteadyPublic.getClass());
		if(VM_MIPS_SORTING==true){
			if(VM_SLA_SORTING_ASCENDING==true){//System.out.println("descending mips");
				VmSlaCloudletListSteady.sortByMipsDescending(vmVmSlaCloudletListSteady);
				//Collections.sort(vmMips,Collections.reverseOrder());
				}
			else{//System.out.println("ascending mips");
				VmSlaCloudletListSteady.sortByMips(vmVmSlaCloudletListSteady);
				//Collections.sort(vmMips);
				}
		}
		else{
			if(VM_SLA_SORTING_ASCENDING==true){//System.out.println("descending mips");
				VmSlaCloudletListSteady.sortBySla(vmVmSlaCloudletListSteady);
				//Collections.sort(vmMips,Collections.reverseOrder());
				}
			else{//System.out.println("ascending mips");
				VmSlaCloudletListSteady.sortBySlaDescending(vmVmSlaCloudletListSteady);
				//Collections.sort(vmMips);
				}
		}
		VmSlaCloudletListListSteady.copy(vmVmSlaCloudletListSteady);
		
		//VmSlaCloudletListSteady.printList(vmVmSlaCloudletListSteady);

		int index=0;
		for (VmSlaCloudletListSteady tuple : vmVmSlaCloudletListSteady){
			vmMipsInt[index++]=tuple.getMips();
			//System.out.println(vmMipsInt[index-1]+"\t"+tuple.getSla());
		}
//		for (int i=0; i<vmCtSla[0].length*CLOUDLET_LENGTH_PRIVATE.length;i++){
//			//vmMips.add((int) (CLOUDLET_LENGTH[i%CLOUDLET_TYPES]/vmCtSla[i%CLOUDLET_TYPES][i/CLOUDLET_TYPES]));
//			//System.out.println(vmCtSla[i%CLOUDLET_TYPES][i/CLOUDLET_TYPES]+"\t"+vmMips.get(i)+"\t"+CLOUDLET_LENGTH[i%CLOUDLET_TYPES]);
//		}
		return vmMipsInt;
	}
	

	private static int[] getSortedRam(int[] ramUnsorted){
		List<Integer> vmRams = new ArrayList<>();
		for (int ram : ramUnsorted)
			vmRams.add(ram);
		Collections.sort(vmRams,Collections.reverseOrder());
		if(VM_SLA_SORTING_ASCENDING != true){
			Collections.sort(vmRams);
		}
		for(int i=0;i<vmRams.size();i++)
			ramUnsorted[i]=vmRams.get(i);
		return ramUnsorted;
	}
	
	private static int[] getCloudletList() {
		int cloudletLengths[] = new int[VmSlaCloudletListListSteady.getList().size()];
		int index=0;
		for (VmSlaCloudletListSteady tuple : VmSlaCloudletListListSteady.getList()){
			//System.out.println("cloudlet# "+ index + " length: " + tuple.getCloudletId());
			cloudletLengths[index++]=tuple.getCloudletId();
		}
		return cloudletLengths;
	}
}
