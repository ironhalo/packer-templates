#!/bin/bash

set -e
set -x

sudo apt-get clean

if [[ `echo ${PACKER_BUILDER_TYPE}` == vmware-iso ]]
then
	sudo deluser --remove-home vagrant
	sudo rm -rf /etc/sudoers.d/*
fi
