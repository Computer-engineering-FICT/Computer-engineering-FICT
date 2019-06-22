import random
s = []
length = int(input("Enter length: "))
for i in range(length):
    s.append(random.randint(-50, 50))
print(s)
n = 1
while n < len(s):
    for i in range(len(s)-n):
        if s[i] > s[i+1]:
            s[i], s[i + 1] = s[i + 1], s[i]
    n += 1
print(s)
