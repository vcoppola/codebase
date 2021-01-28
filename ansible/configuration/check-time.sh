#!/bin/sh
ansible -f 8 -i inventory/all all -m shell -a "ntpdate -q 10.160.50.15 "
