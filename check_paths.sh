#!/bin/bash 
# GPL 2.0
#
# Kan jij bash? Werd mij gevraagd vandaag.
# 
# Eehm eventjes trutten en dan kan ik het weer een beetje.
# Ik moest even het sjonge kijk en daarom Perl/Python weerstaan, niet stoer willen doen 
# met liefdevolle regular expressions KUNG FU.
# Ook zat ik even met armpjes over elkaar en dacht ik "zie je wel ik kan niet eens gewoon simpel bash".
# Ging toch beter met Ritalin, zal ik weer aan de Ritalin? Neen, ook dat mag niet. 
#  
# En dan opeens zien oja, ik moet wel $j gebruiken en in de functie de input field seperator resetten.
#
# Een script om even te zien of paden in je shell environment wel echt bestaan.  
# 
# De leuke kleurtjes komen uit een script uit de linux kernel source zip.
# 


color_reset="\e[0m"
color_red="\e[31m"
color_green="\e[32m"
color_blue="\e[34m"


PATHS=`env | egrep PATH`


functiontest () 
{
    IFS=':'
    for i in $*
        do
            if [ -a $i ] ; then 
                printf "$i exists [${color_green}PASS${color_reset}]\n";
            else 
	        printf "$i does not exist [${color_red}FAIL${color_reset}]\n"; 
            fi
    done 
    IFS=''

}

for i in $PATHS
   do
      left=$(echo $i | cut -d \= -f 1)
      right=$(echo $i | cut -d \= -f 2)

      echo $left 
      for j in $right
	  
          do
             functiontest $j;
          done
      
   done
