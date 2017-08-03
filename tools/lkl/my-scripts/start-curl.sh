#!/system/bin/sh

export LD_LIBRARY_PATH=/data/local/tmp/lkl:/data/local/tmp/curl-arm32/
export LD_PRELOAD=liblkl-hijack.so
export LD_HIJACK_DEBUG=1
export LKL_HIJACK_DEBUG=1
export LKL_HIJACK_NET_MAC="c4:9a:02:42:a3:7e"
export LKL_HIJACK_BOOT_CMDLINE="ip=dhcp"
export LKL_HIJACK_NET_IFTYPE=raw
export LKL_HIJACK_NET_IFPARAMS=wlan0

/data/local/tmp/curl-arm32/curl --resolve multipath-tcp.org:80:130.104.230.45  http://multipath-tcp.org
