from Town import Town

kharkiv = Town("Харків", 1499700, 9, 38, 350, [46, 32, 17, 43])
odessa = Town("Одеса", 1008489, 5, 20, 236, [23, 66, 12, 40])
lviv = Town("Львів", 723605, 6, 26, 192, [32, 163, 71, 13])
kiev = Town("Київ", 2908088, 10, 107, 847, [52, 33, 31, 29])
lughansk = Town("Луганськ", 422373, 4, 5, 257, [65, 23, 67, 14])
dnipro = Town("Дніпро", 18439, 6, 145, 379, [61,82,16,13])
cherkassy = Town("Черкаси", 283130, 7, 187, 78, [33,47,54,39])
zvenigorodka = Town("Звенигородка", 18035, 4, 1, 21, [23,43,44,39])
semenivka = Town("Семенівка", 10248, 3, 1, 20, [11,25,17,44])
nejin = Town("Ніжин", 93423, 3, 7, 43, [13,32,76,26])
krasnopillya = Town("Краснопілля", 8259, 3, 2, 11, [26,35,55,74])
priluki = Town("Прилуки", 35435, 7, 24, 40, [16,33,49,67])


list_cities = [lughansk, kiev, lviv, cherkassy, odessa,dnipro,kharkiv,zvenigorodka,semenivka,nejin,krasnopillya,priluki]
list_names = ["Київ","Луганськ" ,"Харків","Львів", "Одеса","Дніпро", "Черкаси", "Звенигородка",'Семенівка','Ніжин','Краснопілля','Прилуки']

print("Вітаю в програмі опису міста!")

while True:
    print("Список доступних міст:"),
    for i in list_names:print(i, end=',')
    print('\n')

    value = str(input("Введіть назву міста: ")).lower()
    value = value[0].upper() + value[1:]
    if value in list_names:
        for i in list_cities:
            if i.name == value:
                obj = i
                break
    else:
        print('Інформація про це місто відсутня')
        continue
    obj.print_inf()
    print("Якщо бажаєте продовжити, нажміть щось, якщо хочете закінчить введіть 'вихід'")
    a = input()
    if a == "вихід":
        print("З вами було приємно мати справу")
        break
