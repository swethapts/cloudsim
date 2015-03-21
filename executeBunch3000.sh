sed -i 's/CLOUDLET_LENGTH_PRIVATE = {2500000,4000000};/CLOUDLET_LENGTH_PRIVATE = {2500000};\/\/,4000000};/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-1500-1{{/u-6000;s-1500-1\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-1500-1\*\/{{/u-6000;s-1500-1{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-1500-2{{/u-6000;s-1500-2\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-1500-2\*\/{{/u-6000;s-1500-2{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-1500-3{{/u-6000;s-1500-3\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-1500-3\*\/{{/u-6000;s-1500-3{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-600-1{{/u-6000;s-600-1\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-600-1\*\/{{/u-6000;s-600-1{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-600-2{{/u-6000;s-600-2\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-600-2\*\/{{/u-6000;s-600-2{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-600-3{{/u-6000;s-600-3\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-600-3\*\/{{/u-6000;s-600-3{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java


#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-120-1{{/u-6000;s-120-1\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-120-1\*\/{{/u-6000;s-120-1{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-120-2{{/u-6000;s-120-2\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-120-2\*\/{{/u-6000;s-120-2{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-120-3{{/u-6000;s-120-3\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-120-3\*\/{{/u-6000;s-120-3{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java


#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-30-1{{/u-6000;s-30-1\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-30-1\*\/{{/u-6000;s-30-1{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-30-2{{/u-6000;s-30-2\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-30-2\*\/{{/u-6000;s-30-2{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

#TT
echo 'Energy Consumption: kWhr, used:'
sed -i 's/u-6000;s-30-3{{/u-6000;s-30-3\*\/{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java

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

sed -i 's/u-6000;s-30-3\*\/{{/u-6000;s-30-3{{/g' sources/org/cloudbus/cloudsim/examples/power/ConstantsSteady.java


