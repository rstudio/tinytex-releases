#!/bin/sh

if [ ! -z $CURRENT_TAG ]; then
  CURRENT_TAG="-v${CURRENT_TAG}"
  # download prebuilt TinyTeX binaries
  for EXT in zip tgz tar.gz
  do
    for BASE in '' -0 -1
    do
      wget -O TinyTeX${BASE}${CURRENT_TAG}.${EXT} https://yihui.org/tinytex/TinyTeX${BASE}.${EXT}
    done
    wget -O tinitex.${EXT} https://yihui.org/tinytex/tinitex.${EXT}
  done
  wget -O installer-unix${CURRENT_TAG}.tar.gz https://yihui.org/tinytex/installer-unix.tar.gz
else
  # build texlive-full
  wget https://yihui.org/tinytex/TinyTeX.tar.gz
  tar xzf TinyTeX.tar.gz
  ./.TinyTeX/bin/*/tlmgr install scheme-full
  tar zcf TinyTeX-2.tar.gz .TinyTeX
  ls -lh TinyTeX*
  rm -r .TinyTeX TinyTeX.tar.gz
fi
