#!/bin/bash

echo "Installing Node ..."
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
apt-get update
apt-get install nodejs -y
bundle install