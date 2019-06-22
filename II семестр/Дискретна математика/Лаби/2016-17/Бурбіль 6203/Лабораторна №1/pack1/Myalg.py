import time as t
class Myal():
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
        self.z_mtime= t.time()
        t.sleep(0.0000001)
        self.x = []
        for i in self.U:
            if i not in self.c:
                self.x.append(i)
        self.z = []
        for i in self.y:
            if i not in self.x:
                self.z.append(i)
        for s in self.x:
            self.z.append(s)
        self.val = set(self.z)
        t.sleep(0.0000001)
        self.z_metime = t.time()
