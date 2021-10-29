#!/bin/sh

if [ ! -z $CURRENT_TAG ]; then
  CURRENT_TAG="-v${CURRENT_TAG}"
fi

for EXT in zip tgz tar.gz
do
  for BASE in '' -0 -1
  do
    wget -O TinyTeX${BASE}${CURRENT_TAG}.${EXT} https://yihui.org/tinytex/TinyTeX${BASE}.${EXT}
  done
  wget -O tinitex.${EXT} https://yihui.org/tinytex/tinitex.${EXT}
done
wget -O installer-unix${CURRENT_TAG}.tar.gz https://yihui.org/tinytex/installer-unix.tar.gz
