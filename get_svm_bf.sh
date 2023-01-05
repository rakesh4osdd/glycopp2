tail -n1 svm_bf*/OUT.sort > OUT.sort.all
cat OUT.sort.all|sed ':a;N;$!ba;s/\/OUT.sort <==\n/\t/g'|sort -nk10

