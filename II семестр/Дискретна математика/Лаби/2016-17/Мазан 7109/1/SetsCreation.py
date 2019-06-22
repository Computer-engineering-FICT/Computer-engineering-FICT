class Set():
    def __init__(self,values):
        self.values = values

    def __call__(self):
        return self.values

    def __str__(self):
        return str(self.values)

    def copy(self):
        return Set([i for i in self.values])

    def inversion(self,Universal: "Set"):
        k=0
        Result = []
        for j in range(len(Universal.values)):
            b = False
            for i in range(len(self.values)):
                if self.values[i] == Universal.values[j]: b = True
            if b == False:
                k+=1
                Result.append(Universal.values[j])
        return Set(Result)

    def union(self,B: "Set"):
        Result = B.values
        k = len(B.values)
        for j in range(len(self.values)):
            q = False
            for i in range(len(B.values)):
                if self.values[j] == B.values[i]: q = True
            if q == False:
                k+=1
                Result.append(self.values[j])
        return Set(Result)

    def intersection(self,B: "Set"):
        k=0
        Result = []
        for j in range(len(self.values)):
            for i in range(len(B.values)):
                if self.values[j] == B.values[i]:
                    Result.append(self.values[j])
                    k+=1
        return Set(Result)

    def difference(self,B: "Set"):
        Result = self.values
        for j in range(len(self.values)):
            q = False
            for i in range(len(B.values)):
                if self.values[j] == B.values[i]: q = True
                else: continue
            if q == True:
                Result[j] = None
        #видалення об'єктів NoneType
        Result = [i for i in Result if not i == None]
        return Set(Result)
