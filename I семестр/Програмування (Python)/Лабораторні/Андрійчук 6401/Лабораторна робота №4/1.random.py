from random import randrange
length_of_list = int(input("Ввведіть довжину списка: "))
list1 = []
list2 = []
list3 = []
while len(list2) != length_of_list:
    list1.append(randrange(1000))
    list2.append(randrange(1000))
print("List #1:",list1)
print("List #2:",list2)

index = 0
while index != length_of_list:
    if len(list3) == length_of_list:
        pass
    else:
        list3.append(list2[index])
        index += 1

    if len(list3) == length_of_list:
        pass
    else:
        list3.append(list1[index])
        index += 1
print("List #3:",list3)

while len(list3) != length_of_list//2:
    del list3[randrange(len(list3))]
print("List #4: {}".format(list3))
