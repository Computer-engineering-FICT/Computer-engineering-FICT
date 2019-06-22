D = bytearray(input('Введіть рядок символів:  '), 'cp1251', 'replace')
M = list(D.decode('cp1251'))
x = 0
for D[x] in D:
    if x <= len(D):
        if D[x] in range(192, 256):
            M[x] = '*'
        x += 1
print("%s" % M)
