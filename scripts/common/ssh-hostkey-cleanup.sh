#! /bin/bash

set -e
set -x

rm -vf /etc/ssh/*key*
ssh-keygen -A
