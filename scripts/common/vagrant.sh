#! /bin/bash

set -e
set -x

if [[ `echo ${PACKER_BUILDER_TYPE}` == virtualbox-iso ]]
then
	date | sudo tee /etc/vagrant_box_build_time

	useradd -m -p JWA0y28BTQeyo -c "Vagrant User" vagrant

	mkdir -p ~vagrant/.ssh
	curl -fsSLo ~vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
	chmod 700 ~vagrant/.ssh/
	chmod 600 ~vagrant/.ssh/authorized_keys
	chown -R vagrant:vagrant ~vagrant/.ssh

	echo 'Defaults:vagrant !requiretty' > /etc/sudoers.d/vagrant
	echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/vagrant
	chmod 440 /etc/sudoers.d/vagrant
fi
