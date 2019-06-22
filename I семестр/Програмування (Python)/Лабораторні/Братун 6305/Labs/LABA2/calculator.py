while True:
    print('Пропонуємо скористуватися елементарним калькулятором на такі дії: "+" "-" "*" "/"')
    print("Увага!!! Всі невірно введені символи будуть прирівнюватись 0")
    try:
        x = float(input("Введіть перше число: "))
    except(ValueError, TypeError, OverflowError):
        x = float(0)
    try:
        y=float(input('Введіть друге число: '))
    except (ValueError, TypeError, OverflowError):
        y = float(0)

    operation=input('Яку математичну дію Ви хочете з ними виконати? : ')

    result=None

    if operation == '+':
        result = x+y
    elif operation == '-':
        result = x-y
    elif operation == '*':
        result = x*y
    elif operation == '/':
        try:
            result = x/y
        except (ZeroDivisionError):
            result = 0
    else: print('Не правильна операція')
    if result is not None:
        print('Відповідь: ',x,operation,y,' = %.2f'% result)
    print("Якщо хочете продовжити рахувати нажмыть Enter , якщо хочете закінчить введіть q")
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break
