string = input("111\n")
string = string.split()
string.sort()
print(string)
for i in range(len(string)):
    print(str(i+1)+"."+string[i])
