#!/bin/bash

set -e
set -x

sudo apt-get -y install build-essential linux-headers-`uname -r`
