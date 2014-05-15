#!/bin/bash

SERVER=$1

scp udp2serialSPI.py slip.py root@$SERVER:/usr/bin
scp udp2serialSPI root@$SERVER:/etc/init.d
scp udp2serialSPI_OSC.service root@$SERVER:/etc/avahi/services
ssh root@$SERVER /etc/init.d/udp2serialSPI enable
ssh root@$SERVER reboot
