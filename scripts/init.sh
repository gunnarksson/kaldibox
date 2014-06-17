#!/usr/bin/env sh

set -e -x

KALDI_PREFIX=$1
KALDI_REPO=$2
KALDI_HOME=$1/$2

if [ -z $KALDI_PREFIX ] || [ -z $KALDI_REPO ]; then
  echo "usage: init.sh <kaldi_prefix> <kaldi_repo>"
  exit 1
fi

mkdir -p $KALDI_PREFIX
cd $KALDI_PREFIX

# Install required packages
apt-get update
apt-get install -y build-essential patch make automake subversion \
                   libtool zlib1g-dev gawk wget gfortran

# Fetch code
if [ ! -e $KALDI_REPO ]; then
  svn co https://svn.code.sf.net/p/kaldi/code/trunk $KALDI_REPO \
    --non-interactive --trust-server-cert
fi

# Add symlinks for include
if [ ! -e include ]; then
  mkdir include
  cd include
  ln -s ../$KALDI_REPO/src kaldi
  ln -s ../$KALDI_REPO/tools kaldi-tools
  cd ..
fi

# Install build script
if [ ! -e $KALDI_REPO/build.sh ]; then
  cd $KALDI_REPO
  ln -s /vagrant/scripts/build.sh build.sh
  cd ..
fi

chown -R vagrant:vagrant $KALDI_PREFIX

# Install Docker
# [ -e /usr/lib/apt/methods/https ] || {
#   apt-get update
#   apt-get install -y apt-transport-https
# }

# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 \
#   --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# echo 'deb https://get.docker.io/ubuntu docker main' > \
#   /etc/apt/sources.list.d/docker.list

# apt-get update
# apt-get install -y lxc-docker dkms \
#   linux-image-generic-lts-raring \
#   linux-headers-generic-lts-raring
# /etc/init.d/vboxadd setup
