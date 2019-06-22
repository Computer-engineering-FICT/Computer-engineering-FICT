
size = int(input("Введіть довжину:"))
array = []

for i in range(size):
    array.append(int(input("Введіть елемент № " + str(i+1))))

m = 0
max_id = 0

for i in range(size):
    count = 0
    for j in range(size):
        if array[j] == array[i]:
            count += 1
    if count > m:
        m = count
        max_idx = i

print('Найбільш повторювальний елемент: ' + str(array[max_id]))
