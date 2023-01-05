#!/usr/bin/bash
date
neg="$1"
pos="$2"

#step3: paac to colum2svm with labels -1 negative dataset and +1 postive dataset
perl ~/bin/svm_scripts/col2svm.pl -i $neg -o $neg.c2s -s -1
perl ~/bin/svm_scripts/col2svm.pl -i $pos -o $pos.c2s -s +1

#step4: mix the postive and negative dataset to create sinle SVM imput file
perl ~/bin/svm_scripts/mix_p_n.pl $pos.c2s $neg.c2s svmin

#step5: split dataset into 5 set for five-fold cross validation
perl ~/bin/svm_scripts/five_sets.pl svmin

#step6: create 4 train and 1 test set
perl ~/bin/svm_scripts/tr_test.pl

#step7: run svm_learn and svm_classify though a master111.pl script by setting g, c, j values for all 5 dataset
cp ~/bin/svm_scripts/svm_learn ~/bin/svm_scripts/svm_classify ~/bin/svm_scripts/accuracy1.pl ~/bin/svm_scripts/accuracy.pl ~/bin/svm_scripts/perf .
perl ~/bin/svm_scripts/master111.pl
#perl master111_parallel.pl

#step8: sort OUT file by 9th column MCC value
sort -nk9 OUT > OUT.sort

~/bin/svm_scripts/get_result.sh > OUT.txt

rm svm_learn svm_classify accuracy1.pl accuracy.pl perf

date
