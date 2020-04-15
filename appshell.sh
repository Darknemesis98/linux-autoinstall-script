/#!/bin/bash

DIS="$(cat /etc/*-release | grep -E DISTRIB_ID | cut -b 12-)" 


gscale()
{
#gnome scaling
echo "modifying the scaling factor of gnome."
gsettings set org.gnome.desktop.interface text-scaling-factor 1.2
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
echo "Bash_edited_darknem">> $HOME/.bashrc
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
if [ $DIS == "Manjaro" ]
	then manjaroinstall
fi
if [ $DIS == "Ubuntu" ]
	then debianinstall
fi 
}


#MAIN

echo Hi $USER,
echo "System info:"
hostnamectl
echo 
echo 


installapps

if grep Bash_edited_darknem | grep Bash_edited_darknem ~/.bashrc
then
	echo ".bashrc is already edited"
	echo "skipping edits"
fi
else bashappend

sudo snap install atom --classic
sudo snap install code --classic

sublime-text
zsh zsh-syntax-highlighting autojump
