while True:
    print('Вітаю в програмі сортування словників')
    a={"Kyivv": 2868702, "Kharkov": 1451132, "Odessa":1017022, "Dnipro":1065008,
             "Donetsk":1017022, "Zaporizhia":815256, "Lviv":732818, "KryvyiRih":668980,
             "Mykolaiv":514136, "Mariupol":492176, "Luhansk":463097, "Makiivka":389589,
             "Vinnytsia":356665, "Simferopol":343644, "Sevastopol":342451, "Kherson":328360,
             "Zvenyhorodka":19901, "Cherkasy":295414, "Chernihiv":304994, "Poltava":317998}
    while True:
        print("Якщо бажаєте продовжити роботу вже з готовим словником введіть '1'")
        print("Якщо хочете добавити своє місто введіть '2'")
        print("Щоб завершити ввід нових міст введіть що-небуть")
        quest = input()
        if quest == '1':
            break
        elif quest == '2':
            newTown = str(input('Введіть місто'))
            newValues = int(input("Введіть кількість населення в цьому місті"))
            a[newTown]=newValues
        else:
            break




    print("Форматований та не сортований словник")
    for key in a:
        print("Кількість населення в місті {0!s}={1!s},".format(key, a[key]), end="\n")
    print('-'*52)



    print("Міста, упорядковані за спаданням кількості мешканців")
    spad = sorted(a.items(),key=lambda x:x[1],reverse=True)
    for i in spad:
        print('{0!s}'.format(i[0]))
    print('-'*15)



    print("Міста, упорядковані у алфавітному порядку за назвою.")
    alphabet = sorted(a)
    for key in alphabet:
        print('{0!s}'.format(key), end="\n")
    print('-'*15)
    print("Якщо хочете продовжити рахувати нажмыть Enter , якщо хочете закінчить введіть q")
    s = input()
    if s == "q":
        print("З вами було приємно працювати")
        break
