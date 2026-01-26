"""find the first non repeating element"""

list1= [1, 2, 3, 4, 5, 6, 3]
f={}
for x in list1:
    f[x]=f.get(x,0)+1

for x in list1:
    if f[x]==1:
        print(x)
        break
