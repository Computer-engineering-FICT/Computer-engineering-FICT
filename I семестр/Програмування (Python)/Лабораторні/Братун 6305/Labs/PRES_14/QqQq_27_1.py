import itertools
n = 1
for i in itertools.cycle("aбв"):
    if n > 10: break
    print(i, end=" ")
    n += 1
