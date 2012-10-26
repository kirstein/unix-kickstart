#!/bin/sh

sudo apt-get install prelink --yes
echo "Adding skype to prelink blacklist"
sudo echo "-b *skype*" >> /etc/prelink.conf

