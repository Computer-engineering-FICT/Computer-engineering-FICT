a=int(input("Write a "))   #дозволяємо ввести змінні з клавіатури
b=int(input("Write b "))
if a<b:                    #задаємо умову за якої b більша за a
    for i in range(a+1,b): #створюємо діапазон
        print(i)
else:                      #задаємо умову неправильного вводу чисел
    print("a>b or a=b")
N=len (range(a+1,b))
print ("N:",N)
