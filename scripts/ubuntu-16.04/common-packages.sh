#!/bin/bash

set -e
set -x

apt-get -y install build-essential linux-headers-`uname -r`
