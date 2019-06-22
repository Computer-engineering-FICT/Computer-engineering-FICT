while True:
    stri = bytes(input('Введіть рядок : '), 'utf-8')
    arr = stri.split()
    for i in arr:
        if b'k' in i:
            print("%s" % i.decode("utf-8"))
    print("""Якщо хочете продовжити нажміть "Enter"
Якщо хочите вийти нажміть "q" """)
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break
