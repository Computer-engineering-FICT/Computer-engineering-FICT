import testex1 as t
if __name__=="__main__":
   print("Це головна програма")
else:
   print( "Імпортований модуль")
print(t.s)
print("Звертаємось до атрибуту модуля",t.__name__)
print("Звертаємось до змінної модуля" ,t.n)

