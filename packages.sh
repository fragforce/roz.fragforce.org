#!/usr/bin/env bash
sudo yum install -y pam-devel git autoconf automake gcc libtool vim samba parted man xfsprogs wget tcpdump unzip screen
echo "Installing NTP"
sudo yum install -y ntp ntpdate ntp-doc
