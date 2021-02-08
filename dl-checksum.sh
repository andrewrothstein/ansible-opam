#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/ocaml/opam/releases/download

dl()
{
    local ver=$1
    local arch=$2
    local os=$3
    local platform="${arch}-${os}"
    local file="opam-${ver}-${platform}"
    local lfile=$DIR/$file
    local url=$MIRROR/$ver/$file
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{ print $1 }')
}

dl_ver() {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver arm64 linux
    dl $ver armhf linux
    dl $ver i686 linux
    dl $ver x86_64 linux
    dl $ver x86_64 macos
    dl $ver x86_64 openbsd
}

dl_ver ${1:-2.0.8}
