from random import randrange
m = int(input("Кількість рядків"))
n = int(input("Кількість стовпців"))
list1 = []
for i in range(m):
    list1.append([])
    for elem in range(n):
        list1[i].append([])
        list1[i][elem] = randrange(11)
for i in range(len(list1)):
    print(list1[i])

deleted_list_elem = []
for i in range(m):
    set_list1 = set(list1[i])
    if len(set_list1) != len(list1[i]):
        deleted_list_elem.append(i)

deleted_list_elem.reverse()
for i in range(len(deleted_list_elem)):
    del list1[deleted_list_elem[i]]

print("\n")
for i in range(len(list1)):
    print("%s" % list1[i])
