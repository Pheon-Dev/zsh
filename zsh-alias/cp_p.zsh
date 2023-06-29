#!/bin/bash

NUM_COLS=`tput cols`
NUM_COLS=$((NUM_COLS-10))


if [ $# -lt 2 ] ; then
	echo "ERROR: you must specify at least two arguments, a source and a destination"
	exit
fi



exists=0
total_size=0
argnum=1
while [ $argnum -lt $# ] ; do

	src=$(eval echo '$'$argnum)
	
	if [ -e "$src" ] ; then
		exists=1
		arg_size=$(du -sb "$src"  2>/dev/null | awk '{ print $1"\n" }' )
		if [ -n "$arg_size" ] ; then
			total_size=$(( $total_size + $arg_size ))
		fi
	fi
	argnum=$(( $argnum + 1 ))

done

if [ "$exists" = "0" ] ; then
	echo "ERROR: No source file specified exists.  Please try again"
	exit
fi


argnum=1
count=0
dest=$(eval echo '$'$#)
while [ $argnum -lt $# ] ; do
	src=$(eval echo '$'$argnum)

	
	strace -q -ewrite cp -r  "$src" "$dest" 2>&1 | awk '{
        count += $NF
            if (count % 10 == 0) {
		    dispcols = ( count / total_size ) * '$NUM_COLS'
		    percent  = ( count / total_size ) * 100
	       
               printf "%3d%% [", percent
               for (i=0;i<=dispcols;i++)
                  printf "="
               printf ">"
               for (i=dispcols;i<'$NUM_COLS';i++)
                  printf " "
               printf "]\r"
            }
         }' total_size=$total_size count=$count
	
	arg_size=$(du -sb "$src"  2>/dev/null | awk '{ print $1"\n" }' )
	count=$(( $count +  $arg_size ))

	argnum=$(( $argnum + 1 ))
done

echo ""
