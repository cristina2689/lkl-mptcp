#!/system/bin/sh
# This is to be adb pushed on the arm device

export LD_LIBRARY_PATH=/data/local/tmp
LKL_HIJACK_DEBUG=1 LD_PRELOAD=1liblkl-hijack.so ip link

