#!/bin/bash

source /build/docker-yodle-base/profile

set -e
set -x

# git clone https://github.com/mesos/storm.git /usr/local/storm

cd /usr/local
wget --progress=dot:mega $MESOS_EXECUTOR_URI
tar -xf storm-mesos-${RELEASE}.tgz
rm storm-mesos-${RELEASE}.tgz

ln -s storm-mesos-${RELEASE} storm
# Sanity check
cat /usr/local/storm/RELEASE

apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
CODENAME=$(lsb_release -cs)
echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" > /etc/apt/sources.list.d/mesosphere.list
$apt_get update
$apt_get install mesos python python-yaml
