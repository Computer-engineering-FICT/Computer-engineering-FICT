def swap_rows(matrix, index1, index2):
    matrix[index1], matrix[index2] = matrix[index2], matrix[index1]


def gaussian_elimination(matrix):

    row_count = len(matrix)
    row_length = len(matrix[0])

    for i in range(row_count):
        imax = i
        for j in range(i, row_count):
            if matrix[j][i] > matrix[imax][i]:
                imax = j

        swap_rows(matrix, i, imax)

        for j in range(i+1, row_count):
            first_j = matrix[j][i]
            for k in range(row_length):
                matrix[j][k] -= matrix[i][k] * first_j / matrix[i][i]


def back_substitution(matrix):

    n = len(matrix)-1
    solution = [matrix[n][n+1] / matrix[n][n]]  # n's root

    for i in range(n-1, -1, -1):            # n-1's...  root
        sum = matrix[i][n+1]
        for j in range(n, i, -1):        # n's coef
            sum -= matrix[i][j] * solution[n-j]
        x = sum / matrix[i][i]
        solution.append(x)

    return solution[::-1]


def gaussian_method(matrix):
    gaussian_elimination(matrix)
    return back_substitution(matrix)


def main():
    system_matrix = [
        [1.14, -2.15, -5.11, 2.05],
        [0.42, -1.13, 7.05, 0.80],
        [-0.71, 0.81, -0.02, -1.07]
    ]

    solution = gaussian_method(system_matrix)

    print("Solution:")
    for var in range(len(solution)):
        print("X{} = {}".format(var+1, solution[var]))

if __name__ == '__main__':
    main()
