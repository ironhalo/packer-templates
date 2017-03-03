#! /bin/bash

set -e
set -x

wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb

apt-get update
apt-get -y install puppet-agent=1.8.2-1xenial

rm puppetlabs-release-pc1-xenial.deb
