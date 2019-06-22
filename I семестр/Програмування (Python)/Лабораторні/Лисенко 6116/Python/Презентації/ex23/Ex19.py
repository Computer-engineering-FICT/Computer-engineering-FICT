class A:
    def __getattr__(self,b):
      print("Викликано метод __getattr__()")

a=A()
a.c
