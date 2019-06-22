arr = [[1, 2], [3, 4], [5, 6]]
arr1 = []
for i in arr:
    for j in i:
        if j % 2 == 0: # Якщо число парне
             arr1.append(j * 10) # Додаємо елемент 
print (arr1)
