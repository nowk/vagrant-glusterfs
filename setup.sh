#!/bin/sh
set -e

GLUSTERFS="http://download.gluster.org/pub/gluster/glusterfs/3.7/3.7.5/Debian/jessie"

# add gluster to sources
wget -O - ${GLUSTERFS}/pub.key | apt-key add -
echo deb ${GLUSTERFS}/apt jessie main > /etc/apt/sources.list.d/gluster.list

# install gluster via apt
apt-get update
apt-get -y install glusterfs-server

# create the default brick directory
mkdir -p /data/brick1

# vim: set filetype=sh :
