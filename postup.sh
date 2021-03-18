#!/bin/bash

#Reject all traffic if the network is down

# On table OUTPUT, if data is not going out $1, if it's not marked with the fwmark of $1 (see fwmark in
# wg0.conf) or if it's not a LOCAL packet (destination is 127.0.0.1, 192.168.0.x, or 192.168.42.x, as set by
# wg0.conf), then reject the packet. This means that only data going to an address in the interface that
# has passed through the interface (to set fwmark) will be accepted.
iptables -I OUTPUT ! -o $1 -m mark ! --mark $(wg show $1 fwmark) -m addrtype ! --dst-type LOCAL -j REJECT
ip6tables -I OUTPUT ! -o $1 -m mark ! --mark $(wg show $1 fwmark) -m addrtype ! --dst-type LOCAL -j REJECT
