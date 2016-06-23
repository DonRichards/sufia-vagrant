###
# BASICS
###

SHARED_DIR=$1

if [ -f "$SHARED_DIR/install_scripts/config" ]; then
  . $SHARED_DIR/install_scripts/config
fi

cd $HOME_DIR

# Update
apt-get -qq update && apt-get -qq upgrade

# SSH
apt-get -qq install openssh-server

# Build tools
apt-get -qq install build-essential

# Git vim
apt-get -qq install git vim

# Wget and curl
apt-get -qq install wget curl
