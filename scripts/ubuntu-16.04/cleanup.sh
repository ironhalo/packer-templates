#! /bin/bash

set -e
set -x

apt-get clean
apt-get autoremove

rm -rf /root/VBoxGuestAdditions.iso

if [[ -f /root/.bash_history ]]
then
	rm -f /root/.bash_history
fi

if [[ -f /home/vagrant/.bash_history ]]
then
	rm -f /home/vagrant/.bash_history
fi
