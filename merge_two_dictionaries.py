d1 = {'a': 10, 'b': 20}
d2 = {'b': 30, 'c': 40}

# result = d1.copy()

# for k, v in d2.items():
#     result[k] = result.get(k, 0) + v
# print(result)


## merge both d1 and d2 dictionary.

result = {**d1, **d2}
print(result)