#!/system/bin

# >> Android
#
# Fake request for the curl User Agent since the MPTCP server
# is set to respond to it with TRUE/FALSE if you are mptcp capable

echo -en 'GET / HTTP/1.1\r\nHost: www.multipath-tcp.org\r\nUser-Agent: curl/7.D52.1\r\n Accept: */*\r\n\r\n' | nc www.multipath-tcp.org 80

# echo -en 'GET / HTTP/1.1\r\nHost: www.multipath-tcp.org\r\nUser-Agent: curl/7.D52.1\r\n Accept: */*\r\n\r\n' | ./busybox-32 nc www.multipath-tcp.org 80
