#!/usr/bin/env sh
dpkg --add-architecture i386
apt update
apt install -y -d --reinstall -o=dir::cache=/tmp \
    software-properties-common gcc-multilib build-essential \
    gdb git vim curl wget net-tools netcat gnupg2 libc6-dbg libc6-dbg:i386 \
    python3.8 python3.8-dev python3.8-distutils \
    openssh-server ca-certificates tzdata xinetd \
    apt-transport-https gnupg-agent software-properties-common \
    htop socat ansible git
