f = open('f.txt', 'r+', encoding = 'utf-8')
p = f.read()
f.close()

p = p.replace('a','а')
p = p.replace('e','е')
p = p.replace('i','і')
p = p.replace('y','у')
p = p.replace('c','с')
p = p.replace('o','о')
p = p.replace('p','р')

f2 = open('f2.txt', 'w', encoding = 'utf-8')
f2.write(p)
f2.close()
