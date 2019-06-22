class Mixin:      # Визначаємо сам клас-домішку
    attr = 0                # Визначаємо атрибут домішки
    # Визначаємо метод домішки
    def mixin_method(self):
        print("Meтoд домішка")
        print("Зверніть увагу на виклик методу")

m = Mixin
m.mixin_method(m)
