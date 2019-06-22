from MarkovProcesses import *

G = SemiMarkovProcess([[2,2,2],
                       [2,0,0.1],
                       [0,0.01,0.5]])
F = ContiniousMarkovProcess([[2,2,2],
                             [2,0,0.1],
                             [0,0.01,0.5]])
F.test()
print("Stationary probabilities of semi markov process: ".ljust(65) + str(G.stationary_probabilities()))
print("Simulation of semi markov process: ".ljust(65) + str(G.simulate(10000)))
print("\nStationary probabilitiesof identical continious markov process: ".ljust(65) + str(F.static_conditions()))