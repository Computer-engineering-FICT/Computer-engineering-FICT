# Текстовий режим
with open(r"file.txt", "r") as f:
       A=f.read(6)
       B=f.read(7)
       C=f.read(7)
print(A, B, C)
f.close()

