import random
import math
import numpy as np

class SemiMarkovProcess:

    def __init__(self, matrix: "two-dimensional double array"):
        self.relation_matrix = matrix
        self.equation = None

    def toMarkovProcess(self):

        #defining size of support matrix and position of "basic" nodes in it
        size = len(self.relation_matrix)
        index = 0
        self.real_nodes = list()
        for i in self.relation_matrix:
            self.real_nodes.append(index)
            for j in i:
                if j != 0:
                    size+=1
                    index+=1
            index+=1
        #filling the additional matrix with values
        additional_matrix = [[0 for i in range(size)] for j in range(size)]
        for i in range(len(self.relation_matrix)):
            row = self.real_nodes[i]
            column = self.real_nodes[i]
            for j in range(len(self.relation_matrix[0])):
                if self.relation_matrix[i][j] != 0:
                    additional_matrix[row][column+1] = 2 * self.relation_matrix[i][j]
                    additional_matrix[column+1][self.real_nodes[j]] = 2 * self.relation_matrix[i][j]
                    column += 1


        # for i in self.relation_matrix:
        #     print(i)
        #
        # print("\n")
        # print(real_nodes)
        # for i in additional_matrix:
        #     print(i)

        return ContiniousMarkovProcess(additional_matrix, self.real_nodes)

    def stationary_probabilities(self):
        F = self.toMarkovProcess()
        return F.toSemiMarkovProcess()

    def simulate(self, tests_num):
        F = self.toMarkovProcess()
        return F.toSemiMarkovProcess(F.simulate(tests_num,0))




# additional continious markov process matrix used for calculation stationary probabilities of any semi markov process
class ContiniousMarkovProcess:
    def __init__(self, matrix, base_nodes = None):
        default = list(range(len(matrix)))
        self.base_matrix = matrix
        self.base_nodes = base_nodes if not base_nodes == None else default


    def static_conditions(self):
        equation = [[0 for i in range(len(self.base_matrix))] for j in range(len(self.base_matrix))]
        for i in range(len(equation)-1):
            s = 0
            for j in range(len(equation)):
                s+=self.base_matrix[i][j]
                equation[i][i] = -s
                if self.base_matrix[j][i] != 0:
                    equation[i][j] = self.base_matrix[j][i]
        for i in range(len(equation)):
            equation[len(equation)-1][i] = 1
        # for i in equation:
        #     print(i)
        free_members = [0 if i < len(self.base_matrix)-1 else 1 for i in range(len(self.base_matrix))]
        # solve the equations system and round the result to four digits after point
        c = list(map(lambda a: round(a,4), np.linalg.solve(equation, free_members)))
        # print(c)
        return c

    def simulate(self, tests_num, initial_state):
        system_time = 0
        time_in_states = [0 for i in range(len(self.base_matrix))]
        state = initial_state
        for iteration in range(tests_num):
            transition_times = [-1.0/x*math.log(random.random()) if x != 0 else float("inf") for x in self.base_matrix[state]]
            transition_time = min(transition_times)
            next_state = transition_times.index(transition_time)
            time_in_states[state]+=transition_time
            system_time+=transition_time
            state = next_state
        stationary_probabilities = [round(i/system_time,4) for i in time_in_states]
        # print(stationary_probabilities)
        return stationary_probabilities

    #test of correctness of solution of a task that the lecturer gave me
    def test(self):
        matrix = [[0,6,0,0,0,0],
                  [0,0,6,0,0,0],
                  [0,0,0,6,0,0],
                  [0,0,0,0,6,0],
                  [0,0,0,0,0,6],
                  [6,0,0,0,0,0]]
        tests_num = 10000
        successful = 0
        for iteration in range(tests_num):
            sys_time = 0
            state = 0
            time_in_states = [0 for i in range(len(matrix))]
            while sys_time < 1:
                transition_times = [-1.0 / x * math.log(random.random()) if x != 0 else float("inf") for x in matrix[state]]
                transition_time = min(transition_times)
                next_state = transition_times.index(transition_time)
                time_in_states[state] += transition_time
                sys_time+=transition_time
                state = next_state
            if state == 0 or state == 1:
                successful += 1
        print(float(successful)/tests_num)

    #stationary probabilities of basic semi markov process graph, which are sum of stationary probabilities in additional graph
    def toSemiMarkovProcess(self, conditions = []):
        p_i = self.static_conditions() if conditions == [] else conditions
        stationary_probabilities = [0] * len(p_i)
        for i in range(len(p_i)):
            # defining which p_i probabilities in additional matrix add to corresponding base node total probability
            less_than_i = list(filter(lambda a: a <= i, self.base_nodes))
            related_node = max(less_than_i)
            stationary_probabilities[related_node]+=p_i[i]
        # getting rid of non-base cells with zero probability values
        stationary_probabilities = [round(j,4) for (i,j) in enumerate(stationary_probabilities) if i in self.base_nodes]
        return stationary_probabilities
