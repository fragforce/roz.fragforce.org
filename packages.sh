#!/usr/bin/env bash
echo "<<Updating System>>"
sudo yum update -y
echo "<<Installing Prereqs>>"
sudo yum install -y epel-release
echo "<<Installing Useful Tools>>"
sudo yum install -y git vim samba parted man xfsprogs wget tcpdump unzip screen htop
echo "<<Installing NTP>>"
sudo yum install -y ntp ntpdate ntp-doc
sudo chkconfig ntpd on
sudo service ntpd start
echo "<<NTP Configured>>"
echo "<<Installing Make Packages>>"
sudo yum install -y autoconf automake gcc libtool
echo "<<Finished installing Make packages>>"
echo "Disabling default firewall"
sudo systemctl disable firewalld
sudo systemctl stop firewalld
echo "Firewall Crder 66'ed"
