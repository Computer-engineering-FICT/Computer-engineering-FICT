matrix = [[0, 1, 0, 1, 0],
          [1, 0, 1, 1, 1],
          [0, 0, 0, 0, 1],
          [1, 1, 0, 0, 0],
          [0, 1, 1, 1, 0]]


# control function
def plan(matrix):
    resources = []
    requests = []
    for i in range(len(matrix)):
        resources.append(i)
        requests.append(i)

    for i in range(len(matrix)):
        # find min row and swap it with first
        row_index = search_min_row(matrix, i)
        swap_rows(matrix, i, row_index)
        resources[i], resources[row_index] = resources[row_index], resources[i]

        # find min column where first element is 1 and swap it with first column
        column_index = search_min_column(matrix, i)
        swap_columns(matrix, i, column_index)
        requests[i], requests[column_index] = requests[column_index], requests[i]


        print("Send request %s to resource %s" % (requests[i], resources[i]))



def print_matrix(matrix):
    for i in matrix:
        print(i)


# search row with min count of 1 in submatrix
def search_min_row(matrix, start):  # start - variable that help define submatrix
    min = len(matrix)
    row_index = -1
    for i in range(start, len(matrix)):
        a = sum(matrix[i][start::])
        if a < min:
            min = a
            row_index = i
    return row_index


# search column with min sum that start with 1
def search_min_column(matrix, start):
    min = len(matrix)
    column_index = -1
    for i in range(start, len(matrix)):
        if matrix[start][i] == 1:
            a = sum(matrix[x][i] for x in range(start, len(matrix)))
            if a < min:
                min = a
                column_index = i
    return column_index


# changes the columns in places
def swap_columns(matrix, a, b):
    for i in range(len(matrix)):
        matrix[i][a], matrix[i][b] = matrix[i][b], matrix[i][a]


# changes the rows in places
def swap_rows(matrix, a, b):
    matrix[a], matrix[b] = matrix[b], matrix[a]


# # set all elements in first row and first column of submatrix as 0 except first element that is 1
# def set_zeroes(matrix, start):
#     matrix[start][start] = 1
#     for i in range(start + 1, len(matrix)):
#         matrix[start][i] = 0
#         matrix[i][start] = 0
#
#
# # represent matrix in comfortable format
# def sort_matrix(arr, matrix, type):
#     for i in range(len(arr) - 1):
#         for j in range(i + 1, len(arr)):
#             if arr[i] > arr[j]:
#                 arr[i], arr[j] = arr[j], arr[i]
#                 swap_rows(matrix, i, j) if type == 1 else swap_columns(matrix, i, j)


print("Start matrix:")
print_matrix(matrix)
print()

plan(matrix)

