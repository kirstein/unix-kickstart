#!/bin/bash

# Ubuntu

OPSYS=$(cat /etc/lsb-release | grep CODENAME= | sed -e 's/DISTRIB_CODENAME=//')

REPO_FILE=/etc/apt/sources.list.d/ria-repository.list

check_privileges()
{
	touch $REPO_FILE 1>/dev/null 2>&1
	if [ "$?" != "0" ] ; then
		echo "You must have root privileges to run this script"
		exit 1
	fi
}

create_repo_file()
{
	echo "deb https://installer.id.ee/media/ubuntu/ $OPSYS main" | sudo dd of=$REPO_FILE 1>/dev/null 2>&1
	echo "deb https://installer.id.ee/media/ubuntu/ $OPSYS main" | sudo dd of=$REPO_FILE.save 1>/dev/null 2>&1
}

import_ria_key()
{
	sudo apt-key list | grep '^pub.*1024D/592073D4.*2010-10-26$' 1>/dev/null
	KEY_LOOKUP_RESULT=$?
	if [ "$KEY_LOOKUP_RESULT" != "0" ] ; then
		echo "Loading RIA Repository key"
		sudo wget -O /tmp/ria-public.key https://installer.id.ee/media/install-scripts/ria-public.key
		sudo apt-key add /tmp/ria-public.key
		sudo rm -f /tmp/ria-public.key
	else
		echo "RIA Repository key already loaded"
	fi
}

update_repo()
{
	sudo apt-get update
}

install_estonianidcard()
{
	sudo apt-get install estonianidcard --yes
}

check_privileges
create_repo_file
import_ria_key
update_repo
install_estonianidcard
