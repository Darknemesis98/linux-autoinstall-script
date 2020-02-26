/#!/bin/bash

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

gscale()
{

#gnome scaling
echo "modifying the scaling factor of gnome."
gsettings set org.gnome.desktop.interface text-scaling-factor 1.2

}

removegt()
{
sudo pacman -R gnome-terminal
}

manjaroinstall()
{
echo installing apps:
echo
sudo pacman -S tilix pacaur snapd nano unzip unrar yay git conky conky-manager vlc albert cmake libreoffice-still htop adb fastboot gtk-engine-murrine gtk-engines banner cmatrix figlet gksu gimp binutils
yay -S ttf-ms-fonts ttf-vitsa-fonts
echo
gscale
removegt
echo
}


debianinstall()
{
echo installing apps:
echo
sudo apt-get install tilix snapd nano unzip unrar dolphin git conky conky-manager vlc cmake libreoffice-still htop ssh adb fastboot banner cmatrix figlet gksu gimp
echo
gscale
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

#adding aliases
echo 'alias inatall="sudo pacman -S"'>> $HOME/.bashrc
echo 'alias remove="sudo pacman -R"'>> $HOME/.bashrc
echo 'alias update="sudo pacman -Syyu && pacaur -Syu && yay -Syu"'>> $HOME/.bashrc 
echo 'alias update="sudo pacman -Syyu"'>> $HOME/.bashrc 
echo 'alias find='sudo pacman -Ss''>> $HOME/.bashrc 
echo 'alias wttr='curl wttr.in''>> $HOME/.bashrc 
echo 'alias ls="ls -l"'>> $HOME/.bashrc 


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


sudo snap install atom --classic
sudo snap install code --classic
sudo snap install android-studio --classic
sublime-text
zsh zsh-syntax-highlighting autojump
