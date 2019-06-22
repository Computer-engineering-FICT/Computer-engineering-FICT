a = [5,3,5,1,2,3,0,4,2,34,43,24]
for i in range(len(a)):
    idxMin = i
    for j in range(i+1, len(a)):
        if a[j] < a[idxMin]:
            idxMin = j
    tmp = a[idxMin]
    a[idxMin] = a[i]
    a[i] = tmp
print(a)
