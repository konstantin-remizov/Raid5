#!/bin/bash
sudo fdisk /dev/sdb <<EOF
n
p
1


w
EOF
sudo fdisk /dev/sdc <<EOF
n
p
1


w
EOF
sudo fdisk /dev/sdd <<EOF
n
p
1


w
EOF
sudo mdadm --create /dev/md0 -a yes --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1  <<EOF
yes
EOF
sudo mkfs.ext4 /dev/md0
sudo mount /dev/md0 /mnt
