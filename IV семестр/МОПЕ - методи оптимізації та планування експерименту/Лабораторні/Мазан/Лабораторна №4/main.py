

import numpy as np
import random as r
from functions import *

#                       1   2   3    12  13  23     123
norm_factors_table = [[-1, -1, -1,   +1, +1, +1,    -1],
                      [-1, +1, +1,   -1, -1, +1,    -1],
                      [+1, -1, +1,   -1, +1, -1,    -1],
                      [+1, +1, -1,   +1, -1, -1,    -1],

                      [-1, -1, +1,   +1, -1, -1,    +1],
                      [-1, +1, -1,   -1, +1, -1,    +1],
                      [+1, -1, -1,   -1, -1, +1,    +1],
                      [+1, +1, +1,   +1, +1, +1,    +1]]

zero_factor = [+1]*8

factors_table = [[-30, -35, 0,       1050, 0, 0,           0],
                 [-30,  10, 20,      -300, -600,       -6000],
                 [0,   -35, 20,      0, 0, -700,           0],
                 [0,    10, 0,       0, 0, 0,              0],

                 [-30, -35, 20,      1050, -600, -700, 21000],
                 [-30,  10, 0,       -300, 0, 0,           0],
                 [0,   -35, 0,       0, 0, 0,              0],
                 [0,    10, 20,      0, 0, 200,            0]]

y_min = 178
y_max = 210

M = 5
N = 8
y_arr = [[r.randint(y_min, y_max) for _ in range(M)] for j in range(N)]

x1 = np.array(list(zip(*factors_table))[0])
x2 = np.array(list(zip(*factors_table))[1])
x3 = np.array(list(zip(*factors_table))[2])
yi = np.array([np.average(i) for i in y_arr])

coeffs = [[N,        m_ij(x1),    m_ij(x2),    m_ij(x3),    m_ij(x1*x2),    m_ij(x1*x3),    m_ij(x2*x3),    m_ij(x1*x2*x3)],

          [m_ij(x1), m_ij(x1**2), m_ij(x1*x2), m_ij(x1*x3), m_ij(x1**2*x2), m_ij(x1**2*x3), m_ij(x1*x2*x3), m_ij(x1**2*x2*x3)],
          [m_ij(x2), m_ij(x1*x2), m_ij(x2**2), m_ij(x2*x3), m_ij(x1*x2**2), m_ij(x1*x2*x3), m_ij(x2**2*x3), m_ij(x1*x2**2*x3)],
          [m_ij(x3), m_ij(x1*x3), m_ij(x2*x3), m_ij(x3**2), m_ij(x1*x2*x3), m_ij(x1*x3**2), m_ij(x2*x3**2), m_ij(x1*x2*x3**2)],

          [m_ij(x1*x2), m_ij(x1**2*x2), m_ij(x1*x2**2), m_ij(x1*x2*x3), m_ij(x1**2*x2**2), m_ij(x1**2*x2*x3), m_ij(x1*x2**2*x3), m_ij(x1**2*x2**2*x3)],
          [m_ij(x1*x3), m_ij(x1**2*x3), m_ij(x1*x2*x3), m_ij(x1*x3**2), m_ij(x1**2*x2*x3), m_ij(x1**2*x3**2), m_ij(x1*x2*x3**2), m_ij(x1**2*x2*x3**2)],
          [m_ij(x2*x3), m_ij(x1*x2*x3), m_ij(x2**2*x3), m_ij(x2*x3**2), m_ij(x1*x2**2*x3), m_ij(x1*x2*x3**2), m_ij(x2**2*x3**2), m_ij(x1*x2**2*x3**2)],

          [m_ij(x1*x2*x3), m_ij(x1**2*x2*x3), m_ij(x1*x2**2*x3), m_ij(x1*x2*x3**2), m_ij(x1**2*x2**2*x3), m_ij(x1**2*x2*x3**2), m_ij(x1*x2**2*x3**2), m_ij(x1**2*x2**2*x3**2)]]

free_vals = [m_ij(yi), m_ij(yi*x1), m_ij(yi*x2), m_ij(yi*x3), m_ij(yi*x1*x2), m_ij(yi*x1*x3), m_ij(yi*x2*x3), m_ij(yi*x1*x2*x3)]

natural_bi = np.linalg.solve(coeffs, free_vals)

natural_x1 =  np.array(list(zip(*norm_factors_table))[0])
natural_x2 =  np.array(list(zip(*norm_factors_table))[1])
natural_x3 =  np.array(list(zip(*norm_factors_table))[2])

norm_bi = [m_ij(yi),
           m_ij(yi*natural_x1),
           m_ij(yi*natural_x2),
           m_ij(yi*natural_x3),
           m_ij(yi*natural_x1*natural_x2),
           m_ij(yi*natural_x1*natural_x3),
           m_ij(yi*natural_x2*natural_x3),
           m_ij(yi*natural_x1*natural_x2*natural_x3)]



while not cochran_criteria(M, 4, y_arr):
    M += 1
    y_table = [[r.randint(y_min, y_max) for _ in range(M)] for j in range(N)]
print("Матриця планування:")
labels_table = list(map(lambda x: x.ljust(6), ["x1", "x2", "x3", "x12", "x13", "x23", "x123"] + ["y{}".format(i+1) for i in range(M)]))
rows_table = [list(factors_table[i]) + list(y_arr[i]) for i in range(N)]
rows_normalized_table = [factors_table[i] + list(y_arr[i]) for i in range(N)]
print((" ").join(labels_table))
print("\n".join([" ".join(map(lambda j: "{:<+6}".format(j), rows_table[i])) for i in range(len(rows_table))]))
print("\t")

norm_factors_table_zero_factor = [[+1]+i for i in norm_factors_table]
importance = student_criteria(M, N, y_arr , norm_factors_table_zero_factor)

fisher_criteria(M, N, 1, factors_table, y_arr, natural_bi, importance)