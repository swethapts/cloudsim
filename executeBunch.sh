#sed -i 's/CLOUDLET_LENGTH_PRIVATE = {2500000};\/\/,4000000};/CLOUDLET_LENGTH_PRIVATE = {2500000,4000000};/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java


#FT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf
notify-send "Done! FFDM"
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBf
notify-send "Done! BFDM"
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsWf
notify-send "Done! WFDM"

##TT
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf
notify-send "Done! FFIM"

##FT

sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
notify-send "Done! TFFDM"
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg
notify-send "Done! TBFDM"

echo "Increasing Mips"
##TT
sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=false/VM_MIPS_SORTING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
notify-send "Done! TFFIM"
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg
notify-send "Done! TBFIM"

##FF

sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf
notify-send "Done! FFIT"

##TF

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFf
notify-send "Done! FFDT"

##FF

sed -i 's/VM_SLA_SORTING_ASCENDING=true/VM_SLA_SORTING_ASCENDING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

##TF
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
notify-send "Done! TFFIT"
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg
notify-send "Done! TBFIT"

sed -i 's/VM_SLA_SORTING_ASCENDING=false/VM_SLA_SORTING_ASCENDING=true/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
sed -i 's/VM_MIPS_SORTING=true/VM_MIPS_SORTING=false/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
ant clean
ant

time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsFfCtAvg
notify-send "Done! TFFDT"
time java -Xmx1524m -classpath jars/cloudsim-new.jar/:jars/commons-math3-3.2.jar/:bin/ org.cloudbus.cloudsim.examples.power.steady.DvfsBfCtAvg
notify-send "Done! TBFDT"
##TF


#sed -i 's/u1-1000;s1-600;u2-6500;s2-600-1\*\/{{/u1-1000;s1-600;u2-6500;s2-600-1{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java
