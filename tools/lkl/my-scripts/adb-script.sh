#!/system/bin/sh
# This is to be adb pushed on the arm device

export LD_LIBRARY_PATH=/data/local/tmp/lkl
LKL_HIJACK_DEBUG=1 LD_PRELOAD=liblkl-hijack.so ip link

