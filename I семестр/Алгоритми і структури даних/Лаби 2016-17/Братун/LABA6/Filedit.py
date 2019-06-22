f2 = open("text.txt", "w")
f2.write("|" + " " * 12 + "String" + " " * 12 + "|" + " " * 12 + "Integer" + " " * 12 + "|")


def Delete(n):
    file = open('text.txt' , 'r')
    spisok = file.readlines()
    file.close()
    del spisok[n-1]
    file = open('text.txt' , 'w')
    file.writelines(spisok)
    file.close()


def add():
    print("Enter stop if u want to quit ")
    s = 0
    while s != "stop":
        s = input("Enter some text or enter a number: ")
        for i in range(0, 10):
            for j in str(s):
                if j == str(i):
                    s = int(s)
        k = 3
        if type(s) == str:
            if k%2 == 0:
                f2.write("|" + " " * 12 + s + " " * (18 - len(s)) + "|")
                k += 1
            if k%2 == 1:
                f2.write("\n"+"|" + " " * 12 + s + " " * (18 - len(s)) + "|")
                k += 1
        if type(s) == int:
                f2.write(" "*12+str(s) + " " * (19 - len(str(s))) + "|")
                k += 1
    lines = 0
    for line in open("text.txt"):
        lines += 1
    f2.close()
    Delete(lines)
add()


