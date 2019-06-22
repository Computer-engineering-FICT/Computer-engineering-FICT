with open(r"file.txt", "rb") as f:
       for line in f:
           print(repr(line))
print("*"*20)
with open(r"file.txt", "r") as f:
         for line in f:
            print(repr(line))

