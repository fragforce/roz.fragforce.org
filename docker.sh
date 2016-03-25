COMPOSE="/usr/bin/docker-compose"
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

sudo yum install -y docker-engine
sudo service docker start
if [ ! -f ${COMPOSE} ]; then
  sudo curl -o ${COMPOSE} -L https://github.com/docker/compose/releases/download/1.7.0-rc1/docker-compose-`uname -s`-`uname -m`
  sudo chmod +x ${COMPOSE}
fi
