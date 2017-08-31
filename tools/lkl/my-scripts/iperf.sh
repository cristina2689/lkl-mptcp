#!/system/bin/sh

DATE=$(date)

# Usual TCP kernelspace communication
CELLULAR="$DATE"_cellular
WLAN="$DATE"_wlan
echo $WLAN

# LKL communication
CELLULAR_LKL="$DATE"_cellular_lkl
WLAN_LKL="$DATE"_wlan_lkl
MPTCP="$DATE"_mptcp


CMD="../iperf3 -c 202.214.86.51 -t 60 -p 443"

# wlan
# $(CMD) >> $WLAN
../iperf3 -c 202.214.86.51 -t 60 -p 443 -R >> $WLAN
sleep 5

# wlan over lkl
/data/local/tmp/mptcp-last-lkl/just-wlan-lkl.sh -R >> $WLAN_LKL
sleep 5

# cellular over lkl
sh ./cellar-test.sh ../iperf3 -c 202.214.86.51 -t 60 -p 443 -R >> $CELLULAR_LKL
sleep 5

# both
./static-assignment.sh >> $MPTCP
sleep 5

