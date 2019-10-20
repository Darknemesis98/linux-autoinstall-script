#!/bin/bash

manjaroupdate()
{
echo
echo Update process initiated.
echo Manjaro updating..
echo
sudo pacman-mirrors -f 20
echo
sudo pacman -Syu
}

debianupdate()
{
echo
echo Update process initiated.
echo debian updating...
echo
sudo apt update && sudo apt upgrade
}

cancel()
{
echo
echo Process successfully terinated.
echo
}

ugetint()
{
echo
echo installing uget integrator
echo
wget https://raw.githubusercontent.com/ugetdm/uget-integrator/master/install/linux/install_uget_integrator.sh
chmod +x install_uget_integrator.sh
./install_uget_integrator.sh
rm install_uget_integrator.sh 
echo
echo uget intergrated
echo
}

removegt()
{
sudo pacman -R gnome-terminal
}

manjaroinstall()
{
echo installing apps:
echo
sudo pacman -S tilix pacaur uget snapd nano unzip unrar dolphin yay git screenfetch conky conky-manager vlc albert code cmake libreoffice-still cmake htop
echo
ugetint
removegt
echo
}


debianinstall()
{
echo installing apps:
echo
sudo apt-get install tilix uget snapd nano unzip unrar dolphin git screenfetch conky conky-manager vlc cmake libreoffice-still cmake htop ssh
echo
ugetint
removegt
echo
}

bashappend()
{
echo >> $HOME/.bashrc
echo >> $HOME/.bashrc
echo >> $HOME/.bashrc
echo "#my lines below" >> $HOME/.bashrc
echo "PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '" >> $HOME/.bashrc
echo >> $HOME/.bashrc
echo "screenfetch" >> $HOME/.bashrc
echo Done!
}

installapps()
{
if [ $DISTRO -eq 1 ]
	then manjaroinstall
else debianinstall
fi 
}

updatedistro()
{
if [ $DISTRO -eq 1 ]
	then manjaroupdate
elif [ $DISTRO -eq 0 ]
	then debianupdate
fi 
}

#MAIN

echo Hi $USER,
echo "System info:"
hostnamectl
echo 
echo "1 for manjaro"
echo "0 for debian/ubuntu"

echo "Distro? <manjaro or debian>"
read  DISTRO
if [ "$DISTRO" == "" ] 
	then DISTRO="1"
fi

echo "Update? <1/0>"
read UPDATE

if [ $UPDATE -eq 1 ]
then updatedistro
else cancel
fi

installapps

echo "Add bashrc edits? <1/0>"
read  NEW

if [ $NEW -eq 1 ]
then bashappend
else cancel
fi
