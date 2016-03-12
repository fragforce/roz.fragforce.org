#!/usr/bin/env bash
echo "<<MOTD>>"
sudo cp files/etc/motd /etc/motd
echo "<<SSH>>"
sudo cp files/etc/ssh/sshd_config /etc/ssh/
sudo chown root:root /etc/ssh/sshd_config
sudo service sshd restart
echo "<<SAMBA>>"
sudo cp files/etc/samba/smb.conf /etc/samba
sudo chown root:root /etc/samba/smb.conf
sudo chmod 644 /etc/samba/smb.conf
sudo service smb restart
