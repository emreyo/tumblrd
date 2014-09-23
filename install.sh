#!/bin/bash

echo "menu"
echo "printf"

if [ -z `which curl` ];
then
	echo "need curl"
	read -p "want me to install it? (y/n) " curl
	if [ "$curl" = "y" ];
	then
		sudo apt-get install -y curl
	else
		echo "install curl and come back"
		echo "you can use: sudo apt-get install curl"
		exit 1
	fi
else
	echo "curl ok"
fi

if [ -z `which jq` ];
then
	echo "need jq"
	read -p "want me to install it? (y/n) " jq
	if [ "$jq" = "y" ];
	then
		sudo apt-get install -y jq
	else
		echo "install jq and come back"
		echo "you can use: sudo ap-get install jq"
		exit 1
	fi
else
	echo "jq ok"
fi

if [ ! -d "$HOME/bin" ];
then
	echo "$HOME/bin does not exist."
	read -p "want me to create it? (y/n) " directory
	if [ "$directory" = "y" ];
	then
		mkdir -p $HOME/bin
	else
		echo "create a bin directory under your home directory, then come back again."
		exit 1
	fi
fi

if [ ! -d "$HOME/.tud" ];
then
	mkdir "$HOME/.tud"
fi


cp tud "$HOME/bin/tud"
cp config.sh "$HOME/.tud/config.sh"
chmod +x "$HOME/bin/tud"
