#!/bin/bash
# run.sh run in all folders one by one for parallel jobs

#pids=''
dirs="bpp_asa bpp_ss_asa dpc2_asa dpc2_ss ser"
for dir in $dirs
do
	echo $dir `date`
	cd $dir/bf
	# remove current junk data
	rm -rf *
	#copy and run run.sh file
	cp  ../../run.sh .
	bash run.sh > run.log 
	#pids="$! $pids"
	date
	cd -
done
#echo "submitted jobs pids: $pids"
