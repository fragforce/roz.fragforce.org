. ./settings.sh
CWD=`pwd`
if -u ${USER} &>/dev/null; then
  echo "User ${USER} is missing, please run users.sh first"; 
  exit 1;
fi
sudo mkdir -p ${BASEDIR}/${SERVERDIR}
cd ${BASEDIR}
if [ ! -d ${BASEDIR}/${JRE_FOLDER} ]; then
  echo "<<Downloading JRE>>"
  sudo wget ${JRE_DOWNLOAD} "${JRE_COOKIE}" ${JRE_URL}
  sudo tar -xzvf ${JRE_FILE}
else
  echo "<<JRE already present>>"
fi
cd ${SERVERDIR}
if [ ! -f ${SERVERDIR}/eula.txt ]; then
  echo "<<Downloading Modpack>>"
  sudo wget ${MODPACK_URL}
  sudo unzip ${MODPACK_FILE}
else
  echo "<<Modpack already present>>"
fi
if ! sudo cmp -s ${CWD}/settings.sh ${SERVERDIR}/settings.sh; then
  echo "<<Updating settings.sh>>"
  sudo cp ${CWD}/settings.sh ${SERVERDIR}/settings.sh
fi
if ! sudo cmp -s ${CWD}/files/eula.txt ${SERVERDIR}/eula.txt; then
  echo "<<Updating eula.txt>>"
  sudo cp ${CWD}/files/eula.txt ${SERVERDIR}/eula.txt
fi
if ! sudo cmp -s ${CWD}/files/server.properties ${SERVERDIR}/server.properties; then
  echo "<<Updating server.properties>>"
  sudo cp ${CWD}/files/server.properties ${SERVERDIR}/server.properties
fi
if ! sudo cmp -s ${CWD}/files/ops.json ${SERVERDIR}/ops.json; then
  echo "<<Updating ops.json>>"
  sudo cp ${CWD}/files/ops.json ${SERVERDIR}/ops.json
fi
if ! sudo cmp -s ${CWD}/files/run.sh ${SERVERDIR}/run.sh; then
  echo "<<Updating run.sh>>"
  sudo cp ${CWD}/files/run.sh ${SERVERDIR}/run.sh;
  sudo chmod a+x ${SERVERDIR}/run.sh
fi
sudo chown -R ${USER}:${GROUP} ${BASEDIR}
