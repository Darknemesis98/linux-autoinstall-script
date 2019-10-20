##!/bin/bash
echo Hi $USER
hostnamectl
echo 
echo

manjaroupdate()
{
	echo "update? <Y / n>"
	read reply

	if [ $reply == "" ] 
		then
			echo Update process initiated.
			sudo pacman-mirrors -f 20
			sudo pacman -Syu
	else
		echo ok, update cancelled
	fi
}

debianupdate()
{
	echo "update? <Y / n>"
	read reply

	if [ $reply == "" ] 
		then
			echo Update process initiated.
			sudo apt update && sudo apt upgrade
	else
		echo ok, update cancelled
	fi
}

ugetint()
{
	echo installing uget integrator
	wget https://raw.githubusercontent.com/ugetdm/uget-integrator/master/install/linux/install_uget_integrator.sh
	chmod +x install_uget_integrator.sh
	./install_uget_integrator.sh
	rm install_uget_integrator.sh 
}

removegt()
{
sudo pacman -R gnome-terminal
}

manjaroinstall()
{
	manjaroupdate

	echo installing apps:
	sudo pacman -S tilix pacaur uget snapd nano unzip unrar dolphin yay git screenfetch conky conky-manager vlc albert code cmake libreoffice-still cmake htop

	ugetint
	removegt

}


debianinstall()
{

	sudo apt-get install tilix uget snapd nano unzip unrar dolphin git screenfetch conky conky-manager vlc cmake libreoffice-still cmake htop ssh

	ugetint
	removegt
	
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

echo "Distro? <MANJARO / debian>"

read DISTRO

if [ $DISTRO == ""] 
	then DISTRO="manjaro"
fi

case "$DISTRO" in 
    #case 1 
    "manjaro") manjaroinstall ;; 
      
    #case 2 
    "debian") echo "H" ;; 
esac 


echo "Add bashrc edits? <Y/n>"

read NEW

if [ $NEW == ""] 
	then NEW="yes"
fi

case "$NEW" in 
    #case 1 
    "yes") bashappend ;; 
      
    #case 2 
    "n") echo Ok Done! ;; 
esac
