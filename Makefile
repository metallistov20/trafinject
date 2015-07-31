# Makefile to generate Cprimitive <inject>
#
# 1. Ensure <cURL-devel> is installed on your system. If needed
# can be downloaded from here: http://curl.haxx.se/download.html,
# but better is to use platform package mnager (dpkg, apr-get, etc).
#
# 2. Provide flags -I<dir> and -L<dir> once installed
# into not default 'lib' and 'include' dirs of compiler.  
#
# (C) Copyright 2015, TP-Link Inc, konstantin.mauch@tp-link.com
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of
# the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA 02111-1307 USA

CC = gcc

CFLAGS = -c -g

LDFLAGS = -L/usr/local/lib 

LIBS = -lcurl 	 


OBJS = inject.o

all: $(OBJS) inject


inject: inject.o
	$(CC)  -o inject inject.o $(LDFLAGS) $(LIBS)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

clean: 
	rm -f *.o *~ inject *.log
