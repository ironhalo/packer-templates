#! /bin/bash

set -e
set -x

case ${PACKER_BUILDER_TYPE} in
	virtualbox-iso )
		sudo mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
		sudo /mnt/VBoxLinuxAdditions.run
		sudo umount /mnt/
		rm -f ~/VBoxGuestAdditions.iso
	;;
	vmware-iso )
		sudo apt-get -y install open-vm-tools
	;;
	* )
		echo "Unknown builder"
		exit 1
	;;
esac
