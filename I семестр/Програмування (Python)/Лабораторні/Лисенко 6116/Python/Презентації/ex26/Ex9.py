import os.path
print("{0:<30} {1:<20}".format("Відносний шлях","file.txt"))
p1 = os.path.abspath(r"file.txt")
print("{0:<30} {1:<20}".format("Абсолютний шлях",p1))
print("--------------------------------------------------")
print("{0:<30} {1:<20}".format("Відносний шлях в підкаталог","folder1\\file.txt"))
p2 = os.path.abspath(r"folder1/file.txt")
print("{0:<30} {1:<20}".format("Абсолютний шлях в підкаталог",p2))
print("--------------------------------------------------")
print("{0:<30} {1:<20}".format("Відносний шлях в надкаталог","..\\file.txt"))
p3 = os.path.abspath(r" .. /file.txt")
print("{0:<30} {1:<20}".format("Абсолютний шлях в надкаталог",p3))
print("--------------------------------------------------")
