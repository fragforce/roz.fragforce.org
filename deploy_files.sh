#!/usr/bin/env bash
echo "<<MOTD>>"
if ! sudo cmp -s files/etc/motd /etc/motd; then
  sudo cp files/etc/motd /etc/motd
fi
echo "<<SSH>>"
if ! sudo cmp -s files/etc/ssh/sshd_config /etc/ssh/sshd_config; then
  sudo cp files/etc/ssh/sshd_config /etc/ssh/
  sudo chown root:root /etc/ssh/sshd_config
  sudo service sshd restart
fi
echo "<<SAMBA>>"
if ! sudo cmp -s files/etc/samba/smb.conf /etc/samba/smb.conf; then
  sudo cp files/etc/samba/smb.conf /etc/samba
  sudo chown root:root /etc/samba/smb.conf
  sudo chmod 644 /etc/samba/smb.conf
  sudo service smb restart
  sudo chcon -t samba_share_t -R /files/
fi
