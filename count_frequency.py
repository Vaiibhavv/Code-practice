
## solution 1
from collections import Counter
## Count frequency of elements in a list

# list1= [1, 2, 3, 4, 5, 6, 3]
# count_list= Counter(list1)
# print(count_list)

# --------------------------------------------------------
## solution 2 dict way
list1= [1, 2, 3, 4, 5, 6, 3]

# f={}
# for x in list1:
#     f[x]=f.get(x,0)+1
# print(f)
 
 # -----------------------------------------------------------------
# ## solution using the defaultdict
# from collections import defaultdict
# f=defaultdict(int)
# duplicate_list=[]
# for x in list1:
#     f[x]+=1
# print(f)

#-------------------------------------------------------------------

"""solution 4- using list count() function on dictionary O(n)square"""  
# f={}
# for x in list1:
#     f[x]=list1.count(x)
# print(f)

##------------------------------------------------------------------

