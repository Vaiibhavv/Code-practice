d = {'a': 10, 'b': 5, 'c': 20}
sorted_d= dict(sorted(d.items(),key=lambda item:item[1],reverse=True))
print(sorted_d)