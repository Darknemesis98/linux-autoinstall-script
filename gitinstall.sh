#! /bin/bash

DIS="$(cat /etc/*-release | grep -E DISTRIB_ID | cut -b 12-)" 

echo "-------------------------------------------------------------------"
echo "created by DarkNemesis"
echo "GitHub Configuration:"
echo
read -p "Enter your username: " username
read -p "Enter your email: " email
echo
echo "-------------------------------------------------------------------"
echo
echo 'Installing git and xclip'
echo
if [ $DIS == "Ubuntu" ]
then
	echo 'Distro is identified to be Debian based.'
	sudo apt install xclip git
	echo installed
fi
if [ $DIS == "Manjaro" ]
then
	echo 'Distro is identified to be Manjaro.'
	sudo pacman -S xclip git
	echo installed
fi
if [ $DIS != "Ubuntu" && $DIS != "Manjaro" ]
then
	echo 'Distro is identification error.'
	echo 'please install xclip and git'
	
	read -p "Enter to continue"
	echo Resuming
fi
echo
echo "Updating global parameters"
echo
git config --global user.name "$username"
git config --global user.email "$email"
git config --global color.ui true
git config --global core.editor emacs

echo "-------------------------------------------------------------------"
echo "Generating ssh-key"
ssh-keygen -t rsa -b 4096 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
echo "-------------------------------------------------------------------"


xclip -sel clip < ~/.ssh/id_rsa.pub
echo 'copied ssh-key'
echo
echo "-----------------------------DONE----------------------------------"


