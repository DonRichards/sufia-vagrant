###
# Java
###

# Java
if which java >/dev/null; then
  echo "skip java 8 installation"
else
  echo "java 8 installation"
  apt-get install -qq python-software-properties
  add-apt-repository -y ppa:webupd8team/java
  apt-get update -qq
  echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
  echo debconf shared/accepted-oracle-license-v1-1 seen true | /usr/bin/debconf-set-selections
  apt-get install -qq oracle-java8-installer
  apt-get install -qq oracle-java8-set-default
fi

# Maven
apt-get -qq install maven
