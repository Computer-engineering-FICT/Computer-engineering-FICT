a = input()
b = str()
for i in a:
  b += chr(ord(i)-1)
print("{0}".format(b))
