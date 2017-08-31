

# rmnet changes often, so just grep it
RMNET_IP=$(ifconfig rmnet0 | grep "inet addr" | cut -d ":" -f 2 | cut -d " " -f 1)
echo $RMNET_IP

RMNET_GATEWAY=$(ip route | grep "via" | cut -d " " -f 3 | head -n 1)
echo $RMNET_GATEWAY

RMNET_MASK=$(ip route | head -n 1 | cut -d " " -f 1 | cut -d "/" -f 2)
echo $RMNET_MASK

LD_PRELOAD=./liblkl-hijack.so LKL_HIJACK_DEBUG=1 LKL_HIJACK_NET_IFTYPE0=raw-ipenc LKL_HIJACK_NET_IFPARAMS0=rmnet0 LKL_HIJACK_NET_IP0=$RMNET_IP LKL_HIJACK_NET_NETMASK_LEN0=$RMNET_MASK LKL_HIJACK_NET_GATEWAY=$RMNET_GATEWAY LKL_HIJACK_BOOT_CMDLINE="loglevel=10" $*
