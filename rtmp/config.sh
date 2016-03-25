#!/usr/bin/env bash
DOCKERDIR=/files/rtmp
RECORDDIR=${DOCKERDIR}/record

sudo mkdir -p ${DOCKERDIR} ${RECORDDIR}
sudo chmod 777 ${RECORDDIR}
if [ ! -f /usr/bin/docker-compose ]; then
  echo "Run the docker.sh script to install docker and docker-compose first"
  exit 1
fi
sudo tee ${DOCKERDIR}/docker-compose.yml << EOF
stream:
  image: aevumdecessus/docker-nginx-rtmp
  hostname: rtmp-stream
  volumes:
    - ${RECORDDIR}:/recordings
  ports:
    - "1935:1935"
EOF
sudo cp `pwd`/files/run.sh ${DOCKERDIR}/run.sh
