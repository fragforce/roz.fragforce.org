#!/usr/bin/env bash
UNREALDIR="/ssd/unreal"
UNREALUSER="unreal"
DDUT4DIR="${UNREALDIR}"
CWD=`pwd`

mkdir -p ${DDUT4DIR}
cd ${DDUT4DIR}
if [ ! -f ${CWD}/files/Engine.ini ]; then
  echo "<<No Engine.ini found in ${CWD}/files, please copy the sample file and re-run>>"
  exit 1
elif grep -q ChangeMeNOW ${CWD}/files/Engine.ini; then
  echo "<<Default RCON password present in ${CWD}/files/Engine.ini. Change the password and re-run>>"
  exit 1
fi

if [ ! -f ${DDUT4DIR}/ut4wd.sh ]; then
  echo "<<Acquiring DDUT4>>"
  sudo wget https://github.com/DDRRE/ddut4/releases/download/ddut4-v04c1/ddut4.tgz
  sudo tar xzvf ddut4.tgz
  sudo rm ddut4.tgz
  sudo cp ${CWD}/files/{CTF-Game.ini,ddut4.conf,DM-Game.ini,Engine.ini,HUB-Game.ini,HUB-Rules.ini} ${DDUT4DIR}
else
  echo "<<DDUT4 Already present>>"
fi
if ! sudo cmp -s ${CWD}/files/HUB-Game.ini ${DDUT4DIR}/HUB-Game.ini; then
  echo "<<Updating HUB-Game.ini>>"
  sudo cp ${CWD}/files/HUB-Game.ini ${DDUT4DIR}/Hub-Game.ini;
fi
if ! sudo cmp -s ${CWD}/files/HUB-Rules.ini ${DDUT4DIR}/HUB-Rules.ini; then
  echo "<<Updating HUB-Rules.ini>>"
  sudo cp ${CWD}/files/HUB-Rules.ini ${DDUT4DIR}/Hub-Rules.ini;
fi
if ! sudo cmp -s ${CWD}/files/Engine.ini ${DDUT4DIR}/Engine.ini; then
  sudo cp ${CWD}/files/Engine.ini ${DDUT4DIR}/Engine.ini;
  echo "<<Updating Engine.ini>>"
fi
if ! sudo cmp -s ${CWD}/files/ddut4.conf ${DDUT4DIR}/ddut4.conf; then
  sudo cp ${CWD}/files/ddut4.conf ${DDUT4DIR}/ddut4.conf;
  echo "<<Updating ddut4.conf>>"
fi
if [ ! -d ${DDUT4DIR}/ut4-base ]; then
  echo "<<No UT4 Base dir, acquiring UT4>>"
  echo "Get the download URL from https://forums.unrealtournament.com/showthread.php?12011"
  sudo su -c "${DDUT4DIR}/updateServer.sh" ${UNREALUSER}
else
  echo "<<UT4 Base dir present>>"
fi
sudo chown -R ${UNREALUSER}:services ${UNREALDIR}
