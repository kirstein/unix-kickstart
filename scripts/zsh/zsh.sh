#!/bin/sh

sudo apt-get install zsh curl --yes
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Setting zsh as default shell"
sudo chsh -s /bin/zsh

# Copying config
FILE=$HOME"/.zshrc"
BACKUP=$FILE"_backup"
echo "Coping zshrc file to $FILE"
if [ -e "$FILE" ]
then
    echo "Found old zshrc config. Creating backup to $BACKUP"
    mv $FILE $BACKUP
fi

cp zshrc ~/.zshrc