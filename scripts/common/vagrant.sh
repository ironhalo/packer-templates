#! /bin/bash

set -e
set -x

if [[ `echo ${PACKER_BUILDER_TYPE}` == virtualbox-iso ]]
then
	date | sudo tee /etc/vagrant_box_build_time

	mkdir -p ~vagrant/.ssh
	curl -fsSLo ~vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
	chmod 700 ~vagrant/.ssh/
	chmod 600 ~vagrant/.ssh/authorized_keys
fi
