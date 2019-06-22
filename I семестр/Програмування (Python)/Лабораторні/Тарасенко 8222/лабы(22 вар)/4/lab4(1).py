import random
a = int(input("Сгенерировать последовательность чисел от: " ))
b = int(input("до: "))
c = int(input("Количество элементов:"))
if a < b:
    arr = [random.randint(a, b) for i in range(c)]
    print(arr)
    arr1, arr2, arr3 = [], [], []
    for i in arr:
        if i <0:
            arr1.append(i)
        elif i == 0:
            arr2.append(i)
        elif i > 0:
            arr3.append(i)
    new_arr = arr1 + arr2 +arr3
    print(new_arr)

    len_arr = (len(arr3),len(arr2),len(arr1))
    print(len_arr)

    arr_end = []
    if (len_arr[0] + len_arr[1]) % 2 == 0:
        for i in arr:
            i *= 2
            arr_end.append(i)
        print(arr_end)
    else:
        for i in arr:
            i %= 2
            arr_end.append(i)
        print(arr_end)

else:
    print("Невозможно сгенерировать список.Повторите попытку")



