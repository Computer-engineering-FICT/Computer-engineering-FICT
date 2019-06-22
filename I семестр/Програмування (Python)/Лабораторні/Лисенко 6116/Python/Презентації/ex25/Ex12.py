f = open(r"file.txt","r", encoding="cp1251")
print("Дескриптор =",f.fileno ())
f.close ()
