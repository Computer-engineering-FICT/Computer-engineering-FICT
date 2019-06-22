# import locale
print('Введите текст: \n')
text=input()
b=text.split()
for i in range(len(b)):

    w=list(b[i])

    w[0]=w[0].upper()
    b[i]=''.join(w)

print("Вы ввели слова: ")
q=0
for i in b:
    # for q in range(len(b)):
    if q<(len(b)-1):
        print(i+',')
    else:
        print(i+'.')
    q+=1
print("Всего слов: ", len(b))
