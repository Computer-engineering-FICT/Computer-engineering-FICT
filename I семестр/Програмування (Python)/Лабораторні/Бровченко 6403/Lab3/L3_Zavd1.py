D = bytearray(input('Введіть рядок символів:  '), 'cp1251', 'replace')
x = 0
for D[x] in D:
    if x <= len(D):
        if D[x] in range(192, 256):
            D[x] = 42
        x += 1
print("%s" % str(D)[12:-2])
