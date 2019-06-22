d = {'Київ': 2908088, 'Москва': 12197596, 'Париж': 2243833,
     'Вашингтон': 601723, 'Токіо': 13185502, 'Афіни': 664046}
min_num, max_num = input('Введіть мінімальну кількісь жителів: '), input('та максимальну: ')
if min_num != "" != max_num:
    if min_num.isdigit() and max_num.isdigit():
        min_num, max_num = int(min_num), int(max_num)
        if max_num >= min_num:
            find_city = ["Місто", "Населення"]
            check = False
            for i in d.items():
                if min_num <= i[1] <= max_num:
                    find_city.extend(i)
                    check = True
            if check:
                l = int(len(find_city)/2)
                print(('{:_<10}{:_>10}\n'*l).format(*find_city))
            else:
                print('У словнику немає міст з населенням у заданому діапазоні')
        else:
            print("Мінімальне значення не повинне перевищувати максимальне")
    else:
        print("Треба ввести натуральні числа")
else:
    print("Введенний рядок - пустий")
