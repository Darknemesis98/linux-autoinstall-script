#!/bin/bash

echo Hi $USER,
echo "System info:"
hostnamectl
echo 
echo 

#functions

pacmanInstall ()
{
echo 'installing apps:'
echo
sudo pacman -S base-devel
sudo pacman -S zsh vim emacs tilix pacaur snapd nano unzip unrar yay git conky conky-manager vlc albert cmake libreoffice-still htop adb fastboot gtk-engine-murrine gtk-engines banner cmatrix figlet gksu gimp binutils
yay -S ttf-ms-fonts ttf-vitsa-fonts
echo
echo
}


aptInstall()
{
echo 'installing apps:'
echo
sudo apt-get install tilix vim emacs zsh snapd nano unzip unrar dolphin git conky-all vlc cmake libreoffice htop ssh adb fastboot cmatrix figlet gimp
echo
echo
}


#zshrc-append
# alias inatall="sudo pacman -S"
# alias remove="sudo pacman -R"
# alias update="sudo pacman -Syyu && pacaur -Syu && yay -Syu" 
# alias update="sudo pacman -Syyu" 
# alias find='sudo pacman -Ss' 
# alias wttr='curl wttr.in' 
# alias ls="ls -l" 



# TO find out the distribution that is currently installed.
DIS="$(uname -n)" 

case $DIS in

  ubuntu | pop-os) #Distros with apt package manager
    echo -n "APT package manager selected."
    aptInstall
    ;;

  Arch | Manjaro) #Distros with pacman package management
    echo -n "PACMAN package manager selected."
    pacmanInstall
    ;;
esac



read -p "Do you want to proceed to install Code editors? (y/n)?" snapeditor
case "$snapeditor" in 
  y|Y ) 
    echo "yes"
    sudo snap install code --classic
    sudo snap install sublime-text --classic
    ;;
  n|N )
    echo "Skipping instlltion.";;
  * ) echo "invalid";;
esac


read -p "Continue configuring zsh and ohmyzsh? (y/n)?" zshcon
case "$zshcon" in 
  y|Y ) 
    echo "yes"
    
    #zsh configurations
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    cp  -rv .zshrc .oh-my-zsh $HOME/

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    ;;
  n|N )
    echo "Skipping instlltion.";;
  * ) echo "invalid";;
esac


echo Completed.


