""""find the unique value list and dictionary"""
list1= [1, 2, 3, 4, 5, 6, 3]

# from collections import defaultdict
# f=defaultdict(int)
# unique_list=[]
# for x in list1:
#     f[x]+=1
# print("original list", f)
# for x in f:
#     if f[x]==1:
#         unique_list.append(x)
# print("unique_list",unique_list)

##--------------------------------------
# f={}
# for x in list1:
#     f[x]=f.get(x,0)+1

# unique = [k for k, v in f.items() if v == 1]
# print(unique)

##------------------------------------------------

s=set()
repeat=set()

for x in list1:
    if x in s:
        repeat.add(x)
    else:
        s.add(x)

unique=s-repeat
print(unique)