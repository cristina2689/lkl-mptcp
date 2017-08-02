#!/system/bin/sh

export LD_LIBRARY_PATH=/data/local/tmp/lkl
export LD_PRELOAD=liblkl-hijack.so
export LD_HIJACK_DEBUG=1
export LKL_HIJACK_DEBUG=1

REQ='GET / HTTP/1.1\r\nHost:www.multipath-tcp.org\r\nUser-Agent: curl/7.D52.1\r\n Accept: */*\r\n\r\n'


LKL_HIJACK_NET_MAC="c4:9a:02:42:a3:7e" LKL_HIJACK_BOOT_CMDLINE="ip=dhcp" LKL_HIJACK_NET_IFTYPE=raw \
LKL_HIJACK_NET_IFPARAMS=wlan0 echo -en $REQ | /data/local/tmp/busybox-32 nc 130.104.230.45 80
