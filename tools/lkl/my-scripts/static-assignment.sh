#!/system/bin/sh

# export LD_LIBRARY_PATH=/data/local/tmp/lkl:/data/local/tmp/curl-arm32/

export LD_LIBRARY_PATH=/data/local/tmp/curl-arm32

# Debugging options

export LD_HIJACK_DEBUG=1
export LKL_HIJACK_DEBUG=1

# Setup static assignment interface wlan0

export LKL_HIJACK_NET_IFTYPE0=raw
export LKL_HIJACK_NET_IFPARAMS0=wlan0
export LKL_HIJACK_NET_MAC0="c4:9a:02:42:a3:7e"
export LKL_HIJACK_NET_IP0=192.168.2.55
export LKL_HIJACK_NET_NETMASK_LEN0=24
export LKL_HIJACK_NET_GATEWAY="192.168.2.1"

# Setup rmnet0

# rmnet changes often, so just grep it
RMNET_IP=$(ifconfig rmnet0 | grep "inet addr" | cut -d ":" -f 2 | cut -d " " -f 1)
echo $RMNET_IP

RMNET_GATEWAY=$(ip route | grep "via" | cut -d " " -f 3 | head -n 1)
echo $RMNET_GATEWAY

RMNET_MASK=$(ip route | head -n 1 | cut -d " " -f 1 | cut -d "/" -f 2)
echo $RMNET_MASK

export LKL_HIJACK_NET_IFPARAMS1=rmnet0
export LKL_HIJACK_NET_IFTYPE1=raw-ipenc
export LKL_HIJACK_NET_IFPARAMS1=rmnet0
export LKL_HIJACK_NET_IP1=$RMNET_IP
export LKL_HIJACK_NET_NETMASK_LEN1=$RMNET_MASK
export LKL_HIJACK_NET_GATEWAY1=$RMNET_GATEWAY
export LKL_HIJACK_BOOT_CMDLINE="loglevel=10"

# Over LKL

export LD_PRELOAD=./liblkl-hijack.so

# ip link

# ifconfig eth0
# ifconfig eth1
# &&
# ping 10.206.211.190 &&
# ping 8.8.8.8


/data/local/tmp/curl-arm32/curl --resolve multipath-tcp.org:80:130.104.230.45  http://multipath-tcp.org

sleep 2
# ping 202.214.86.51

/data/local/tmp/iperf3 -c 202.214.86.51 -p 443 -t 60 $*
