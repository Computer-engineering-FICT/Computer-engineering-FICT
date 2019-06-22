while True:
    string = input('Enter string , please! : ')
    length = str(len(string))
    print('{0}-{1}'.format(string, length))
    print("""if you want to continue press "Enter"
if you finish press "q" """)
    a = input()
    if a == "q":
        print("З вами було приємно працювати")
        break
