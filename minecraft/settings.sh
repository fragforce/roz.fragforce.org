#Server variables
export USER=minecraft
export GROUP=minecraft
export BASEDIR=/ssd/minecraft
export SERVERDIR=${BASEDIR}/fragforce

#JRE Variables
export JRE_URL="http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jre-8u74-linux-x64.tar.gz"
export JRE_DOWNLOAD="--no-cookies --no-check-certificate --header"
export JRE_COOKIE="Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie"
export JRE_FILE="jre-8u74-linux-x64.tar.gz"
export JRE_FOLDER="jre1.8.0_74"
export JRE_BIN=${BASEDIR}/${JRE_FOLDER}/bin/
export JAVACMD="${JRE_BIN}/java"
export JAVAOPTS="-server -Xms512M -Xmx2048M -XX:PermSize=256M -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10 -jar FTBServer-1.7.10-1614.jar nogui"

#Modpack Variables
export MODPACK_URL="http://ftb.cursecdn.com/FTB2/modpacks/FTBInfinity/2_4_2/FTBInfinityServer.zip"
export MODPACK_FILE="FTBInfinityServer.zip"
export MODPACK_DIR=${SERVERDIR}

export MCVER="1.7.10"
export JARFILE="minecraft_server.${MCVER}.jar"
export LAUNCHWRAPPER="net/minecraft/launchwrapper/1.12/launchwrapper-1.12.jar"
