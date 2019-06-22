d = {"x": 1, "y": 2, "z": 3}
for key in sorted(d):
    print("({0!s} => {1!s})".format(key, d[key]), end=" ")
