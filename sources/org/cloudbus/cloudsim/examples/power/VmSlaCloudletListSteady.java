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
	private int expectedTime;
	
	VmSlaCloudletListSteady(int type,int mips,int sla,int cloudletId){
		this.type=type;
		this.mips=mips;
		this.sla=sla;
		this.cloudletId=cloudletId;
		this.expectedTime=(int)Math.ceil(cloudletId/mips);
	}
	public void addTuple(int type,int mips,int sla,int cloudletId){
		this.type=type;
		this.mips=mips;
		this.sla=sla;
		this.cloudletId=cloudletId;
		this.expectedTime=(int)Math.ceil(cloudletId/mips);
	}
	
	public int[] getTuple(){
		int[] tuple = new int[5];
		tuple[0]=type;
		tuple[1]=mips;
		tuple[2]=sla;
		tuple[3]=cloudletId;
		tuple[4]=expectedTime;
		return tuple;
	}
	public int getMips(){
		return mips;
	}
	public int getSla(){
		return sla;
	}
	public int getCloudletId(){
		return cloudletId;
	}
	public int getExpectedTime(){
		return expectedTime;
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
	public static <T extends VmSlaCloudletListSteady> void sortByExpectedTime(List<T> vmVmSlaCloudletListSteady) {
		Collections.sort(vmVmSlaCloudletListSteady, new Comparator<T>() {

			@Override
			public int compare(T a, T b) throws ClassCastException {
				Integer aExpectedTime = a.getExpectedTime();
				Integer bExpectedTime = b.getExpectedTime();
				return bExpectedTime.compareTo(aExpectedTime);
			}
		});
	}
	public static <T extends VmSlaCloudletListSteady> void sortByExpectedTimeDescending(List<T> vmVmSlaCloudletListSteady) {
		Collections.sort(vmVmSlaCloudletListSteady, new Comparator<T>() {

			@Override
			public int compare(T a, T b) throws ClassCastException {
				Integer aExpectedTime = a.getExpectedTime();
				Integer bExpectedTime = b.getExpectedTime();
				return aExpectedTime.compareTo(bExpectedTime);
			}
		});
	}
	public static <T extends VmSlaCloudletListSteady> void sortBySla(List<T> vmVmSlaCloudletListSteady) {
		Collections.sort(vmVmSlaCloudletListSteady, new Comparator<T>() {

			@Override
			public int compare(T a, T b) throws ClassCastException {
				Integer aSla = a.getSla();
				Integer bSla = b.getSla();
				return bSla.compareTo(aSla);
			}
		});
	}
	public static <T extends VmSlaCloudletListSteady> void sortBySlaDescending(List<T> vmVmSlaCloudletListSteady) {
		Collections.sort(vmVmSlaCloudletListSteady, new Comparator<T>() {

			@Override
			public int compare(T a, T b) throws ClassCastException {
				Integer aSla = a.getSla();
				Integer bSla = b.getSla();
				return aSla.compareTo(bSla);
			}
		});
	}
	public static <T extends VmSlaCloudletListSteady> void printList(List<T> vmVmSlaCloudletListSteady) {
		for(VmSlaCloudletListSteady tuple : vmVmSlaCloudletListSteady){
			System.out.println("\t"+tuple.getTuple()[0]+"\t"+tuple.getTuple()[1]+"\t"+tuple.getTuple()[2]+"\t"+tuple.getTuple()[3]+"\t"+tuple.getTuple()[4]);
		}
	}

}
