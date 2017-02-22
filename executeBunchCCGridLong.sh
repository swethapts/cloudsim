########logN-9.0-0.50-1
echo 'logN-9.0-0.50-1'

sed -i 's/time-logN-[0-9].[0-9]-[0-9].[0-9][0-9]-[0-9]/time-logN-9.0-0.50-1/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java

echo 'Energy Consumption: kWhr, used:'
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7BaselogN-9.0-050-1data-First
echo "CEAi7BaselogN-9.0-050-1data-First"
notify-send "Done! First BAse"
#
########Dvfs
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7DvfslogN-9.0-050-1data-First
echo "CEAi7DvfslogN-9.0-050-1data-First"
notify-send "Done! First DVFS"
#

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-1data-Thresh01
echo "CEAi7DvfslogN-9.0-050-1data-Thresh01"
notify-send "Done! Thresh01Dvfs"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-1data-Thresh02
echo "CEAi7DvfslogN-9.0-050-1data-Thresh02"
notify-send "Done! Thresh02Dvfs"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-1data-Thresh03
echo "CEAi7DvfslogN-9.0-050-1data-Thresh03"
notify-send "Done! Thresh03Dvfs"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-1data-Thresh04
echo "CEAi7DvfslogN-9.0-050-1data-Thresh04"
notify-send "Done! Thresh04Dvfs"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-1data-Thresh05
echo "CEAi7DvfslogN-9.0-050-1data-Thresh05"
notify-send "Done! Thresh05Dvfs"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-1data-Thresh10
echo "CEAi7DvfslogN-9.0-050-1data-Thresh10"
notify-send "Done! Thresh10Dvfs"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-1data-BesTime
echo "CEAi7DvfslogN-9.0-050-1data-BesTime"
notify-send "Done! BesTimeDvfs"

#######Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-1data-Thresh01
echo "CEAi7RarlogN-9.0-050-1data-Thresh01"
notify-send "Done! Thresh01Rar"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-1data-Thresh02
echo "CEAi7RarlogN-9.0-050-1data-Thresh02"
notify-send "Done! Thresh02Rar"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-1data-Thresh03
echo "CEAi7RarlogN-9.0-050-1data-Thresh03"
notify-send "Done! Thresh03Rar"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-1data-Thresh04
echo "CEAi7RarlogN-9.0-050-1data-Thresh04"
notify-send "Done! Thresh04Rar"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-1data-Thresh05
echo "CEAi7RarlogN-9.0-050-1data-Thresh05"
notify-send "Done! Thresh05Rar"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-1data-Thresh10
echo "CEAi7RarlogN-9.0-050-1data-Thresh10"
notify-send "Done! Thresh10Rar"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-1data-BesTime
echo "CEAi7RarlogN-9.0-050-1data-BesTime"
notify-send "Done! BesTimeRar"
#########################################################

########logN-9.0-0.50-2
echo 'logN-9.0-0.50-2'

sed -i 's/time-logN-[0-9].[0-9]-[0-9].[0-9][0-9]-[0-9]/time-logN-9.0-0.50-2/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java

echo 'Energy Consumption: kWhr, used:'
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7BaselogN-9.0-050-2data-First
echo "CEAi7BaselogN-9.0-050-2data-First"
notify-send "Done! First BAse"
#
########Dvfs
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7DvfslogN-9.0-050-2data-First
echo "CEAi7DvfslogN-9.0-050-2data-First"
notify-send "Done! First DVFS"
#

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-2data-Thresh01
echo "CEAi7DvfslogN-9.0-050-2data-Thresh01"
notify-send "Done! Thresh01Dvfs"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-2data-Thresh02
echo "CEAi7DvfslogN-9.0-050-2data-Thresh02"
notify-send "Done! Thresh02Dvfs"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-2data-Thresh03
echo "CEAi7DvfslogN-9.0-050-2data-Thresh03"
notify-send "Done! Thresh03Dvfs"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-2data-Thresh04
echo "CEAi7DvfslogN-9.0-050-2data-Thresh04"
notify-send "Done! Thresh04Dvfs"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-2data-Thresh05
echo "CEAi7DvfslogN-9.0-050-2data-Thresh05"
notify-send "Done! Thresh05Dvfs"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-2data-Thresh10
echo "CEAi7DvfslogN-9.0-050-2data-Thresh10"
notify-send "Done! Thresh10Dvfs"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-2data-BesTime
echo "CEAi7DvfslogN-9.0-050-2data-BesTime"
notify-send "Done! BesTimeDvfs"

#######Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-2data-Thresh01
echo "CEAi7RarlogN-9.0-050-2data-Thresh01"
notify-send "Done! Thresh01Rar"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-2data-Thresh02
echo "CEAi7RarlogN-9.0-050-2data-Thresh02"
notify-send "Done! Thresh02Rar"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-2data-Thresh03
echo "CEAi7RarlogN-9.0-050-2data-Thresh03"
notify-send "Done! Thresh03Rar"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-2data-Thresh04
echo "CEAi7RarlogN-9.0-050-2data-Thresh04"
notify-send "Done! Thresh04Rar"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-2data-Thresh05
echo "CEAi7RarlogN-9.0-050-2data-Thresh05"
notify-send "Done! Thresh05Rar"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-2data-Thresh10
echo "CEAi7RarlogN-9.0-050-2data-Thresh10"
notify-send "Done! Thresh10Rar"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-2data-BesTime
echo "CEAi7RarlogN-9.0-050-2data-BesTime"
notify-send "Done! BesTimeRar"
#########################################################

########logN-9.0-0.50-3
echo 'logN-9.0-0.50-3'

sed -i 's/time-logN-[0-9].[0-9]-[0-9].[0-9][0-9]-[0-9]/time-logN-9.0-0.50-3/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java

echo 'Energy Consumption: kWhr, used:'
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7BaselogN-9.0-050-3data-First
echo "CEAi7BaselogN-9.0-050-3data-First"
notify-send "Done! First BAse"
#
########Dvfs
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7DvfslogN-9.0-050-3data-First
echo "CEAi7DvfslogN-9.0-050-3data-First"
notify-send "Done! First DVFS"
#

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-3data-Thresh01
echo "CEAi7DvfslogN-9.0-050-3data-Thresh01"
notify-send "Done! Thresh01Dvfs"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-3data-Thresh02
echo "CEAi7DvfslogN-9.0-050-3data-Thresh02"
notify-send "Done! Thresh02Dvfs"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-3data-Thresh03
echo "CEAi7DvfslogN-9.0-050-3data-Thresh03"
notify-send "Done! Thresh03Dvfs"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-3data-Thresh04
echo "CEAi7DvfslogN-9.0-050-3data-Thresh04"
notify-send "Done! Thresh04Dvfs"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-3data-Thresh05
echo "CEAi7DvfslogN-9.0-050-3data-Thresh05"
notify-send "Done! Thresh05Dvfs"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-3data-Thresh10
echo "CEAi7DvfslogN-9.0-050-3data-Thresh10"
notify-send "Done! Thresh10Dvfs"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7DvfslogN-9.0-050-3data-BesTime
echo "CEAi7DvfslogN-9.0-050-3data-BesTime"
notify-send "Done! BesTimeDvfs"

#######Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-3data-Thresh01
echo "CEAi7RarlogN-9.0-050-3data-Thresh01"
notify-send "Done! Thresh01Rar"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-3data-Thresh02
echo "CEAi7RarlogN-9.0-050-3data-Thresh02"
notify-send "Done! Thresh02Rar"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-3data-Thresh03
echo "CEAi7RarlogN-9.0-050-3data-Thresh03"
notify-send "Done! Thresh03Rar"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-3data-Thresh04
echo "CEAi7RarlogN-9.0-050-3data-Thresh04"
notify-send "Done! Thresh04Rar"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-3data-Thresh05
echo "CEAi7RarlogN-9.0-050-3data-Thresh05"
notify-send "Done! Thresh05Rar"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-3data-Thresh10
echo "CEAi7RarlogN-9.0-050-3data-Thresh10"
notify-send "Done! Thresh10Rar"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7RarlogN-9.0-050-3data-BesTime
echo "CEAi7RarlogN-9.0-050-3data-BesTime"
notify-send "Done! BesTimeRar"
#########################################################

########logN-9.0-1.15-1
echo 'logN-9.0-1.15-1'

sed -i 's/time-logN-[0-9].[0-9]-[0-9].[0-9][0-9]-[0-9]/time-logN-9.0-1.15-1/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java

echo 'Energy Consumption: kWhr, used:'
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7BaselogN-9.0-115-1data-First
echo "CEAi7BaselogN-9.0-115-1data-First"
notify-send "Done! First BAse"
#
########Dvfs
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7DvfslogN-9.0-115-1data-First
echo "CEAi7DvfslogN-9.0-115-1data-First"
notify-send "Done! First DVFS"
#

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-1data-Thresh01
echo "CEAi7DvfslogN-9.0-115-1data-Thresh01"
notify-send "Done! Thresh01Dvfs"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-1data-Thresh02
echo "CEAi7DvfslogN-9.0-115-1data-Thresh02"
notify-send "Done! Thresh02Dvfs"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-1data-Thresh03
echo "CEAi7DvfslogN-9.0-115-1data-Thresh03"
notify-send "Done! Thresh03Dvfs"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-1data-Thresh04
echo "CEAi7DvfslogN-9.0-115-1data-Thresh04"
notify-send "Done! Thresh04Dvfs"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-1data-Thresh05
echo "CEAi7DvfslogN-9.0-115-1data-Thresh05"
notify-send "Done! Thresh05Dvfs"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-1data-Thresh10
echo "CEAi7DvfslogN-9.0-115-1data-Thresh10"
notify-send "Done! Thresh10Dvfs"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-1data-BesTime
echo "CEAi7DvfslogN-9.0-115-1data-BesTime"
notify-send "Done! BesTimeDvfs"

#######Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-1data-Thresh01
echo "CEAi7RarlogN-9.0-115-1data-Thresh01"
notify-send "Done! Thresh01Rar"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-1data-Thresh02
echo "CEAi7RarlogN-9.0-115-1data-Thresh02"
notify-send "Done! Thresh02Rar"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-1data-Thresh03
echo "CEAi7RarlogN-9.0-115-1data-Thresh03"
notify-send "Done! Thresh03Rar"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-1data-Thresh04
echo "CEAi7RarlogN-9.0-115-1data-Thresh04"
notify-send "Done! Thresh04Rar"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-1data-Thresh05
echo "CEAi7RarlogN-9.0-115-1data-Thresh05"
notify-send "Done! Thresh05Rar"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-1data-Thresh10
echo "CEAi7RarlogN-9.0-115-1data-Thresh10"
notify-send "Done! Thresh10Rar"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-1data-BesTime
echo "CEAi7RarlogN-9.0-115-1data-BesTime"
notify-send "Done! BesTimeRar"
#########################################################

########logN-9.0-1.15-2
echo 'logN-9.0-1.15-2'

sed -i 's/time-logN-[0-9].[0-9]-[0-9].[0-9][0-9]-[0-9]/time-logN-9.0-1.15-2/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java

echo 'Energy Consumption: kWhr, used:'
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7BaselogN-9.0-115-2data-First
echo "CEAi7BaselogN-9.0-115-2data-First"
notify-send "Done! First BAse"
#
########Dvfs
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7DvfslogN-9.0-115-2data-First
echo "CEAi7DvfslogN-9.0-115-2data-First"
notify-send "Done! First DVFS"
#

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-2data-Thresh01
echo "CEAi7DvfslogN-9.0-115-2data-Thresh01"
notify-send "Done! Thresh01Dvfs"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-2data-Thresh02
echo "CEAi7DvfslogN-9.0-115-2data-Thresh02"
notify-send "Done! Thresh02Dvfs"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-2data-Thresh03
echo "CEAi7DvfslogN-9.0-115-2data-Thresh03"
notify-send "Done! Thresh03Dvfs"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-2data-Thresh04
echo "CEAi7DvfslogN-9.0-115-2data-Thresh04"
notify-send "Done! Thresh04Dvfs"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-2data-Thresh05
echo "CEAi7DvfslogN-9.0-115-2data-Thresh05"
notify-send "Done! Thresh05Dvfs"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-2data-Thresh10
echo "CEAi7DvfslogN-9.0-115-2data-Thresh10"
notify-send "Done! Thresh10Dvfs"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-2data-BesTime
echo "CEAi7DvfslogN-9.0-115-2data-BesTime"
notify-send "Done! BesTimeDvfs"

#######Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-2data-Thresh01
echo "CEAi7RarlogN-9.0-115-2data-Thresh01"
notify-send "Done! Thresh01Rar"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-2data-Thresh02
echo "CEAi7RarlogN-9.0-115-2data-Thresh02"
notify-send "Done! Thresh02Rar"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-2data-Thresh03
echo "CEAi7RarlogN-9.0-115-2data-Thresh03"
notify-send "Done! Thresh03Rar"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-2data-Thresh04
echo "CEAi7RarlogN-9.0-115-2data-Thresh04"
notify-send "Done! Thresh04Rar"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-2data-Thresh05
echo "CEAi7RarlogN-9.0-115-2data-Thresh05"
notify-send "Done! Thresh05Rar"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-2data-Thresh10
echo "CEAi7RarlogN-9.0-115-2data-Thresh10"
notify-send "Done! Thresh10Rar"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-2data-BesTime
echo "CEAi7RarlogN-9.0-115-2data-BesTime"
notify-send "Done! BesTimeRar"
#########################################################

########logN-9.0-1.15-3
echo 'logN-9.0-1.15-3'

sed -i 's/time-logN-[0-9].[0-9]-[0-9].[0-9][0-9]-[0-9]/time-logN-9.0-1.15-3/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java

echo 'Energy Consumption: kWhr, used:'
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7BaselogN-9.0-115-3data-First
echo "CEAi7BaselogN-9.0-115-3data-First"
notify-send "Done! First BAse"
#
########Dvfs
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../APS5/CEAi7DvfslogN-9.0-115-3data-First
echo "CEAi7DvfslogN-9.0-115-3data-First"
notify-send "Done! First DVFS"
#

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-3data-Thresh01
echo "CEAi7DvfslogN-9.0-115-3data-Thresh01"
notify-send "Done! Thresh01Dvfs"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-3data-Thresh02
echo "CEAi7DvfslogN-9.0-115-3data-Thresh02"
notify-send "Done! Thresh02Dvfs"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-3data-Thresh03
echo "CEAi7DvfslogN-9.0-115-3data-Thresh03"
notify-send "Done! Thresh03Dvfs"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-3data-Thresh04
echo "CEAi7DvfslogN-9.0-115-3data-Thresh04"
notify-send "Done! Thresh04Dvfs"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-3data-Thresh05
echo "CEAi7DvfslogN-9.0-115-3data-Thresh05"
notify-send "Done! Thresh05Dvfs"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-3data-Thresh10
echo "CEAi7DvfslogN-9.0-115-3data-Thresh10"
notify-send "Done! Thresh10Dvfs"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7DvfslogN-9.0-115-3data-BesTime
echo "CEAi7DvfslogN-9.0-115-3data-BesTime"
notify-send "Done! BesTimeDvfs"

#######Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-3data-Thresh01
echo "CEAi7RarlogN-9.0-115-3data-Thresh01"
notify-send "Done! Thresh01Rar"

#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-3data-Thresh02
echo "CEAi7RarlogN-9.0-115-3data-Thresh02"
notify-send "Done! Thresh02Rar"

#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-3data-Thresh03
echo "CEAi7RarlogN-9.0-115-3data-Thresh03"
notify-send "Done! Thresh03Rar"

#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-3data-Thresh04
echo "CEAi7RarlogN-9.0-115-3data-Thresh04"
notify-send "Done! Thresh04Rar"

#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-3data-Thresh05
echo "CEAi7RarlogN-9.0-115-3data-Thresh05"
notify-send "Done! Thresh05Rar"

sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-3data-Thresh10
echo "CEAi7RarlogN-9.0-115-3data-Thresh10"
notify-send "Done! Thresh10Rar"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../APS5/CEAi7RarlogN-9.0-115-3data-BesTime
echo "CEAi7RarlogN-9.0-115-3data-BesTime"
notify-send "Done! BesTimeRar"
#########################################################

