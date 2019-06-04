#!/bin/bash
#
# Script om te kijken hoe dat met 2>&1 en tee ook alweer ging.

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
