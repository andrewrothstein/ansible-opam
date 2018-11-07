#!/usr/bin/env sh
VER=2.0.1
DIR=~/Downloads
MIRROR=https://github.com/ocaml/opam/releases/download/$VER

dl()
{
    PLATFORM=$1
    OS=$2
    F=opam-$VER-$PLATFORM-$OS
    wget -O $DIR/$F $MIRROR/$F
}

dl arm64 linux
dl armhf linux
dl i686 linux
dl x86_64 darwin
dl x86_64 linux
dl x86_64 openbsd

sha256sum $DIR/opam-$VER-*

