#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
#
# Script om te kijken hoe dat met 2>&1 en tee ook alweer ging.
#
# FileCopyrightText: 2019 - 2022 Matthew Buchanan Astley (matthewbuchanan@astley.nl)

scriptname=`basename $0`
date=`date '+%Y%m%d'`
networkinterface=`cat /proc/net/dev | tail -1 | cut -d" " -f1 | sed 's/://g'`

{

  ethtool -i $networkinterface  
  echo " " 
  ethtool $networkinterface   
  echo " "
  ethtool -k $networkinterface
} 2>&1 | tee $scriptname.ethtool.$date
