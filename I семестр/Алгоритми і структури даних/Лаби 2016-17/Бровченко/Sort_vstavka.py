import random
s = []
length = int(input("Enter length: "))
for i in range(length):
    s.append(random.randint(-50, 50))
print(s)
for i in range(1, len(s)):
    while i > 0 and s[i] < s[i - 1]:
            s[i], s[i-1] = s[i-1], s[i]
            i -= 1
print(s)
