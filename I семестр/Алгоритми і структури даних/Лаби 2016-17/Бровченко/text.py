def create_file(name):
    new_file = open(name+'.txt', 'w')
    new_file.close()
    return new_file


def add_line(file):
    col1 = int(input('First column: '))
    col2 = input('Second column: ')
    file.writelines('%5d|%-s\n' % (col1, col2))
    return file


def del_line(name, string):
    file = open(name+'.txt', 'w')
    tempfile = name+'.txt'
    with open(name+'.txt') as fin:
        with open(tempfile, 'w') as temp:
            for line in fin:
                line = line.rstrip('\n')
                if line != string:
                    temp.write(line + '\n')
    file.__del__()
    return tempfile


while True:
    T = int(input('________________________________\n'
                  'Make your choice:\n'
                  '1 -> create new .txt file\n'
                  '2 -> edit existing .txt file\n'
                  '3 -> open .txt file\n'
                  '0 -> exit\n'
                  '________________________________\n'
                  'Your choice: '))

    if T == 1:
        NAME = input('Name your file -> ')
        FILE = create_file(NAME)

    elif T == 2:
        NAME = input('Print the name of the file -> ')
        option = int(input('1 - add line\n'
                           '2 - delete line\n'))
        if option == 1:
            n = int(input('How many lines you will add?\n'))
            FILE1 = open(NAME+'.txt', 'a')
            for i in range(n):
                FILE = add_line(FILE1)
            FILE1.__del__()

        elif option == 2:
            n = input('Print the line -> ')
            FILE = del_line(NAME, n)
        else: raise ValueError

    elif T == 3:
        NAME = input('Print the name of the file -> ')
        with open(NAME+'.txt') as F:
            print('_____begin_____\n')
            for line in F:
                print(line)
            print('______end______\n')
            F.close()

    elif T == 0: raise SystemExit

    else: raise ValueError
