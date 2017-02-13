#! /bin/bash

set -e
set -x

case ${PACKER_BUILDER_TYPE} in
	virtualbox-iso )
		mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
		/mnt/VBoxLinuxAdditions.run
		umount /mnt/
		rm -f ~/VBoxGuestAdditions.iso
	;;
	vmware-iso )
		apt-get -y install open-vm-tools
	;;
	* )
		echo "Unknown builder"
		exit 1
	;;
esac
