while True:
    string = bytes(input('Enter string , please! : '), 'utf-8')
    arr = string.split()
    for item in arr:
        if b'k' in item:
            print("%s" % item.decode("utf-8"))
    print("""if you want to continue press "Enter"
if you finish press "q" """)
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break
