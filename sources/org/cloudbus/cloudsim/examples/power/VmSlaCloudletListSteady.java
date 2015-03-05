package org.cloudbus.cloudsim.examples.power;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

//import org.cloudbus.cloudsim.VmSteady;

public class VmSlaCloudletListSteady {
	private int type;
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
	}

}
