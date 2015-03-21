sed -i 's/CLOUDLET_LENGTH_PRIVATE = {2500000};\/\/,4000000};/CLOUDLET_LENGTH_PRIVATE = {2500000,4000000};/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u1-1500;s1-600;u2-3500;s2-600-3{{/u1-1500;s1-600;u2-3500;s2-600-3\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf
notify-send "Done! FFDM"
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBf
notify-send "Done! BFDM"
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsWf
notify-send "Done! WFDM"
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
notify-send "Done! TFFDM"
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg
notify-send "Done! TBFDM"

echo "Increasing Mips"
##FT
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf
notify-send "Done! FFIM"
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
notify-send "Done! TFFIM"
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg
notify-send "Done! TBFIM"
##FF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf
notify-send "Done! FFDT"
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
notify-send "Done! TFFDT"
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg
notify-send "Done! TBFDT"
##TF

sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf
notify-send "Done! FFIT"
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
notify-send "Done! TFFIT"
time java -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg
notify-send "Done! TBFIT"

sed -i 's/u1-1500;s1-600;u2-3500;s2-600-3\*\/{{/u1-1500;s1-600;u2-3500;s2-600-3{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
