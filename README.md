udp2serialSPI
=============

A bridge between udp packets and a ttySPI serial port.
Framing the UDP packets data on the serial line with slip. 
Developed to use the OSC protocol on the Arduino Yun.
This release uses the SPI port instead of the serial port as in udp2serial https://github.com/cylinderlight/udp2serial

version 1.0  May 15/2014

The YUN software requires a recent build that includes the SPI TTY driver.
I have used this linino image:
http://download.linino.org/linino_distro/master/20140513.0/openwrt-ar71xx-generic-linino-yun-16M-squashfs-sysupgrade.bin


Setup procedure:
the included file setup_push_udp2serialSPI.sh
pushes all the required code to the OpenWRT environment via SSH,
this includes a startup script and Avahi configuration.
from a terminal execute: 
./setup_push_udp2serialSPI.sh linino.local
(change the server name with your hostname)
the openWRT password is requested several times (default on linino is doghunter) and then the system reboots with the full working configuration.

The UDP server listens on port 12000 and writes back to port 11000
The included slip.py is copyright of Roman Haeflei https://github.com/reduzent/pyslip


Examples:
the examples control led13 on the YUN changing the light intensity.

The arduino sketch OSC_SerialSPI_LED processes the OSC message /All/R with a float value 0..100
and replyes back to the sender (/reply) with a float value 0..255

To build the Arduino example the IDE requires 2 libraries (that are here included compressed):
I have built it with IDE 1.5.6-r2

SPIDEV
This library is extracted from a branch of the Arduino IDE modified by the Linino team
that is found here: https://github.com/linino/Arduino


OSC 
This library is developed at CNMAT (http://cnmat.berkeley.edu/oscuino)
by Adrian Freed and others https://github.com/CNMAT/OSC.
I have made 2 additons SLIPEncodedSPISerial.h, SLIPEncodedSPISerial.cpp to support the new StreamSPI class.


There are 2 test applications:

OSC_LED_send
this is a Processing application. Moving the mouse verticaly sends a different value.
It requires the oscP5 library by Andreas Schlegel: http://www.sojamo.de/libraries/oscP5/
I have tested it with Processing (2.1.2).

TouchOSC 
testLED.touchOSC is an interface for http://hexler.net/software/touchosc
the app is available on Apple Store and Android Play store.

////////////////////////////////////////////////////////////////////////


License:

Written by Marco Brianza. Copyright (c) 2014

Permission to use, copy, modify, distribute, and distribute modified versions
of this software and its documentation without fee and without a signed
licensing agreement, is hereby granted, provided that the above copyright
notice, this paragraph and the following two paragraphs appear in all copies,
modifications, and distributions.
 
IN NO EVENT SHALL REGENTS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT,
SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING
OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF REGENTS HAS
BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
REGENTS SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE. THE SOFTWARE AND ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED
HEREUNDER IS PROVIDED "AS IS". REGENTS HAS NO OBLIGATION TO PROVIDE
MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

