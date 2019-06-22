import glob
print("Всі файли з розширенням txt")
pa = glob.glob("C:\\LECTURE27\\folder1\\*.txt")
print(pa)
print("Всі файли з розширенням html")
pb = glob.glob("C:\\LECTURE27\\folder1\\*.html") # Абс. шлях
print(pb)
pc = glob.glob("folder1/*.html") # Відносний шлях
print(pc)
print("Всі файли з цифрою 1 наприкінці назви")
pd = glob.glob("C:\\LECTURE27\\folder1\\*1.*")
print(pd)

