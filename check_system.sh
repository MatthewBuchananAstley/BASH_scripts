#!/bin/bash
#
# Script to check existence of files 
#
# For instance to check the missing files on the filesystem compared to the files 
# that are stated in the package information:
#
# for i in `apt list  | grep installed| cut -d"/" -f1| uniq` ;do echo $i ; for ii in `dpkg -L $i` ;do echo $(echo $i) = $(./check_system.sh $ii)  ; done ; done | grep FAIL
#
# 

color_reset="\e[0m"
color_red="\e[31m"
color_green="\e[32m"
color_blue="\e[34m"

functiontest () 
{
    IFS=':'
    for i in $*
        do
            if [ -a $i ] ; then 
                printf "[${color_green}PASS${color_reset}] $i exists \n";
            else 
	        printf "[${color_red}FAIL${color_reset}] $i does not exist \n"; 
            fi
    done 
    IFS=''
}

for i in $* 
    do 
        functiontest $i
done 
