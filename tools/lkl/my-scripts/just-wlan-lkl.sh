#!/system/bin/sh

export LD_LIBRARY_PATH=/data/local/tmp/curl-arm32

# Debugging options

export LD_HIJACK_DEBUG=1
export LKL_HIJACK_DEBUG=1

# Setup static assignment interface wlan0

export LKL_HIJACK_NET_IFTYPE0=raw
export LKL_HIJACK_NET_IFPARAMS0=wlan0
export LKL_HIJACK_NET_MAC0="c4:9a:02:42:a3:7e"
export LKL_HIJACK_NET_IP0=192.168.2.56
export LKL_HIJACK_NET_NETMASK_LEN0=24
export LKL_HIJACK_NET_GATEWAY="192.168.2.1"

export LD_PRELOAD=./liblkl-hijack.so

# ping 8.8.8.8 &&

# /data/local/tmp/curl-arm32/curl --resolve multipath-tcp.org:80:130.104.230.45  http://multipath-tcp.org
# sleep 2
/data/local/tmp/iperf3 -c 202.214.86.51 -p 443 -t 60 $*
