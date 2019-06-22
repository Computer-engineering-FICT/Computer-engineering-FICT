class First:
    def func(self,a,b):
        return a+b
m=First()
result=m.func(25,75)
print(result)
result=m.func("При", "віт")
print(result)
result=m.func(True, True)
print(result)
