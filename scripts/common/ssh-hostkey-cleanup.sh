#! /bin/bash

set -e
set -x

sudo rm -vf /etc/ssh/ssh_host_*

sudo ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
sudo ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
