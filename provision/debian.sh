#!/bin/bash

# Copia a chave SSH
mkdir -p /root/.ssh
cp /vagrant/files/key /root/.ssh/id_rsa
cp /vagrant/files/key.pub /root/.ssh/id_rsa.pub
cp /vagrant/files/key.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/*

# Cria swap se não existir
if [ "$(swapon -v)" == "" ]; then
  dd if=/dev/zero of=/swapfile bs=1M count=512
  chmod 0600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo '/swapfile       swap    swap    defaults        0       0' >> /etc/fstab
fi

apt-get update
apt-get install -y gnupg2 vim unzip libcommon-sense-perl libjson-perl libjson-xs-perl libmecab2 libnuma1 libtypes-serialiser-perl mecab-ipadic mecab-ipadic-utf8 mecab-utils

if [ -f /vagrant/mysql/mysql-debian10.zip ]; then
	unzip /vagrant/mysql/mysql-debian10.zip -d /root
	rm /root/*debug*
	rm /root/*dbgsym*
	debconf-set-selections <<< 'mysql-community-server mysql-community-server/root-pass password 4linux'
	debconf-set-selections <<< 'mysql-community-server mysql-community-server/re-root-pass password 4linux'
	DEBIAN_FRONTEND=noninteractive dpkg -i /root/*.deb
	rm -rf /root/*.deb
fi
