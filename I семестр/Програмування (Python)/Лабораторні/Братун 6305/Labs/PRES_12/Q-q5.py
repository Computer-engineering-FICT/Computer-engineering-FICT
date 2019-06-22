arr = [1, 2, 3, 4]
for i, elem in enumerate(arr):
    elem *=2 # елемент arr не змінюється
    print(elem, end = " ")
    arr[i] *= 2 # елемент arr змінюється
print (arr)
