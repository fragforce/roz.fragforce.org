#!/usr/bin/env bash
yum install -y pam-devel git vim samba parted man xfsprogs wget tcpdump unzip screen
echo "<<Installing NTP>>"
yum install -y ntp ntpdate ntp-doc
chkconfig ntpd on
service ntpd start
echo "<<NTP Configured>>"
echo "<<Installing Make Packages>>"
yum install -y autoconf automake gcc libtool
echo "<<Finished installing Make packages>>"
