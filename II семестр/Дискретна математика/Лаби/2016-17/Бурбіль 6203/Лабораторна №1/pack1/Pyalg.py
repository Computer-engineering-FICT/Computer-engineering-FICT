import time as d
class Pyal():
    def __init__(self):
        with open(r"gen.txt", "r", encoding="UTF-8") as f:
            self.a = str(f.readline()).strip("{")
            self.a = self.a.rstrip("}\n")
            self.a = self.a.split(", ")

            self.b = str(f.readline()).strip("{")
            self.b = self.b.rstrip("}\n")
            self.b = self.b.split(", ")

            self.c = f.readline().strip("{")
            self.c = self.c.rstrip("}\n")
            self.c = self.c.split(", ")
        with open(r"range.txt", "r", encoding="UTF-8") as m:
            self.U = str(m.readline()).strip("{")
            self.U = self.U.rstrip("}\n")
            self.U = self.U.split(", ")
        self.y = self.a
        self.now=d.time()
        d.sleep(0.0000001)
        self.x = set(self.U)-set(self.c)
        self.z = set(self.x) | set(self.y)
        d.sleep(0.0000001)
        self.enow=d.time()
        print(self.enow-self.now)
        print(self.now)
