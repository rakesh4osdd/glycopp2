#!/bin/bash
# run for parallel SVM for nlinked dataset
# create negative dataset with neg_train.csv and 241 line
date
# get scripts and data
cp ~/bin/parallel_svm_olinked/* .
cp ../demo_test/neg_train.csv ../demo_test/pos_train.csv .

# create 128 random neg data files
/opt/jupyterhub/bin/ipython3 neg_data_bf_olinked.py > neg_data_bf_olinked.log 

# run SVM parallel for 128 neg files and 1 pos file
date
ls data/bf_neg_train.csv*.csv|parallel ./run_brutforce.sh > run_brutforce.log 2>&1
date

# collect the 128 SVM results from all folder
model=`pwd|cut -f7 -d '/'`

#add header to results
echo -e "SVM_neg_folder\tThres\tTP\tFP\tTN\tFN\tSen\tSpec\tAccuracy\tMCC" >get_svm_bf_$model.csv
./get_svm_bf.sh |grep -v "^$" >> get_svm_bf_$model.csv
wc -l get_svm_bf_$model.csv

# copy the results
cp get_svm_bf_$model.csv /home/rakesh/glycopp2_project/glycopp2_march2021/nlinked/nlinked_results/
date
