#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Options: arm-32 arm-64"
    exit 1
fi

case $1 in
    "arm-32")
        TOOLCH=arm-linux-androideabi-
        ;;
    "arm-64")
        TOOLCH=aarch64-linux-android-
        ;;
esac

cd /home/cristina/iij/lkl-mptcp/tools/lkl
CROSS_COMPILE=$TOOLCH make && \
CROSS_COMPILE=$TOOLCH make test
