import time as t
class EaUS:
    def __init__(self):
        try:
            with open(r"gen.txt", "r", encoding="UTF-8") as f:
                self.a = str(f.readline()).strip("{")
                self.a = self.a.rstrip("}\n")
                self.a = set(self.a.split(", "))

                self.b = str(f.readline()).strip("{")
                self.b = self.b.rstrip("}\n")
                self.b = set(self.b.split(", "))

                self.c = f.readline().strip("{")
                self.c = self.c.rstrip("}\n")
                self.c = set(self.c.split(", "))
        except IndexError:
            self.okno3.destroy()

        self.nach = t.time()
        t.sleep(0.0000001)
        self.cb = self.c | self.b
        self.d = self.a ^ self.cb
        t.sleep(0.0000001)
        self.kon = t.time()
