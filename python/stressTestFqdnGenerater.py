#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""For use stress test data query.txt generater
data: for tinydns data file
query.txt: for dnsperf / resperf query.txt
"""
import itertools
import uuid
import os


def ip_range(input_string):
    octets = input_string.split('.')
    chunks = [map(int, octet.split('-')) for octet in octets]
    ranges = [range(c[0], c[1] + 1) if len(c) == 2 else c for c in chunks]

    for address in itertools.product(*ranges):
        yield '.'.join(map(str, address))

fData = open('data', 'w')
fQuery = open('query.txt', 'w')

for address in ip_range('172.16-18.0-255.0-255'):
    fqdn = ".".join([str(uuid.uuid4()),
                     "wsjp.osaka."])
    fData.write(
        "".join(["=", fqdn, ":", address, os.linesep])
    )
    fQuery.write(
        " ".join([fqdn, "a", os.linesep])
    )

fData.close()
fQuery.close()
