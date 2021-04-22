#!/bin/bash
# install giflib
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="giflib"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://sourceforge.net/projects/giflib/files/giflib-5.2.1.tar.gz"
echo $NAME will be installed in "$ROOTDIR"

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

make -j"$(nproc)"
make PREFIX="$ROOTDIR" install

echo $NAME installed on "$ROOTDIR"
