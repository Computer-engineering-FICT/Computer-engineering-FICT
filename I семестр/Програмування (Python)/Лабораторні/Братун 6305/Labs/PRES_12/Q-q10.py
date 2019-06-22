arr = [[1, 2], [3, 4], [5, 6]]
arr1=[j * 10 for i in arr for j in i if j % 2 == 0]
print(arr1)
