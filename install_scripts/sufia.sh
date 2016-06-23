#!/bin/sh

echo "Creating a stock Sufia app"

# create a sufia app
rails new sufia-demo --skip-spring
cd sufia-demo
echo "gem 'sufia', '7.0.0.beta4'" >> Gemfile
echo "gem 'unicorn-rails'" >> Gemfile
bundle install --quiet
rails generate sufia:install -f -q
rake db:migrate
# TODO: uncomment this when next release > beta4 is out
#rails generate sufia:work Work -q

# start redis
sudo /etc/init.d/redis-server start

# start fedora and solr
SHARED_DIR=$1
sudo cp $SHARED_DIR/install_scripts/fedora-solr /etc/init.d/
sudo update-rc.d fedora-solr start 90 2 3 4 5 .
sudo /etc/init.d/fedora-solr start
