#!/usr/bin/env bash

echo "<<Service Accounts>>"
if grep -q services /etc/group
then
	echo "Services group already exists, skipping"
else
	sudo groupadd -g 5001 services
fi
id -u minecraft &>/dev/null || sudo useradd -u 5101 -G services minecraft
id -u unreal &>/dev/null || sudo useradd -u 5102 -G services unreal
id -u fragforce &>/dev/null || sudo useradd -u 5103 -G services fragforce
echo "<<Service Accounts Completed>>"
echo "<<Creating user accounts>>"
id -u sbakker &>/dev/null || sudo useradd -u 1101 -G wheel sbakker
sudo mkdir -p /home/sbakker/.ssh
sudo cp users/sbakker/authorized_keys /home/sbakker/.ssh/authorized_keys
sudo chown -R sbakker:sbakker /home/sbakker/.ssh
id -u mthomas &>/dev/null || sudo useradd -u 1102 -G wheel mthomas
sudo mkdir -p /home/mthomas/.ssh
sudo cp users/mthomas/authorized_keys /home/mthomas/.ssh/authorized_keys
sudo chown -R mthomas:mthomas /home/mthomas/.ssh
echo "<<User accounts created>>"
