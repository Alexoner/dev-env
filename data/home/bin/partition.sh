#!/bin/sh

# fdisk can only create partition at most 2TB
TGTDEV=$1
# to create the partitions programatically (rather than manually)
# we're going to simulate the manual input to fdisk
# The sed script strips off all the comments so that we can
# document what we're doing in-line with the actual commands
# Note that a blank line (commented as "defualt" will send a empty
# line terminated with a newline to take the fdisk default.
#sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${TGTDEV}
#o # clear the in memory partition table
#n # new partition
#p # primary partition
#1 # partition number 1
## default - start at beginning of disk
#+100M # 100 MB boot parttion
#n # new partition
#p # primary partition
#2 # partion number 2
## default, start immediately after preceding partition
## default, extend partition to end of disk
#a # make a partition bootable
#1 # bootable partition is partition 1 -- /dev/sda1
#p # print the in-memory partition table
#w # write the partition table
#q # and we're done
#EOF

sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${TGTDEV}
o # clear the in memory partition table
n # new partition
# primary partition
# partition number 1
# default - start at beginning of disk
# default, extend partition to end of disk
t # change partition type
fd # Linux RAID autodetect type
w # write the partition table
EOF
# make file system with this partition
mkfs.ext4 /dev/sdb1
umount /home
mount /dev/sdb1 /home


# Set partition table to GPT using Parted mklabel to create partition>=2TB.
# GPT stands for GUID partition table format(GPT)
cat << EOF |parted /dev/sdb
mklabel gpt
Yes
mkpart primary xfs 1 -1
quit
EOF
mkfs.xfs -f /dev/sdb1

cat << EOF |parted /dev/sda
mklabel gpt yes
mkpart primary xfs 1 -1
quit
EOF
mkfs.xfs -f /dev/sda1

umount /home
mount /dev/sdb1 /home
mount /dev/sda1 /mnt

# back up /etc/fstab1
cp /etc/fstab /etc/fstab.bak
# remove /home mount line
sed -i '/.*\s\/home\s.*/d' /etc/fstab
# add a new line mounting /home
cat >> /etc/fstab <<EOF
/dev/sdb1 /home                   xfs     defaults        0 0
/dev/sda1 /mnt                   xfs     defaults        0 0
EOF


# backup /etc/sysconfig/network-scripts/ifcfg-enp7s0f0
cp /etc/sysconfig/network-scripts/ifcfg-enp7s0f0 /etc/sysconfig/network-scripts/ifcfg-enp7s0f0.bak
cat >> /etc/sysconfig/network-scripts/ifcfg-enp7s0f0 <<EOF
DNS1=8.8.8.8
DNS2=8.8.4.4
EOF


# add user
#useradd -m admin -d /home/admin
useradd -m admin
cat << EOF | passwd admin
ailabs5asr
ailabs5asr
EOF

cat >> /etc/resolv.conf << EOF
nameserver 8.8.8.8
nameserver 8.8.4.4
nameserver 127.0.0.1
EOF

# odps
yum install -b current odpscmd-internal

# oss
pip install oss2
