arr = [1, 2, 3, 4]
for i in range(len(arr)):
    arr[i] *= 2
print (arr)
print()

arr = [1, 2, 3, 4, 5, 6, 7, 8]
for i in range(len(arr)):
    if i>0: arr[i]+=arr[i-1]
print (arr)
