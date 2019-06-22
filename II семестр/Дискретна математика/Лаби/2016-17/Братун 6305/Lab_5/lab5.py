first_number = 1001100001110010011001000
n = 25
m = 20
#m 1 to n

next_number = '0' + str(first_number)[:-1]

zip_list = list(zip(str(next_number),str(first_number)))
result = []

for i in range(len(zip_list)):
    if zip_list[i][0] == zip_list[i][1]:
        result.append(0)
    else:
        result.append(1)
print(result)


