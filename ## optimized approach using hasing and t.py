## optimized approach  using hasing and two sum approch() , i.e target= a+b+c,, and a+b+c=0 , (O n square )
def threeSum_2(three_sum_array):
    unique_triplet=set()
    ans=list()
    three_sum_array.sort()
    for i in range(0,len(three_sum_array)):
        # initially will find our a. i.e num[i] .i.e b+c=-a, in this first iteration our target is a , so -a=-target
        target=-three_sum_array[i]
        s=set() ## to check if a and b exist (num[i], and num[j])

        for j in range(i+1, len(three_sum_array)):
            # in this case we got our num[j], now task to find out the num[k] i.e c , so c=-a-b

            third=target-three_sum_array[j]

            ## check the third exist in inner set =s 
            if third not in s:
                triplet=(three_sum_array[i],three_sum_array[j],third)
                unique_triplet.add(triplet)
                ans.append(list(triplet))

        ## next time to find out our third value in set 
            s.add(three_sum_array[j])
    return ans
nn=[-1,0,1,2,-1,-4]
print(threeSum_2(nn))
