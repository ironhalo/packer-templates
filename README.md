# packer-templates

[Packer](https://www.packer.io/) templates for [Vagrant](https://www.vagrantup.com/) base boxes

## Usage

Clone the repository:

    $ git clone https://github.com/ironhalo/packer-templates && cd packer-templates

Build a machine image from the template in the repository:

    $ packer build -only=virtualbox-iso archlinux-x86_64.json

Add the built box to Vagrant:

    $ vagrant box add archlinux-x86_64 archlinux-x86_64-virtualbox.box

## Configuration

You can configure each template to match your requirements by setting the following [user variables](https://packer.io/docs/templates/user-variables.html).

### Generic Variables

 User Variable       | Default Value | Description
---------------------|---------------|----------------------------------------------------------------------------------------
 `compression_level` | 6             | [Documentation](https://packer.io/docs/post-processors/vagrant.html#compression_level)
 `cpus`              | 1             | Number of CPUs
 `disk_size`         | 20000         | [Documentation](https://packer.io/docs/builders/virtualbox-iso.html#disk_size)
 `headless`          | 0             | [Documentation](https://packer.io/docs/builders/virtualbox-iso.html#headless)
 `iso_checksum`      |               | Checksum of the ISO being used
 `iso_checksum_type` | sha256        | Checksum type of the ISO being used
 `memory`            | 1024          | Memory size in MB
 `mirror`            |               | A URL of the mirror where the ISO image is available

### vSphere Post Processor Variables

More information is available [Documentation](https://www.packer.io/docs/post-processors/vsphere.html)

 User Variable        | Default Value | Description
----------------------|---------------|----------------------------------------------------------------------------------------
 `vsphere_cluster`    |               | Name of the cluster to store the image
 `vsphere_datacenter` |               | Name of the datacenter the cluster is associated with
 `vsphere_datastore`  |               | Name of the datastore to store the image
 `vsphere_host`       |               | Name of the vCenter server
 `vsphere_username`   |               | The account used to upload the image
 `vsphere_password`   |               | Account password
 `vsphere_vm_name`    |               | Name of the image
 `vsphere_disk_mode`  |               | Define the disk mode
 `vsphere_vm_folder`  |               | An existing directory to store the image
 `vsphere_vm_network` |               | The network to associate the image with

### Example

Build an uncompressed Arch Linux vagrant box with a 4GB hard disk using the VirtualBox provider:

    $ packer build -only=virtualbox-iso -var compression_level=0 -var disk_size=4000 archlinux-x86_64.json

## Pre-built Boxes

You can also use the pre-built boxes hosted on Atlas.

    $ vagrant box add ironhalo/archlinux-x86_64

## Debugging

Packer 0.12.x has a LOT of bugs.

    $ PACKER_LOG=1 PACKER_LOG_PATH="packerlog.txt" packer build <config.json>

Issues I've hit:

* core: Can't use user variable in `keep_input_artifact` #2630 [Here](https://github.com/mitchellh/packer/issues/2630)

* Vsphere postprocessor hangs on ssl fingerprint verification [Here](https://github.com/mitchellh/packer/issues/4289)

* abort error on vmware-iso upload in packer 0.12 #4179 [Here](https://github.com/mitchellh/packer/issues/4179)

## Credits

Stole JSON and scripts from the following:

* https://github.com/geerlingguy/packer-ubuntu-1604
* https://github.com/kaorimatz/packer-templates
* https://github.com/shiguredo/packer-templates
