def s(*t, b, **c):
    for i in t:
        i += b
    return i+c['k']

print(s(10, 3, b=2, k=5))
