#My function
def differencexz(a, b):
    res = []
    for i in a:
        for j in b:
            if i != j:
                res.append(i)
    return set(res)

x = {1,2,3,4,5,6,7,8,9,10}
c = {1,2,3,4,5}
print(differencexz(x,c))
