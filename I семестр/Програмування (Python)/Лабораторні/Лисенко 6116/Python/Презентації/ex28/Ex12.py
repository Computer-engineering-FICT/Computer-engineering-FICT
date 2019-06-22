class MyClass:
    def __enter__(self):
        print("Викликано метод __enter_()")
        return self
    def __exit__ (self, Type, Value, Trace):
        print ("Викликано метод _exit_() ")
        if Type is None: # Якщо виключення не виникло
            print("Виключення не виникло")
        else: # Якщо виникло виключення
            print("Value =", Value)
            return False
print("Послідовність при відсутності виключення:")
with MyClass() as obj:
    print("Блoк всередині with")
