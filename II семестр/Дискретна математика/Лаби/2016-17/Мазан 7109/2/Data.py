class sets():
    def __init__(self):
        self.A = []
        self.B = []

    def write(self, A , B):
        self.A = list(set(A))
        self.B = list(set(B))

    def read(self, set):
        if set == "A":
            return self.A
        else:
            return self.B
