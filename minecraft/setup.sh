. ./settings.sh
CWD=`pwd`
FILES=${CWD}/files
if -u ${USER} &>/dev/null; then
  echo "User ${USER} is missing, please run users.sh first"; 
  exit 1;
fi
sudo mkdir -p ${SERVERDIR}
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
function check_config {
  if [ -z $1 ]; then
    echo "<<Parameter missing for check_config function>>"
  else
    if [ ! -f ${FILES}/$1 ]; then
      echo "<<File $1 missing from ${FILES} directory>>"
    else
      if ! sudo cmp -s ${FILES}/$1 ${SERVERDIR}/$1; then
        echo "<<Updating $1>>"
        if [ -z $2 ]; then
          sudo mkdir -p ${FILES}/$2
          echo "created ${FILES} $2"
        fi
        sudo cp ${FILES}/$1 ${SERVERDIR}/$1
      fi
    fi
  fi
}
if ! sudo cmp -s ${CWD}/settings.sh ${SERVERDIR}/settings.sh; then
  echo "<<Updating settings.sh>>"
  sudo cp ${CWD}/settings.sh ${SERVERDIR}/settings.sh
fi
check_config eula.txt
check_config server.properties
check_config ops.json
check_config run.sh
if ! sudo cmp -s ${FILES}/local/ftbu/config.json ${SERVERDIR}/local/ftbu/config.json; then
  echo "<<Updating config.json>>"
  sudo mkdir -p ${SERVERDIR}/local/ftbu
  sudo cp ${FILES}/local/ftbu/config.json ${SERVERDIR}/local/ftbu/config.json
fi
sudo chown -R ${USER}:${GROUP} ${BASEDIR}
