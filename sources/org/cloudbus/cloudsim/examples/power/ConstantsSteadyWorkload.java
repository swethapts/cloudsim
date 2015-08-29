package org.cloudbus.cloudsim.examples.power;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.util.Scanner;

public class ConstantsSteadyWorkload{
	public final static int [] CLOUDLET_LENGTH_CEA=getLength();
	public final static int[][] VM_CT_UNSORTED=getTime();

	private static int[] getLength() {
		// TODO Auto-generated method stub
		
		int [] length = new int [26804];
		int i=0;
		FileInputStream fis = null;
		BufferedReader reader = null;
        try {
            fis = new FileInputStream("/home/swethapts/cloudsim/sources/org/cloudbus/cloudsim/examples/power/length.txt");
            reader = new BufferedReader(new InputStreamReader(fis));
            String line = reader.readLine();
            while(line != null){
                length[i++]=(Integer.parseInt(line));
                line = reader.readLine();
            }          
            reader.close();

        } catch (Exception ex) {
            //Logger.getLogger(BufferedReaderExample.class.getName()).log(Level.SEVERE, null, ex);
        }
        return length;

	}

	private static void printList(int[] length) {
		for(int i=0; i<length.length; i++){
			System.out.println(length[i]);
		}
	}

	private static int[][] getTime()  {
		// TODO Auto-generated method stub
		Scanner scanner;
		int [][] time = new int [26804][1];
		int i = 0;
		FileInputStream fis = null;
		BufferedReader reader = null;
        try {
            fis = new FileInputStream("/home/swethapts/cloudsim/sources/org/cloudbus/cloudsim/examples/power/time.txt");
            reader = new BufferedReader(new InputStreamReader(fis));
            String line = reader.readLine();
            while(line != null){
                time[i++][0]=(Integer.parseInt(line));
                line = reader.readLine();
            }          
            reader.close();

        } catch (Exception ex) {
            //Logger.getLogger(BufferedReaderExample.class.getName()).log(Level.SEVERE, null, ex);
        }
		return time;
	}
}