import string
S = bytes(input('Введіть рядок символів:  '), encoding='utf-8')
x = -1
d = 0
for i in S:
    x += 1
    if chr(i) in string.ascii_letters:
        if x > d:
            d = x
        x = 0
if x > d:
    d = x
print("%i" % d)
