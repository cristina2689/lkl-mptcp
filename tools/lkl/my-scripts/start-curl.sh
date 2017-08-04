#!/system/bin/sh

export LD_LIBRARY_PATH=/data/local/tmp/lkl:/data/local/tmp/curl-arm32/
export LD_HIJACK_DEBUG=1
export LKL_HIJACK_DEBUG=1
export LKL_HIJACK_NET_IFTYPE0=raw
export LKL_HIJACK_NET_IFPARAMS0=wlan0
export LKL_HIJACK_NET_MAC0="c4:9a:02:42:a3:7e"


export LKL_HIJACK_NET_IFTYPE1=raw
export LKL_HIJACK_NET_IFPARAMS1=rmnet0
# export LKL_HIJACK_NET_MAC1=


export LKL_HIJACK_BOOT_CMDLINE="ip=dhcp" 
export LD_PRELOAD=liblkl-hijack.so

/data/local/tmp/curl-arm32/curl --resolve multipath-tcp.org:80:130.104.230.45  http://multipath-tcp.org
