import networkx as nx
import matplotlib.pyplot as plt
from copy import deepcopy
from numpy import transpose
from numpy.linalg import solve
from lab3.transitions import system
import re

G = nx.DiGraph()
unique_states = []


class State:

    def __init__(self, modules: list, pvState, intense=0.0):
        self.modules = modules
        self.pvState = pvState
        self.intense = intense

    def __eq__(self, other):
        return self.modules == other.modules

    def __repr__(self):
        return str(self.modules)


# trans (from, to)
def state_after_trans(crState: State, trans: tuple) -> State:
    modules = deepcopy(crState.modules)
    fmodule = modules[trans[0]]
    tmodule = modules[trans[1]]
    if fmodule[1] == 0:
        raise Exception('can\'t transfer from empty module')
    if fmodule[0] == 0:
        fmodule[1] -= 1
        fmodule[2] += 1
    else:
        fmodule[0] -= 1

    if tmodule[2] == 0:
        tmodule[0] += 1
    else:
        tmodule[2] -= 1
        tmodule[1] += 1

    modules[trans[0]] = fmodule
    modules[trans[1]] = tmodule
    intense = fmodule[4][fmodule[3].index(trans[1])]
    return State(modules, crState, intense=intense)


def get_possible_states(crState: State) -> list:
    transitions = []
    for m in crState.modules:
        if m[1] != 0:
            for way in m[3]:
                transitions.append((crState.modules.index(m), way))
    states = [state_after_trans(crState, t) for t in transitions]
    return states


def show_max_state_in_graph():
    """ Вывод состояния с максиммальным количеством повторений вершины в графе"""
    max_prob_happen_state_number = max(states_probab_happen.values())

    keys1 = list(states_probab_happen.keys())
    values1 = list(states_probab_happen.values())
    n = values1.count(max_prob_happen_state_number)

    print('кількість повторень: {}'.format(max_prob_happen_state_number))

    max_prob_happen_state_value = keys1[values1.index(max_prob_happen_state_number)]
    pattern = '\[(\d, \d, \d), \['
    rez = re.findall(pattern, max_prob_happen_state_value)
    print(rez)
    print('\n')


def show_min_state_in_graph():
    """ Вывод состояния с минимальным количеством повторений вершины в графе"""
    min_prob_happen_state_number = min(states_probab_happen.values())

    keys1 = list(states_probab_happen.keys())
    values1 = list(states_probab_happen.values())
    n = values1.count(min_prob_happen_state_number)

    print('кількість повторень: {}'.format(min_prob_happen_state_number))

    c = 0
    for i in range(n):
        min_prob_happen_state_value = keys1[values1[c:].index(min_prob_happen_state_number)]
        pattern = '\[(\d, \d, \d), \['
        rez = re.findall(pattern, min_prob_happen_state_value)
        print(rez)
        c = keys1.index(min_prob_happen_state_value) + 1
    print('\n')


def show_max_state():
    """ Вывод состояния с максиммальным количеством повторений"""
    max_prob_happen_state_number = list(p).index(max(p))

    keys1 = list(states_probab_happen.keys())

    print('імовірність: {}'.format(max(p)))

    max_prob_happen_state_value = keys1[max_prob_happen_state_number]
    pattern = '\[(\d, \d, \d), \['
    rez = re.findall(pattern, max_prob_happen_state_value)
    print(rez)
    print('\n')


def show_min_state():
    """ Вывод состояния с минимальным количеством повторений"""
    min_prob_happen_state_number = list(p).index(min(p))

    keys1 = list(states_probab_happen.keys())

    print('імовірність: {}'.format(min(p)))

    min_prob_happen_state_value = keys1[min_prob_happen_state_number]
    pattern = '\[(\d, \d, \d), \['
    rez = re.findall(pattern, min_prob_happen_state_value)
    print(rez)
    print('\n')

l1, l2, l3 = 1, 0.5, 0.2

# unchecked_states = [
    # State([[0, 2, 0, [1, 2], [l1* 0.7, l1 * 0.3]], [0, 0, 1, [0, 2], [l2 * 0.8, l2 * 0.2]], [0, 0, 1, [0], [l3 * 1.0]]], None)]

# my lab3 task
# unchecked_states = [
#     State(
#         [
#             [7, 1, 0, [1], [1/0.00025]],  # CPU
#             [0, 0, 1, [0, 2, 3, 4], [1/0.005, 1/0.005, 1/0.005, 1/0.005]], # NB
#             [0, 0, 1, [1, 5, 6, 7], [1/0.01, 1/0.01, 1/0.01, 1/0.01]],  # SB
#             [0, 0, 1, [1], [1/0.003]],  # Cache
#             [0, 0, 1, [1], [1/0.001]],  # GPU
#             [0, 0, 1, [0], [1/0.1]],  # AC
#             [0, 0, 1, [0], [1/0.2]], # VC
#             [0, 0, 1, [2], [1/0.2]]  # DC
#         ],
#         None
#     )
# ]

unchecked_states = [State(system.gen_matrix(), None)]

states_probab_happen = {}

while len(unchecked_states) != 0:
    current = unchecked_states.pop()
    if current not in unique_states:
        states_probab_happen[str(current)] = 1
        G.add_node(len(unique_states), state=current)
        if current.pvState:
            G.add_weighted_edges_from([(unique_states.index(current.pvState), len(unique_states), current.intense)])
        unique_states.append(current)
        next_states = get_possible_states(current)
        unchecked_states.extend(next_states)
    else:
        states_probab_happen[str(current)] += 1
        G.add_weighted_edges_from([(unique_states.index(
            current.pvState), unique_states.index(current), current.intense)])


#nx.draw_shell(G, with_labels=True)
#plt.savefig('tree.png')
#plt.show()

markof_m = nx.adjacency_matrix(G).toarray()
# print(nx.incidence_matrix(G, oriented=True).toarray())
# print(A.toarray())


def probabilities(matrix: list):
    l = len(matrix)
    m = transpose(matrix)
    for i in range(l):
        outgoing = 0
        for j in range(l):
            if i != j: outgoing -= matrix[i][j]
            m[i][i] = outgoing
    m[0] = [1. for _ in range(l)]
    b = [0. for _ in range(l)]
    b[0] = 1.
    return solve(m, b)


p = probabilities(markof_m)
#print(list(p).index(max(p)))

devices = [0. for _ in range(9)]



for i, prob in enumerate(p):
    for j in range(9):
        if unique_states[i].modules[j][1] != 0:
            devices[j] += prob


dev = ['CPU', 'north bridge', 'south bridge', 'RAM', 'CPU cache', 'Video', 'GP', 'Audio', 'KD']
for i in range(len(devices)):
    print('{:<15}'.format(dev[i]), devices[i])

print('\nКІЛЬКІСТЬ СТАНІВ: {}\n'.format(len(unique_states)))

#print('СТАНИ, ЩО ПОВТОРЮЮТЬСЯ НАЙЧАСТІШЕ:')
#show_max_state()

#print('СТАНИ, ЩО ЗУСТРІЧАЮТЬСЯ НАЙРІДШЕ:')
#show_min_state()
