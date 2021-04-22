#!/bin/bash
# install libwebp
set -e

ROOTDIR=${ZZROOT:-$HOME/app}
NAME="libwebp"
TYPE=".tar.gz"
FILE="$NAME$TYPE"
DOWNLOADURL="https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.0.3.tar.gz"
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

./configure --prefix="$ROOTDIR"
make -j"$(nproc)" && make install

echo $NAME installed on "$ROOTDIR"
