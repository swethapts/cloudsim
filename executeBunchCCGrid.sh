#.sed -i 's/CLOUDLET_LENGTH_PRIVATE = {2500000};\/\/,4000000};/CLOUDLET_LENGTH_PRIVATE = {2500000,4000000};/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
echo 'Energy Consumption: kWhr, used:'
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
#FT

sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf
echo "randomBasei7-First"

#######Dvfs
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
#FT

sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf
echo "randomDvfsi7-First"
notify-send "Done! First"

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/05)/05)/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
echo "randomDvfsi7-Thresh05"
notify-send "Done! Thresh05"

sed -i 's/05)/15)/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
echo "randomDvfsi7-Thresh15"
notify-send "Done! Thresh15"

sed -i 's/15)/25)/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
echo "randomDvfsi7-Thresh25"
notify-send "Done! Thresh25"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg
echo "randomDvfsi7-BesTime"
notify-send "Done! BesTime"


#######Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java

#TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

sed -i 's/05)/05)/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
echo "randomRari7-Thresh05"
notify-send "Done! Thresh05Rar"

sed -i 's/05)/15)/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
echo "randomRari7-Thresh15"
notify-send "Done! Thresh15Rar"

sed -i 's/15)/25)/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
echo "randomRari7-Thresh25"
notify-send "Done! Thresh25Rar"

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg
echo "randomRari7-BesTime"
notify-send "Done! BesTimeRar"


#!sed -i 's/u1-1000;s1-600;u2-6500;s2-600-1\*\/{{/u1-1000;s1-600;u2-6500;s2-600-1{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
