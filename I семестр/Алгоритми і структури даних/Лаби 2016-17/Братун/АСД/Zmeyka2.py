def print_matrix(sze, matrix):
    for I in range(sze):
        for J in range(sze):
            print('{0:^5}'.format(matrix[I][J]), end='')
        print('\n')


def snape(sze):
    a = []
    for i in range(sze):
        a.append([])
        for j in range(sze):
            a[i].append(0)
    p = sze - 1

    k = 0

    a[sze - 1][sze - 1] = 1

    i = sze*sze - 1

    for k in range(p):
        for j in range(k+2):
            if k % 2 == 0:
                a[k+1-j][j] = i
                i -= 1
            else:
                a[j][k+1-j] = i
                i -= 1
    for b in range(k-1, -1, -1):
        for j in range(b+2):
            if b % 2 == 0:
                a[sze - 1 - j][j + k - b] = i
                i -= 1
            else:
                a[j+k-b][sze - 1 - j] = i
                i -= 1
    a[0][0] = sze * sze

    return a

size = 5

m = snape(size)
print_matrix(size, m)
