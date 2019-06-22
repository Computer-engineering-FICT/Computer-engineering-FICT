class MyClass:
   def __init__(self):
        self.x = 10
   def get_x(self):
        return self.x
с = MyClass ()                  #
print(hasattr(с, "x"))   # Виведе: True
print(hasattr(с, "y"))   # Виведе: False
