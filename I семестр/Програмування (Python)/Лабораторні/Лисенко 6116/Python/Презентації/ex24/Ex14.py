with open(r"file.txt", "r", encoding="utf-8") as f:
       for line in f:
          print(repr(line))

with open(r"file.txt", "r", encoding="utf-8-sig") as f:
        for line in f:
            print(repr(line))
