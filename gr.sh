#!/usr/bin/env bash

set -e

# defaults
defaultPathName=github
defaultUserName=me
defaultUserEmail=me@gmail.com

echo "Step1:"

echo ""

# read input
read -p "Enter path name [$defaultPathName]: " pathName
read -p "Enter user name [$defaultUserName]: " userName
read -p "Enter user email [$defaultUserEmail]: " userEmail

echo ""
echo ""


# fill defaults
pathName=${pathName:-$defaultPathName}
userName=${userName:-$defaultUserName}
userEmail=${userEmail:-$defaultUserEmail}

# sanitize
pathName=${pathName//[^a-zA-Z0-9_]/}
userEmail=${userEmail// /_}

# gen key

key="$HOME/.ssh/id_rsa_${pathName}"

echo "Step2:"

echo ""

echo "[Generating key...]: $key"

echo ""

ssh-keygen -N "" -f "$key" -t ed25519 -C "$userEmail"

echo ""
echo ""


echo "Step3:"

echo ""

echo "[Setting up...]: ~/$pathName with user: $userName <$userEmail>"

mkdir -p ~/$pathName

echo "
[core]
    sshCommand = ssh -i $key -F /dev/null

[user]
    name = $userName
    email = $userEmail
" > ~/$pathName/.gitconfig

echo ""
echo ""

echo "Step4:"

echo ""

echo "[Registering...]"

echo "
[includeIf \"gitdir:~/$pathName/\"]
    path = ~/$pathName/.gitconfig
" >> ~/.gitconfig

echo ""
echo ""


echo "[Done]"

echo ""
echo ""

echo "Now you can paste pubkey to according git website:"

echo ""


cat "${key}.pub"