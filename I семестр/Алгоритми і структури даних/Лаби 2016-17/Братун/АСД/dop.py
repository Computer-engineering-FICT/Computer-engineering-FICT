f=open(r"C:\Andrew\asd\file.txt", "w+")
n=input("Розмірність")
tmp1="Razmer="+n
f.write(tmp1+'\n')
tmp1="b"+n+"="
tmp2='a'+n+"="
tmp3=int(input(tmp1))
tmp4=int(input(tmp2))
res=tmp3+tmp4
f.write(tmp1+str(tmp3)+"\n")
f.write(tmp2+str(tmp4)+"\n")
for i in range (int(n)-1,0,-1):
    tmp1="b"+str(i)+"="
    tmp2='a'+str(i)+"="
    tmp3=int(input(tmp1))
    tmp4=int(input(tmp2))
tmp4=tmp4/res
res=tmp3+tmp4;
f.write(tmp1+str(tmp3)+"\n")
f.write(tmp2+str(tmp4)+"\n")
b=input("b0=")
b1="b0="+b+"\n"
f.write(b1)
res=str(int(b)+res)
tmp1="res="+str(res)
f.write(tmp1)
f.close
f=open(r"C:\Andrew\asd\file.txt", "r+")
for line in f:
    print(line)
    f.close
print(f)
