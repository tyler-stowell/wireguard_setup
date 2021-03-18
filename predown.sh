#!/bin/bash

#Remove rule to reject all traffic if network is down
iptables -D OUTPUT ! -o $1 -m mark ! --mark $(wg show $1 fwmark) -m addrtype ! --dst-type LOCAL -j REJECT
ip6tables -D OUTPUT ! -o $1 -m mark ! --mark $(wg show $1 fwmark) -m addrtype ! --dst-type LOCAL -j REJECT
