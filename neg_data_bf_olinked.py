#!/usr/bin/env python
# coding: utf-8

# In[1]:


# take cpp and ss col2svm input file and run for svm for equal size of 265 to run SVM 128 times


# In[22]:


import random
import matplotlib.pyplot as plt
get_ipython().system('ls ')


# In[23]:


# read file in array and  create new files using random lines
#file=open('n_linked_train.tsv','r')
filename='neg_train.csv'
# positive dataset number of lines
fsize=265

file=open(filename,'r')
lines=[]

#for line in file:
#    lines.append(line)
    
with open(filename,'r') as f:
    lines = f.readlines()[1:]
print(len(lines))  
out="bf_"+filename
count=0
liner=[]
repeat=128
randpoint2=[]
for num in range(1,repeat*fsize+1):  
    #print(num)
    line=random.choice(lines)
    #print(lines.index(line))
    randpoint2.append(lines.index(line))
    liner.append(line)
    #lines.remove(line) # skip for brutforce
    #print (num)
    if (num)%fsize == 0:
        count=count+1
        #print(num, count,len(lines), out+str(count)+'.mot', len(liner),line,'\n')
        with open(out+str(count)+'.csv','w') as motif:
            for row in liner:        
                motif.write(row)
                #pass
                #print (row)
            #np.savetxt(motif,row)

        motif.close()  
        liner.clear()
get_ipython().system('wc -l {out}*')


# In[24]:


get_ipython().system('mkdir data ; mv bf_*.csv data')


# In[25]:


#plt.plot(randpoint2, linestyle='', marker='o', color='b')


# In[26]:


#plt.plot(randpoint2[1:289], linestyle='', marker='o', color='b')


# In[ ]:





# In[ ]:




