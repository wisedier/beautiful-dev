#!/usr/bin/env bash
read -r -d '' PKGS << EOM
software-properties-common gcc-multilib build-essential
gdb git vim curl wget net-tools netcat gnupg2 libc6-dbg libc6-dbg:i386
python3.9 python3.9-dev python3-distutils
openssh-server ca-certificates tzdata xinetd
apt-transport-https gnupg-agent software-properties-common
htop socat ansible git docker-ce docker-ce-cli containerd.io
EOM


if [ "$1" == "download" ]
then
    wget https://download.docker.com/linux/ubuntu/gpg
    cat gpg | sudo apt-key add -
    sudo dpkg --add-architecture i386
    sudo apt update
    sudo apt install -y -d -o=dir::cache=$(pwd) $PKGS
elif [ "$1" == "install" ]
then
    sudo apt install -y -o=dir::cache=$(pwd) $PKGS
    sudo usermod -aG docker $(whoami)
elif [ "$1" == "clean" ]
then
    sudo rm -r gpg pkgcache.bin srcpkgcache.bin archives
else
    echo "Usage: $0 [download|install|clean]"
fi
