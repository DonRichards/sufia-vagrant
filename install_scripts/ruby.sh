#!/bin/sh

echo "Setting up ruby environment"

# pre-requisites
PACKAGES="imagemagick libreadline-dev libyaml-dev libsqlite3-dev libqtwebkit-dev nodejs zlib1g-dev libsqlite3-dev nodejs redis-server"
sudo apt-get -qq install $PACKAGES

# ruby (custom repository for a current ruby without having to compile it)
sudo apt-add-repository -y ppa:brightbox/ruby-ng
sudo apt-get update -qq
sudo apt-get -qq install ruby2.3 ruby2.3-dev

# gems
GEMS="bundler rails unicorn"
sudo gem install $GEMS --no-ri --no-rdoc -q
