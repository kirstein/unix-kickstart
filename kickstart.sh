#!/bin/sh

SCRIPTS="scripts"
PACKAGES="packages"
TOOL="apt-get"
BASEDIR="$(pwd -P)"

### Setting package tool ###
if [ "$#" -eq 1 ]
then
    TOOL=$1
fi

### Install packages ###
# Update && upgradepackages
sudo $TOOL update --yes
sudo $TOOL upgrade --yes

# loop the package listing
LIST=$(cat $PACKAGES | egrep -v "^\s*(#|$)")
for package in $LIST
do
    sudo $TOOL install $package --yes
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
sudo $TOOL autoremove

echo "Finished!"

