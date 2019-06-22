a = [5, 2, 7, 4, 0, 9, 8, 6]
n = 1
while n < len(a):
    for i in range(len(a)-n):
        if a[i] > a[i+1]:
            a[i], a[i+1] = a[i+1], a[i]
    n += 1
print(a)
