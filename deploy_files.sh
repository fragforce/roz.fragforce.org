#!/usr/bin/env bash
echo "<<MOTD>>"
sudo cp files/etc/motd /etc/motd
echo "<<SSH>>"
sudo cp files/etc/ssh/sshd_config /etc/ssh/
sudo chown root:root /etc/ssh/sshd_config
sudo service sshd restart
