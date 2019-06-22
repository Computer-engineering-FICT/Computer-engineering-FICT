a = [54,1,543,3,52,8,9,21,31,53,34,67,323,211,2]
for i in range(len(a)):
    temp = a[i]
    j = i
    while (a[j-1] > temp) and (j > 0):
        a[j] = a[j-1]
        j = j - 1
    a[j] = temp
print(a)
