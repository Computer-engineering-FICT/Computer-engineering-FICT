class MyError(Exception): pass
try:
   # raise MyError("Опис виключення")
    raise MyError
except MyError as err:
    print (err)# Виведе:Опис виключення
