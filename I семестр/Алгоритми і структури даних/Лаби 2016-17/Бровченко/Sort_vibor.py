import random
s = []
length = int(input("Enter length: "))
for i in range(length):
    s.append(random.randint(-50, 50))
print(s)
k = 0
while k < len(s) - 1:
    m = k
    i = k + 1
    while i < len(s):
        if s[i] < s[m]:
            m = i
        i += 1
    s[k], s[m] = s[m], s[k]
    k += 1
print(s)
