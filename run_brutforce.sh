#!/bin/bash
# brutforce file svm
# rakesh4osdd@gmail.com 22 March 2021

file=$1
	echo $0 $file
	dir=`echo $file| xargs basename -s .csv` 
	neg=`echo $file| xargs basename `
	mkdir svm_$dir
	cd svm_$dir
	cp ../svm_steps.sh .
	cp ../$file .
	# postive dataset
        cp ../pos_train.csv .	
	date
	time ./svm_steps.sh $neg pos_train.csv > svm_steps.log 2>&1 
	pids="$! $pids"
echo $pids
wait $pids
date

