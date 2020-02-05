#! /bin/bash
echo "created by Darknemesis98"
echo "GitHub Configuration:"
read -p "Enter your GitHub username: " username
read -p "Enter email id: " email

echo "updating parameters"
git config --global user.name "$username"
git config --global user.email "$email"
git config --global color.ui true
git config --global core.editor emacs

echo "Generating ssh-key"
ssh-keygen -t rsa -b 4096 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

xclip -sel clip < ~/.ssh/id_rsa.pub
echo 'copied ssh-key'
