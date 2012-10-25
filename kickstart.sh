#!/bin/sh

SCRIPTS="scripts"
PACKAGES="packages"
TOOL="apt-get"

### Install packages ###

# Update && upgradepackages
$(sudo $TOOL update --yes)
$(sudo $TOOL upgrade --yes)

# loop the package listing
list=$(cat $PACKAGES)
for package in $list
do
    echo $package
done


### Initiate scripts ###
list=$(find ./$SCRIPTS -iname "*.sh")
for file in $list
do
    chmod +x "$file"
    echo "running $file"
done
### Packages

# Chrome
#sudo apt-get install chromium-browser --yes



### Misc
# Git extras

