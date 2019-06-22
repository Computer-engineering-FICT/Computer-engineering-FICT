import random
from collections import Counter
a = int(input("Сгенерировать последовательность чисел от: " ))
b = int(input("до: "))
c = int(input("Количество элементов: "))
arr = [random.randint(a, b) for i in range(c)]
print(arr)
print()

set1 = set(arr)
arr1 = [k for k,v in Counter(arr).items() if v >1]
set2 = set(arr1)

arr2 = set1.difference(set2)
print(arr2)
print()

asc_sort = sorted(arr2)
print(asc_sort)
desc_sort = sorted(arr2,reverse=True)
print(desc_sort)

new_arr3 =[(a[0]*a[1])**(1/2) for a in list(zip(asc_sort,desc_sort))]
print(new_arr3)
