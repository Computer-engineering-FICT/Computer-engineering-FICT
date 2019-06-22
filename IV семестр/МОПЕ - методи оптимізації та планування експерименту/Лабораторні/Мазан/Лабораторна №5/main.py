import random

from functions import *







factors_table = generate_factors_table(raw_factors_table)
for row in factors_table:
    print(row)
naturalized_factors_table = generate_factors_table(raw_naturalized_factors_table)
with_null_factor = list(map(lambda x: [1] + x, naturalized_factors_table))

m = 3
N = 15
ymin = 196
ymax = 209
y_arr = [[random.randint(ymin, ymax) for _ in range(m)] for _ in range(N)]
while not cochran_criteria(m, N, y_arr):
    m+=1
    y_arr = [[random.randint(ymin, ymax) for _ in range(m)] for _ in range(N)]

y_i = np.array([np.average(row) for row in y_arr])

coefficients = [[m_ij(x_i(column)*x_i(row)) for column in range(11)] for row in range(11)]

free_values = [m_ij(y_i, x_i(i)) for i in range(11)]

beta_coefficients = np.linalg.solve(coefficients, free_values)
print(list(map(int,beta_coefficients)))

importance = student_criteria(m, N, y_arr, beta_coefficients)
d = len(list(filter(None, importance)))
fisher_criteria(m, N, d, naturalized_factors_table, y_arr, beta_coefficients, importance)