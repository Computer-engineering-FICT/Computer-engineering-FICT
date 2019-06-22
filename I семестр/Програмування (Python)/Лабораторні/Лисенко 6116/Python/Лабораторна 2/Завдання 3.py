N = int(input("N > 2; N = "))
A = float(input("A < B\nA = "))
B = float(input("B = "))
if N > 2 and A < B:
    H = (B - A) / (N - 1)
    print("H = " + str(H))
    for i in range(N):
        print(str(A), end="; ")
        A += H
else:
    print("повинні виконуватись умови N > 2 та A < B")
