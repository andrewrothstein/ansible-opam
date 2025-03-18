#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/ocaml/opam/releases/download

dl()
{
    local ver=$1
    local arch=$2
    local os=$3
    local dotexe=${4:-""}
    local platform="${arch}-${os}"
    local file="opam-${ver}-${platform}${dotexe}"
    local lfile=$DIR/$file
    local url=$MIRROR/$ver/$file
    if [ ! -e $lfile ];
    then
        curl -sSLf -o "${lfile}" "${url}"
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
    dl $ver ppc64le linux
    dl $ver riscv64 linux
    dl $ver s390x linux
    dl $ver x86_64 linux
    dl $ver arm64 macos
    dl $ver x86_64 netbsd
    dl $ver x86_64 macos
    dl $ver x86_64 openbsd
    dl $ver x86_64 windows .exe
}

dl_ver ${1:-2.3.0}
