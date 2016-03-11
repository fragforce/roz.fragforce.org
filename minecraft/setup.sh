USER=minecraft
BASEDIR=/ssd/minecraft
SERVERDIR=fragforce
JRE_URL="http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jre-8u74-linux-x64.tar.gz"
JRE_DOWNLOAD="--no-cookies --no-check-certificate --header"
JRE_COOKIE="Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie"
JRE_FILE="jre-8u74-linux-x64.tar.gz"
MODPACK_URL="http://ftb.cursecdn.com/FTB2/modpacks/FTBInfinity/2_3_5/FTBInfinityServer.zip"
MODPACK_FILE="FTBInfinityServer.zip"

id -u ${USER} &>/dev/null || adduser ${USER}
mkdir -p ${BASEDIR}/${SERVERDIR}
cd ${DIR}
wget ${JRE_DOWNLOAD} "${JRE_COOKIE}" ${JRE_URL}
tar -xzvf ${JRE_FILE}
cd ${BASEDIR}/${SERVERDIR}
wget ${MODPACK_URL}
unzip ${MODPACK_FILE}

chown -R ${USER} ${BASEDIR}
