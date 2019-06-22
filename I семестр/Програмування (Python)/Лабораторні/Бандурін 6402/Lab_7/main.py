import os,sys
os.chdir("C://Lab_7//Vlad Bandurin//")
tmp_in=sys.stdin
tmp_out=sys.stdout

def sentence(file):
    with open(file, "r") as f:
        a=f.read()
        b=a.split(".")
        t1=b[0:int(len(b)/2)]
        t2=b[int((len(b))/2):-1]
        t3=b[-1:]

    return t1,t2,t3

f1 = open("2part1.txt","w",encoding="cp1251")
f2 = open('2part2.txt',"w",encoding="cp1251")
f3 = open("2part3.txt","w",encoding="cp1251")
f4=open("2.txt")

sys.stdout = f1

print(".".join(sentence("2.txt")[0]))
sys.stdout = f2

print(".".join(sentence("2.txt")[1]))

sys.stdout = f3

print(".".join(sentence("2.txt")[2]))

f3.close()

sys.stdout=tmp_out
f=open("2part3.txt","r")
f5=open("v2.txt","w")
sys.stdout = f5
print()
print("Кількість символів у файлі {0:^6} - {1}".format(f4.name.split(".")[0],os.path.getsize(f4.name)))
print("Кількість символів у файлі {0:6} - {1}".format(f1.name.split(".")[0],os.path.getsize(f1.name)))
print("Кількість символів у файлі {0:6} - {1}".format(f2.name.split(".")[0],os.path.getsize(f2.name)))
print("Кількість символів у файлі {0:6} - {1}".format(f3.name.split(".")[0],os.path.getsize(f.name)))

f1.close()
f2.close()
f4.close()
f5.close()
sys.stdout=tmp_out

r=open("v2.txt","r")
print(r.read())
