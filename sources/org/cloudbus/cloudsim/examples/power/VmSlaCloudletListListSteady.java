package org.cloudbus.cloudsim.examples.power;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.ArrayList;

//import org.cloudbus.cloudsim.VmSteady;

public class VmSlaCloudletListListSteady {
	
	private static List<VmSlaCloudletListSteady> list = new ArrayList<>();
	
	public static <T extends VmSlaCloudletListSteady> void copy(List<T> vmVmSlaCloudletListSteady){
		System.out.println(vmVmSlaCloudletListSteady.size());
		for(VmSlaCloudletListSteady element : vmVmSlaCloudletListSteady){
			list.add(element);
			System.out.println(element.getMips());

		}
	}
	public static List<VmSlaCloudletListSteady> getList(){
		return list;
	}
	public static int size(){
			return list.size();

	}
	public static VmSlaCloudletListSteady getById(int id){
		return list.get(id);

	}
//		System.out.println("bye");


	/*private int type;
	private int mips;
	private int sla;
	private int cloudletId;
	
	VmSlaCloudletListSteady(int type,int mips,int sla,int cloudletId){
		this.type=type;
		this.mips=mips;
		this.sla=sla;
		this.cloudletId=cloudletId;
	}
	public void addTuple(int type,int mips,int sla,int cloudletId){
		this.type=type;
		this.mips=mips;
		this.sla=sla;
		this.cloudletId=cloudletId;
	}
	
	public int[] getTuple(){
		int[] tuple = new int[4];
		tuple[0]=type;
		tuple[1]=mips;
		tuple[2]=sla;
		tuple[3]=cloudletId;
		return tuple;
	}
	public int getMips(){
		return mips;
	}
	public static <T extends VmSlaCloudletListSteady> void sortByMips(List<T> vmVmSlaCloudletListSteady) {
		Collections.sort(vmVmSlaCloudletListSteady, new Comparator<T>() {

			@Override
			public int compare(T a, T b) throws ClassCastException {
				Integer aMips = a.getMips();
				Integer bMips = b.getMips();
				return bMips.compareTo(aMips);
			}
		});
	}
	public static <T extends VmSlaCloudletListSteady> void sortByMipsDescending(List<T> vmVmSlaCloudletListSteady) {
		Collections.sort(vmVmSlaCloudletListSteady, new Comparator<T>() {

			@Override
			public int compare(T a, T b) throws ClassCastException {
				Integer aMips = a.getMips();
				Integer bMips = b.getMips();
				return aMips.compareTo(bMips);
			}
		});
	}*/

}
