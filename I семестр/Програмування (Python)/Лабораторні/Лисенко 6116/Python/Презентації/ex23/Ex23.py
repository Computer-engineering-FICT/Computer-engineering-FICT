class MyClass:
    x="Line"
    def __len__(self):
        b=len(self.x)
        return b
c = MyClass()
print(len(c))
