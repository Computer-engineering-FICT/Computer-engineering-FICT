import testrel, time, importlib
i=0
k=20
m='''Введіть
1-для продовження;
2- для перезавантаження модуля;
решта-вихід\n'''
while True:
    i+=1
    print("Вивід №",i,testrel.x )
    time.sleep(0.011)
    if i>=k:
       key=input(m)
       if key =="1" :
           k+=20
           continue
       elif key == "2":
          importlib.reload(testrel)
          k+=20
       else: break
