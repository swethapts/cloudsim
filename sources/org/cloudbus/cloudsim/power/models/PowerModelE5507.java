/*
 * Title:        CloudSim Toolkit
 * Description:  CloudSim (Cloud Simulation) Toolkit for Modeling and Simulation of Clouds
 * Licence:      GPL - http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2009-2012, The University of Melbourne, Australia
 */

package org.cloudbus.cloudsim.power.models;

/**
 * The power model of an HP ProLiant ML110 G3 (1 x [Pentium D930 3000 MHz, 2 cores], 4GB).
 * http://www.spec.org/power_ssj2008/results/res2011q1/power_ssj2008-20110127-00342.html
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
 * @since CloudSim Toolkit 3.0
 */
public class PowerModelE5507 extends PowerModelSwe {

	/** The power. */
	//private final double[][] power = {{ 105, 112, 118, 125, 131, 137, 147, 153, 157, 164, 169 },{ 1050, 1120, 1180, 1250, 1310, 1370, 1470, 1530, 1570, 1640, 1690 },{ 10500, 11200, 11800, 12500, 13100, 13700, 14700, 15300, 15700, 16400, 16900 }};

	private final double fmin = 1597;//1600;
	private final double fmax = 2262;//3400;
	
	private final double powerFminIdle = 77.28;//35.54;
	private final double powerFmaxIdle = 77.46;//36.14;
	private final double powerFminPeak = 127.77;//51.36;
	private final double powerFmaxPeak = 148.82;//92.56;
	
	private final double alpha = (powerFmaxIdle - powerFminIdle) * (fmax/(fmax - fmin));
	private final double A = ((powerFmaxPeak - powerFmaxIdle) - (powerFminPeak - powerFminIdle)) * (fmax/(fmax - fmin));
	private final double B = (powerFmaxPeak - powerFmaxIdle) - A;
	
	/*
	 * (non-Javadoc)
	 * @see org.cloudbus.cloudsim.power.models.PowerModelSpecPower#getPowerData(int)
	 */
	@Override
	protected double getPowerData(double util) {
		int freq = (int) this.fmax;
		return (powerFmaxIdle - alpha*((fmax - freq) / fmax) + (A * freq/fmax + B)*util);
	}
	protected double getPowerData(int freq,double util) {
//		System.out.println("alpha" + alpha + " A," + A + "B, " + B + "util" + util + "\n power = " + (freq));
		return (powerFmaxIdle - alpha*((fmax - freq) / fmax) + (A * freq/fmax + B)*util);
	}
	//protected double

}
