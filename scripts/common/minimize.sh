#! /bin/bash

set -e
set -x

echo "Whiteout root"
count=$(df --sync -kP / | tail -1  | awk -F ' ' '{print $4}')
let count--
sudo dd if=/dev/zero of=/whitespace bs=1024 count=$count
sudo rm -f /whitespace

echo "Whiteout /boot"
count=$(df --sync -kP /boot | tail -1  | awk -F ' ' '{print $4}')
let count--
sudo dd if=/dev/zero of=/boot/whitespace bs=1024 count=$count
sudo rm -f /boot/whitespace

echo "Whiteout /tmp"
count=$(df --sync -kP /tmp | tail -1  | awk -F ' ' '{print $4}')
let count--
sudo dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count
sudo rm -f /tmp/whitespace

echo "Whiteout /var/log"
count=$(df --sync -kP /var/log | tail -1  | awk -F ' ' '{print $4}')
let count--
sudo dd if=/dev/zero of=/var/log/whitespace bs=1024 count=$count
sudo rm -f /var/log/whitespace

echo "Syncing file systems"
sudo sync
