class Mixin:   # Визначаємо сам класс-домішку
    attr = 0   # Визначаємо атрибут домішки
    def mixin_method(self):
       # Визначаємо метод домішки
        print("Meтoд домішки")

class MixClass(Mixin):
    def MC_method(self):
        print("Meтoд класу MixClass")
class SubClass (MixClass):
    def Sub_method(self):
        print("Meтoд класу SubClass")
c1=MixClass()
c1.MC_method()
c1.mixin_method ()#  метод домішки
с2=SubClass()
с2.MC_method()
с2.Sub_method()
с2.mixin_method()# метод домішки
