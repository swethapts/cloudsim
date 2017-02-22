
echo 'Energy Consumption: kWhr, used:'
sed -i 's/time-[0-9]*[m-s]-[0-9]*/time-1250m-991/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/length-[0-9]*[m-s]-[0-9]*/length-1250m-991/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/NUMBER_OF_VMS = [0-9]*;/NUMBER_OF_VMS = 991;/g' sources/org/cloudbus/cloudsim/examples/power/steady/SteadyConstants.java
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Base1250m-991data-First
echo "CEAi7Base1250m-991data-First"
notify-send "Done! First BAse"
#
########Dvfs

sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
###FT
##
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Dvfs1250m-991data-First
echo "CEAi7Dvfs1250m-991data-First"
notify-send "Done! First DVFS"
##
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
#ant clean
#ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs1250m-991data-Thresh01
echo "CEAi7Dvfs1250m-991data-Thresh01"
notify-send "Done! Thresh01Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs1250m-991data-Thresh02
#echo "CEAi7Dvfs1250m-991data-Thresh02"
#notify-send "Done! Thresh01dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs1250m-991data-Thresh03
#echo "CEAi7Dvfs1250m-991data-Thresh03"
#notify-send "Done! Thresh03Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs1250m-991data-Thresh04
#echo "CEAi7Dvfs1250m-991data-Thresh04"
#notify-send "Done! Thresh04Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs1250m-991data-Thresh05
#echo "CEAi7Dvfs1250m-991data-Thresh05"
#notify-send "Done! Thresh05Dvfs"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs1250m-991data-Thresh10
echo "CEAi7Dvfs1250m-991data-Thresh10"
notify-send "Done! Thresh10Dvfs"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs1250m-991data-BesTime
echo "CEAi7Dvfs1250m-991data-BesTime"
notify-send "Done! BesTimeDvfs"
#
########Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar1250m-991data-Thresh01
echo "CEAi7Rar1250m-991data-Thresh01"
notify-send "Done! Thresh01Rar"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar1250m-991data-Thresh02
#echo "CEAi7Rar1250m-991data-Thresh02"
#notify-send "Done! Thresh02Rar"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar1250m-991data-Thresh03
#echo "CEAi7Rar1250m-991data-Thresh03"
#notify-send "Done! Thresh03Rar"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar1250m-991data-Thresh04
#echo "CEAi7Rar1250m-991data-Thresh04"
#notify-send "Done! Thresh04Rar"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar1250m-991data-Thresh05
#echo "CEAi7Rar1250m-991data-Thresh05"
#notify-send "Done! Thresh05Rar"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar1250m-991data-Thresh10
echo "CEAi7Rar1250m-991data-Thresh10"
notify-send "Done! Thresh10Rar"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Rar1250m-991data-BesTime
echo "CEAi7Rar1250m-991data-BesTime"
notify-send "Done! BesTimeRar"


##############################################################


echo 'Energy Consumption: kWhr, used:'
sed -i 's/time-[0-9]*[m-s]-[0-9]*/time-2000m-1216/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/length-[0-9]*[m-s]-[0-9]*/length-2000m-1216/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/NUMBER_OF_VMS = [0-9]*;/NUMBER_OF_VMS = 1216;/g' sources/org/cloudbus/cloudsim/examples/power/steady/SteadyConstants.java
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Base2000m-1216data-First
echo "CEAi7Base2000m-1216data-First"
notify-send "Done! First BAse"
#
########Dvfs

sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
###FT
##
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Dvfs2000m-1216data-First
echo "CEAi7Dvfs2000m-1216data-First"
notify-send "Done! First DVFS"
##
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
#ant clean
#ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs2000m-1216data-Thresh01
echo "CEAi7Dvfs2000m-1216data-Thresh01"
notify-send "Done! Thresh01Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs2000m-1216data-Thresh02
#echo "CEAi7Dvfs2000m-1216data-Thresh02"
#notify-send "Done! Thresh01dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs2000m-1216data-Thresh03
#echo "CEAi7Dvfs2000m-1216data-Thresh03"
#notify-send "Done! Thresh03Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs2000m-1216data-Thresh04
#echo "CEAi7Dvfs2000m-1216data-Thresh04"
#notify-send "Done! Thresh04Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs2000m-1216data-Thresh05
#echo "CEAi7Dvfs2000m-1216data-Thresh05"
#notify-send "Done! Thresh05Dvfs"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs2000m-1216data-Thresh10
echo "CEAi7Dvfs2000m-1216data-Thresh10"
notify-send "Done! Thresh10Dvfs"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs2000m-1216data-BesTime
echo "CEAi7Dvfs2000m-1216data-BesTime"
notify-send "Done! BesTimeDvfs"
#
########Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar2000m-1216data-Thresh01
echo "CEAi7Rar2000m-1216data-Thresh01"
notify-send "Done! Thresh01Rar"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar2000m-1216data-Thresh02
#echo "CEAi7Rar2000m-1216data-Thresh02"
#notify-send "Done! Thresh02Rar"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar2000m-1216data-Thresh03
#echo "CEAi7Rar2000m-1216data-Thresh03"
#notify-send "Done! Thresh03Rar"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar2000m-1216data-Thresh04
#echo "CEAi7Rar2000m-1216data-Thresh04"
#notify-send "Done! Thresh04Rar"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar2000m-1216data-Thresh05
#echo "CEAi7Rar2000m-1216data-Thresh05"
#notify-send "Done! Thresh05Rar"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar2000m-1216data-Thresh10
echo "CEAi7Rar2000m-1216data-Thresh10"
notify-send "Done! Thresh10Rar"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Rar2000m-1216data-BesTime
echo "CEAi7Rar2000m-1216data-BesTime"
notify-send "Done! BesTimeRar"


##############################################################


echo 'Energy Consumption: kWhr, used:'
sed -i 's/time-[0-9]*[m-s]-[0-9]*/time-3100m-1101/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/length-[0-9]*[m-s]-[0-9]*/length-3100m-1101/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/NUMBER_OF_VMS = [0-9]*;/NUMBER_OF_VMS = 1101;/g' sources/org/cloudbus/cloudsim/examples/power/steady/SteadyConstants.java
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Base3100m-1101data-First
echo "CEAi7Base3100m-1101data-First"
notify-send "Done! First BAse"
#
########Dvfs

sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
###FT
##
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Dvfs3100m-1101data-First
echo "CEAi7Dvfs3100m-1101data-First"
notify-send "Done! First DVFS"
##
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
#ant clean
#ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs3100m-1101data-Thresh01
echo "CEAi7Dvfs3100m-1101data-Thresh01"
notify-send "Done! Thresh01Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs3100m-1101data-Thresh02
#echo "CEAi7Dvfs3100m-1101data-Thresh02"
#notify-send "Done! Thresh01dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs3100m-1101data-Thresh03
#echo "CEAi7Dvfs3100m-1101data-Thresh03"
#notify-send "Done! Thresh03Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs3100m-1101data-Thresh04
#echo "CEAi7Dvfs3100m-1101data-Thresh04"
#notify-send "Done! Thresh04Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs3100m-1101data-Thresh05
#echo "CEAi7Dvfs3100m-1101data-Thresh05"
#notify-send "Done! Thresh05Dvfs"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs3100m-1101data-Thresh10
echo "CEAi7Dvfs3100m-1101data-Thresh10"
notify-send "Done! Thresh10Dvfs"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs3100m-1101data-BesTime
echo "CEAi7Dvfs3100m-1101data-BesTime"
notify-send "Done! BesTimeDvfs"
#
########Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar3100m-1101data-Thresh01
echo "CEAi7Rar3100m-1101data-Thresh01"
notify-send "Done! Thresh01Rar"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar3100m-1101data-Thresh02
#echo "CEAi7Rar3100m-1101data-Thresh02"
#notify-send "Done! Thresh02Rar"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar3100m-1101data-Thresh03
#echo "CEAi7Rar3100m-1101data-Thresh03"
#notify-send "Done! Thresh03Rar"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar3100m-1101data-Thresh04
#echo "CEAi7Rar3100m-1101data-Thresh04"
#notify-send "Done! Thresh04Rar"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar3100m-1101data-Thresh05
#echo "CEAi7Rar3100m-1101data-Thresh05"
#notify-send "Done! Thresh05Rar"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar3100m-1101data-Thresh10
echo "CEAi7Rar3100m-1101data-Thresh10"
notify-send "Done! Thresh10Rar"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Rar3100m-1101data-BesTime
echo "CEAi7Rar3100m-1101data-BesTime"
notify-send "Done! BesTimeRar"


##############################################################


##############################################################


echo 'Energy Consumption: kWhr, used:'
sed -i 's/time-[0-9]*[m-s]-[0-9]*/time-13900s-1104/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/length-[0-9]*[m-s]-[0-9]*/length-13900s-1104/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/NUMBER_OF_VMS = [0-9]*;/NUMBER_OF_VMS = 1104;/g' sources/org/cloudbus/cloudsim/examples/power/steady/SteadyConstants.java
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Base13900s-1104data-First
echo "CEAi7Base13900s-1104data-First"
notify-send "Done! First BAse"
#
########Dvfs

sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
###FT
##
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Dvfs13900s-1104data-First
echo "CEAi7Dvfs13900s-1104data-First"
notify-send "Done! First DVFS"
##
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
#ant clean
#ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs13900s-1104data-Thresh01
echo "CEAi7Dvfs13900s-1104data-Thresh01"
notify-send "Done! Thresh01Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs13900s-1104data-Thresh02
#echo "CEAi7Dvfs13900s-1104data-Thresh02"
#notify-send "Done! Thresh01dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs13900s-1104data-Thresh03
#echo "CEAi7Dvfs13900s-1104data-Thresh03"
#notify-send "Done! Thresh03Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs13900s-1104data-Thresh04
#echo "CEAi7Dvfs13900s-1104data-Thresh04"
#notify-send "Done! Thresh04Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs13900s-1104data-Thresh05
#echo "CEAi7Dvfs13900s-1104data-Thresh05"
#notify-send "Done! Thresh05Dvfs"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs13900s-1104data-Thresh10
echo "CEAi7Dvfs13900s-1104data-Thresh10"
notify-send "Done! Thresh10Dvfs"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs13900s-1104data-BesTime
echo "CEAi7Dvfs13900s-1104data-BesTime"
notify-send "Done! BesTimeDvfs"
#
########Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar13900s-1104data-Thresh01
echo "CEAi7Rar13900s-1104data-Thresh01"
notify-send "Done! Thresh01Rar"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar13900s-1104data-Thresh02
#echo "CEAi7Rar13900s-1104data-Thresh02"
#notify-send "Done! Thresh02Rar"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar13900s-1104data-Thresh03
#echo "CEAi7Rar13900s-1104data-Thresh03"
#notify-send "Done! Thresh03Rar"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar13900s-1104data-Thresh04
#echo "CEAi7Rar13900s-1104data-Thresh04"
#notify-send "Done! Thresh04Rar"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar13900s-1104data-Thresh05
#echo "CEAi7Rar13900s-1104data-Thresh05"
#notify-send "Done! Thresh05Rar"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar13900s-1104data-Thresh10
echo "CEAi7Rar13900s-1104data-Thresh10"
notify-send "Done! Thresh10Rar"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Rar13900s-1104data-BesTime
echo "CEAi7Rar13900s-1104data-BesTime"
notify-send "Done! BesTimeRar"


##############################################################


echo 'Energy Consumption: kWhr, used:'
sed -i 's/time-[0-9]*[m-s]-[0-9]*/time-7200s-1209/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/length-[0-9]*[m-s]-[0-9]*/length-7200s-1209/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/NUMBER_OF_VMS = [0-9]*;/NUMBER_OF_VMS = 1209;/g' sources/org/cloudbus/cloudsim/examples/power/steady/SteadyConstants.java
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Base7200s-1209data-First
echo "CEAi7Base7200s-1209data-First"
notify-send "Done! First BAse"
#
########Dvfs

sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
###FT
##
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Dvfs7200s-1209data-First
echo "CEAi7Dvfs7200s-1209data-First"
notify-send "Done! First DVFS"
##
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
#ant clean
#ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs7200s-1209data-Thresh01
echo "CEAi7Dvfs7200s-1209data-Thresh01"
notify-send "Done! Thresh01Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs7200s-1209data-Thresh02
#echo "CEAi7Dvfs7200s-1209data-Thresh02"
#notify-send "Done! Thresh01dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs7200s-1209data-Thresh03
#echo "CEAi7Dvfs7200s-1209data-Thresh03"
#notify-send "Done! Thresh03Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs7200s-1209data-Thresh04
#echo "CEAi7Dvfs7200s-1209data-Thresh04"
#notify-send "Done! Thresh04Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs7200s-1209data-Thresh05
#echo "CEAi7Dvfs7200s-1209data-Thresh05"
#notify-send "Done! Thresh05Dvfs"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs7200s-1209data-Thresh10
echo "CEAi7Dvfs7200s-1209data-Thresh10"
notify-send "Done! Thresh10Dvfs"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs7200s-1209data-BesTime
echo "CEAi7Dvfs7200s-1209data-BesTime"
notify-send "Done! BesTimeDvfs"
#
########Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar7200s-1209data-Thresh01
echo "CEAi7Rar7200s-1209data-Thresh01"
notify-send "Done! Thresh01Rar"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar7200s-1209data-Thresh02
#echo "CEAi7Rar7200s-1209data-Thresh02"
#notify-send "Done! Thresh02Rar"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar7200s-1209data-Thresh03
#echo "CEAi7Rar7200s-1209data-Thresh03"
#notify-send "Done! Thresh03Rar"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar7200s-1209data-Thresh04
#echo "CEAi7Rar7200s-1209data-Thresh04"
#notify-send "Done! Thresh04Rar"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar7200s-1209data-Thresh05
#echo "CEAi7Rar7200s-1209data-Thresh05"
#notify-send "Done! Thresh05Rar"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar7200s-1209data-Thresh10
echo "CEAi7Rar7200s-1209data-Thresh10"
notify-send "Done! Thresh10Rar"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Rar7200s-1209data-BesTime
echo "CEAi7Rar7200s-1209data-BesTime"
notify-send "Done! BesTimeRar"


##############################################################


echo 'Energy Consumption: kWhr, used:'
sed -i 's/time-[0-9]*[m-s]-[0-9]*/time-550m-1195/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/length-[0-9]*[m-s]-[0-9]*/length-550m-1195/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/NUMBER_OF_VMS = [0-9]*;/NUMBER_OF_VMS = 1195;/g' sources/org/cloudbus/cloudsim/examples/power/steady/SteadyConstants.java
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Base550m-1195data-First
echo "CEAi7Base550m-1195data-First"
notify-send "Done! First BAse"
#
########Dvfs

sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
###FT
##
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Dvfs550m-1195data-First
echo "CEAi7Dvfs550m-1195data-First"
notify-send "Done! First DVFS"
##
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
#ant clean
#ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs550m-1195data-Thresh01
echo "CEAi7Dvfs550m-1195data-Thresh01"
notify-send "Done! Thresh01Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs550m-1195data-Thresh02
#echo "CEAi7Dvfs550m-1195data-Thresh02"
#notify-send "Done! Thresh01dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs550m-1195data-Thresh03
#echo "CEAi7Dvfs550m-1195data-Thresh03"
#notify-send "Done! Thresh03Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs550m-1195data-Thresh04
#echo "CEAi7Dvfs550m-1195data-Thresh04"
#notify-send "Done! Thresh04Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs550m-1195data-Thresh05
#echo "CEAi7Dvfs550m-1195data-Thresh05"
#notify-send "Done! Thresh05Dvfs"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs550m-1195data-Thresh10
echo "CEAi7Dvfs550m-1195data-Thresh10"
notify-send "Done! Thresh10Dvfs"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs550m-1195data-BesTime
echo "CEAi7Dvfs550m-1195data-BesTime"
notify-send "Done! BesTimeDvfs"
#
########Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar550m-1195data-Thresh01
echo "CEAi7Rar550m-1195data-Thresh01"
notify-send "Done! Thresh01Rar"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar550m-1195data-Thresh02
#echo "CEAi7Rar550m-1195data-Thresh02"
#notify-send "Done! Thresh02Rar"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar550m-1195data-Thresh03
#echo "CEAi7Rar550m-1195data-Thresh03"
#notify-send "Done! Thresh03Rar"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar550m-1195data-Thresh04
#echo "CEAi7Rar550m-1195data-Thresh04"
#notify-send "Done! Thresh04Rar"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar550m-1195data-Thresh05
#echo "CEAi7Rar550m-1195data-Thresh05"
#notify-send "Done! Thresh05Rar"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar550m-1195data-Thresh10
echo "CEAi7Rar550m-1195data-Thresh10"
notify-send "Done! Thresh10Rar"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Rar550m-1195data-BesTime
echo "CEAi7Rar550m-1195data-BesTime"
notify-send "Done! BesTimeRar"


##############################################################


echo 'Energy Consumption: kWhr, used:'
sed -i 's/time-[0-9]*[m-s]-[0-9]*/time-600s-2255/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/length-[0-9]*[m-s]-[0-9]*/length-600s-2255/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteadyWorkload.java
sed -i 's/NUMBER_OF_VMS = [0-9]*;/NUMBER_OF_VMS = 2255;/g' sources/org/cloudbus/cloudsim/examples/power/steady/SteadyConstants.java
#######Base
sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\tgetVmAllocationPolicy().changeMipsOfPes()/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
##FT
#
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Base600s-2255data-First
echo "CEAi7Base600s-2255data-First"
notify-send "Done! First BAse"
#
########Dvfs

sed -i 's/\tgetVmAllocationPolicy().reallocateRemainingMips()/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
###FT
##
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf > ../Cloud2017/data/data/CEAi7Dvfs600s-2255data-First
echo "CEAi7Dvfs600s-2255data-First"
notify-send "Done! First DVFS"
##
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
#ant clean
#ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs600s-2255data-Thresh01
echo "CEAi7Dvfs600s-2255data-Thresh01"
notify-send "Done! Thresh01Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs600s-2255data-Thresh02
#echo "CEAi7Dvfs600s-2255data-Thresh02"
#notify-send "Done! Thresh01dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs600s-2255data-Thresh03
#echo "CEAi7Dvfs600s-2255data-Thresh03"
#notify-send "Done! Thresh03Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs600s-2255data-Thresh04
#echo "CEAi7Dvfs600s-2255data-Thresh04"
#notify-send "Done! Thresh04Dvfs"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs600s-2255data-Thresh05
#echo "CEAi7Dvfs600s-2255data-Thresh05"
#notify-send "Done! Thresh05Dvfs"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs600s-2255data-Thresh10
echo "CEAi7Dvfs600s-2255data-Thresh10"
notify-send "Done! Thresh10Dvfs"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Dvfs600s-2255data-BesTime
echo "CEAi7Dvfs600s-2255data-BesTime"
notify-send "Done! BesTimeDvfs"
#
########Rar
sed -i 's/\t\/\/getVmAllocationPolicy().reallocateRemainingMips()/\tgetVmAllocationPolicy().reallocateRemainingMips()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
sed -i 's/\t\/\/getVmAllocationPolicy().changeMipsOfPes()/\tgetVmAllocationPolicy().changeMipsOfPes()/g' sources/org/cloudbus/cloudsim/power/PowerDatacenterSteady.java
#
##TF
#
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
#
sed -i 's/0.[0-9][0-9]/0.01/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar600s-2255data-Thresh01
echo "CEAi7Rar600s-2255data-Thresh01"
notify-send "Done! Thresh01Rar"
#
#sed -i 's/0.[0-9][0-9]/0.02/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar600s-2255data-Thresh02
#echo "CEAi7Rar600s-2255data-Thresh02"
#notify-send "Done! Thresh02Rar"
#
#sed -i 's/0.[0-9][0-9]/0.03/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar600s-2255data-Thresh03
#echo "CEAi7Rar600s-2255data-Thresh03"
#notify-send "Done! Thresh03Rar"
#
#sed -i 's/0.[0-9][0-9]/0.04/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar600s-2255data-Thresh04
#echo "CEAi7Rar600s-2255data-Thresh04"
#notify-send "Done! Thresh04Rar"
#
#sed -i 's/0.[0-9][0-9]/0.05/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
#ant clean
#ant
#time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar600s-2255data-Thresh05
#echo "CEAi7Rar600s-2255data-Thresh05"
#notify-send "Done! Thresh05Rar"
#
sed -i 's/0.[0-9][0-9]/0.10/g' sources/org/cloudbus/cloudsim/power/PowerVmAllocationPolicyFfCtAverageSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg > ../Cloud2017/data/data/CEAi7Rar600s-2255data-Thresh10
echo "CEAi7Rar600s-2255data-Thresh10"
notify-send "Done! Thresh10Rar"
#
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg > ../Cloud2017/data/data/CEAi7Rar600s-2255data-BesTime
echo "CEAi7Rar600s-2255data-BesTime"
notify-send "Done! BesTimeRar"

