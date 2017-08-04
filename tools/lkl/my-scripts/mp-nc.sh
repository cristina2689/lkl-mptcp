#!/system/bin/sh

# >> Android
#
# Fake request for the curl User Agent since the MPTCP server
# is set to respond to it with TRUE/FALSE if you are mptcp capable

REQ='GET / HTTP/1.1\r\nHost: www.multipath-tcp.org\r\nUser-Agent: curl/7.D52.1\r\n Accept: */*\r\n\r\n'

echo -en $REQ | /data/local/tmp/busybox-32 nc 130.104.230.45 80

# echo -en $REQ | /data/local/tmp/busybox-32 nc www.multipath-tcp.org 80
