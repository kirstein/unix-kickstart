#!/bin/sh

sudo apt-get install prelink --yes
sudo echo "-b *skype*" >> /etc/prelink.conf
prelink --all