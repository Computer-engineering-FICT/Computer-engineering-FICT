a = [5, 2, 7, 4, 0, 9, 8, 6]
for i in range(len(a)-1):
    for j in range(i+1, len(a)-1):
        if a[i] > a[j]:
            a[i], a[j] = a[j], a[i]
print(a)
