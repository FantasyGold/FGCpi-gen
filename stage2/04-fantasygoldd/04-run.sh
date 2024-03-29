#!/bin/bash -e
on_chroot << EOF
  apt-get install make
  wget https://www.openssl.org/source/openssl-1.0.1j.tar.gz
  tar -xzvf openssl-1.0.1j.tar.gz
  cd openssl-1.0.1j
  ./config
  make depend
  make
#  make test
  make install
  sudo ln -sf /usr/local/ssl/bin/openssl `which openssl`

  git clone https://github.com/FantasyGold/FantasyGold-Core
  cd FantasyGold-Core
  git checkout master
  git pull
  qmake "USE_NATIVETOR=-" "USE_UPNP=1" "USE_QRCODE=1" OPENSSL_INCLUDE_PATH=/usr/local/ssl/include OPENSSL_LIB_PATH=/usr/local/ssl/lib fantasygold-qt.pro
  make
  cp FantasyGold /usr/local/bin/FantasyGold
  cd src
  OPENSSL_INCLUDE_PATH=/usr/local/ssl/include OPENSSL_LIB_PATH=/usr/local/ssl/lib make -f makefile.arm
  strip fantasygoldd
  cp fantasygoldd /usr/local/bin/fantasygoldd
EOF
