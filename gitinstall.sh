#! /bin/bash

input $username
input $email

git config --global user.name "$username"
git config --global user.email "$email"
git config --global color.ui true
git config --global core.editor emacs
$ ssh-keygen -t rsa -b 4096 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
echo 'copied ssh-key'
