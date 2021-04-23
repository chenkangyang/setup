#!/bin/bash
# install git
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="git"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://github.com/git/git/archive/refs/tags/v2.25.5.tar.gz"
echo $NAME will be installed in "$ROOTDIR"
echo "hey, install libz, opennssl and libcurl first, and temporarily remove anaconda from your PATH before install!"

mkdir -p "$ROOTDIR/downloads"
cd "$ROOTDIR"

if [ -f "downloads/$FILE" ]; then
    echo "downloads/$FILE exist"
else
    echo "$FILE does not exist, downloading from $DOWNLOADURL"
    wget $DOWNLOADURL -O $FILE
    mv $FILE downloads/
fi

mkdir -p src/$NAME
tar xf downloads/$FILE -C src/$NAME --strip-components 1

cd src/$NAME

make configure
./configure --prefix="$ROOTDIR"
make -j"$(nproc)" && make install

echo $NAME installed on "$ROOTDIR"
