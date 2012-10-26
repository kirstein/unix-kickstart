#!/bin/sh

SCRIPTS="scripts"
PACKAGES="packages"
BASEDIR="$(pwd -P)"

### Install packages ###
# Update && upgrade packages
sudo apt-get update --yes
sudo apt-get upgrade --yes

# loop the package listing
LIST=$(cat $PACKAGES | egrep -v "^\s*(#|$)")
for package in $LIST
do
    sudo apt-get install $package --yes
done


### Initiate scripts ###
LIST=$(find $SCRIPTS -iname "*.sh")
for file in $LIST
do
    DIR=${file%/*}
    FILENAME=${file##*/}
    cd "$BASEDIR/$DIR"

    chmod +x $FILENAME
    echo "running script: $FILENAME"
    ./$FILENAME
done

echo "Removing unneeded packages"
sudo apt-get autoremove --yes

echo "Finished! It would be wise to reboot now."

