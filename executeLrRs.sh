javac -classpath jars/cloudsim-3.0.3.jar:jars/flanagan.jar:jars/:examples:jars/commons-math3-3.2.jar examples/org/cloudbus/cloudsim/examples/power/*.java 
javac -classpath jars/cloudsim-3.0.3.jar:jars/flanagan.jar:jars/:examples:jars/commons-math3-3.2.jar examples/org/cloudbus/cloudsim/examples/power/random/Random*.java
javac -classpath jars/cloudsim-3.0.3.jar:jars/flanagan.jar:jars/:examples:jars/commons-math3-3.2.jar examples/org/cloudbus/cloudsim/examples/power/random/LrRs.java
java -classpath jars/cloudsim-3.0.3.jar:jars/flanagan.jar:jars/:examples:jars/commoms-math3-3.2 org.cloudbus.cloudsim.examples.power.random.LrRs
