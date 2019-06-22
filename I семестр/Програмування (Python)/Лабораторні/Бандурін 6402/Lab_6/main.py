from Lab_6.lab_6 import competition,names


for i in zip(names):
    p=competition(name=i[0])

p.data()
print()
p.rezult()
