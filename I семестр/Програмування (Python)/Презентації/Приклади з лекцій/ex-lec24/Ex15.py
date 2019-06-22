with open(r"file.txt", "w", encoding = "utf-16") as f:
         f.write ( "Рядок")
with open (r"file.txt", "r", encoding = "utf-16") as f:
              for line in f:
                    print (repr (line))

