#!/bin/bash
#
# Parameter checking functions for <enroll.sh>, <inject.sh>
# ---------------------------------------------------------------------
# 4. Tested on switches: TL-SL2428, TL-SL2218, TL-SL5428E
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

ErrorFile="./ParamErrors.log"
InfoFile="./ParamInfo.log"

BadParam="BadParameter"

CheckIp()
{
	 # Target IP
	 IP=$1

	if [ $IP != "192.168.0.1" ]; then

		# in most cases we deal with 192.168.0.1, admin:amdin; still there are other cases
		echo "<$0>: it's recomended to check an IP">$InfoFile

	fi

	echo "$IP";

	exit 0
}

CheckOp()
{
	# Switch name passed via param 
	OPERATION="$1"

	if  [ $OPERATION == "create" ]; then

		echo "<$0>: will create SNMP group, then will save it">$InfoFile

	elif  [ $OPERATION == "save" ]; then

		echo "<$0>: will only save the changes alegedly done earlier">$InfoFile

	elif  [ $OPERATION == "upgrade" ]; then

		echo "<$0>: will upgrade firmware of switch">$InfoFile

	elif  [ $OPERATION == "acl" ]; then

		echo "<$0>: will create ACL group">$InfoFile


	else

		echo "<$0>: usage <$0> <IPaddr> create <SNMP_GRP>\n    or\n">$ErrorFile
		echo "<$0>: usage <$0> <IPaddr> save">$ErrorFile

		echo "BadParameter";

		exit -2
	fi

	echo "$OPERATION";

	exit 0
}

CheckModel()
{
	 # Switch name passed via param 
	 MODEL_NAME="$1"

	 if [ $MODEL_NAME == "2218" ] || [ $MODEL_NAME == "2428" ] || [ $MODEL_NAME == "5428E" ] ; then

		# usual name for this SNMP Group, still may be different
		echo "<$0>: known switch (TL-SL$MODEL_NAME) being processed">$InfoFile

	 else
		echo "<$0>: unknown switch model. exiting">$ErrorFile

		echo "BadParameter";

		exit -2
	 fi

	echo "$MODEL_NAME";

	exit 0
}

CheckSnmp()
{
	# SNMP Group name to work with
	SNMP_GRP=$1

	if [[ $SNMP_GRP != "SNMP_COM" ]]; then

		# usual name for this SNMP Group, still may be different
		echo "it's recomended to use conventional SNMP group name">$InfoFile

	fi

	echo "$SNMP_GRP";

	exit 0
}

CheckFilename()
{
	# SNMP Group name to work with
	FILENAME=$1

	if [[ ! $FILENAME =~ ".bin" ]]; then

		# usual name for this SNMP Group, still may be different
		echo "Suspicious firmware name. Double-check you're with to save burn [$FILENAME] into swict">$InfoFile

	fi

	echo "$FILENAME";

	exit 0
}


export -f CheckIp
export -f CheckOp
export -f CheckModel
export -f CheckSnmp
