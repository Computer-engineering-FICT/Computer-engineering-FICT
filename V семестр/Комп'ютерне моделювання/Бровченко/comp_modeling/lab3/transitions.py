from math import exp


class System:

    def __init__(self, nodes: list, tasks_count=5):
        self.nodes = nodes
        self.count = tasks_count
        self.max_intense = max(self.nodes, key=lambda x: x.intense).intense
        self.max_intense = min(self.nodes, key=lambda x: x.intense).intense
        self.t = 1 / (3 * self.max_intense)
        # self.t = 0.0000840

        self.system_matrix = []

    def gen_matrix(self):
        for i, node in enumerate(self.nodes):
            if i == 0:
                self.system_matrix.append([self.count - node.capacity, node.capacity, 0])
            else:
                self.system_matrix.append([0, 0, node.capacity])
            self.system_matrix[i].append(self._cti(node))
            self.system_matrix[i].append(node.gen_transitions(self.t))
        return self.system_matrix

    def _cti(self, node):
        conn_indexes = [self.nodes.index(n) for n in node.conns]
        node_index = self.nodes.index(node)
        if node_index not in conn_indexes:
            return [node_index] + conn_indexes
        return conn_indexes


class Node:

    def __init__(self, name: str, tau=1, capacity=1):
        self.conns = []
        self.probs = []
        self.lambd = []
        self.trans = []

        self.intense = 1 / tau
        self.name = name
        self.capacity = capacity

    def add_conn(self, connection, probability: float):
        """
        add `connection` between Nodes\n
        Args:
            param1: Node to connect\n
            param2: probability of transition\n
        """
        self.conns.append(connection)
        self.probs.append(probability)

    def gen_transitions(self, t):
        general_intense = self.intense * len(self.probs)
        self.trans.append(exp(-general_intense * t))
        for probability in self.probs:
            transition = probability * \
                (self.intense/general_intense) * \
                (1 - exp(-general_intense * t))
            self.trans.append(transition)
        return self.trans


class ASystem(System):

    def __init__(self, nodes: list, tasks_count=5):
        self.nodes = nodes
        self.count = tasks_count

        self.max_intense = max(self.nodes, key=lambda x: x.intense).intense
        self.max_intense = min(self.nodes, key=lambda x: x.intense).intense

        self.system_matrix = []

    def gen_matrix(self):
        for i, node in enumerate(self.nodes):
            if i == 0:
                self.system_matrix.append([self.count - node.capacity, node.capacity, 0])
            else:
                self.system_matrix.append([0, 0, node.capacity])
            self.system_matrix[i].append(self._cti(node))
            self.system_matrix[i].append(node.gen_transitions())
        return self.system_matrix

    def _cti(self, node):
        conn_indexes = [self.nodes.index(n) for n in node.conns]
        return conn_indexes


class ANode:

    def __init__(self, name: str, tau=1, capacity=1):
        self.conns = []
        self.probs = []
        self.lambd = []
        self.trans = []

        self.intense = 1 / tau
        self.name = name
        self.capacity = capacity

    def add_conn(self, connection, probability: float):
        """
        add `connection` between Nodes\n
        Args:
            param1: Node to connect\n
            param2: probability of transition\n
        """
        self.conns.append(connection)
        self.probs.append(probability)

    def gen_transitions(self):
        for probability in self.probs:
            self.trans.append(probability * self.intense)
        return self.trans


cpu = ANode('CPU', 0.003, 1)
nb = ANode('north bridge', 0.02)
sb = ANode('south bridge', 0.04)
ram = ANode('RAM', 0.05)
cashe = ANode('CPU cashe', 0.09)
vp = ANode('VP', 0.1)
gp = ANode('GP', 0.01)
aud = ANode('Aud', 0.5)
kd = ANode('KD', 0.3)

# cpu connections
cpu.add_conn(nb, 0.7)
cpu.add_conn(cashe, 0.3)

# North Bridge connections
nb.add_conn(ram, 0.2)
nb.add_conn(sb, 0.3)
nb.add_conn(cpu, 0.2)
nb.add_conn(cashe, 0.1)
nb.add_conn(gp, 0.2)

# South Bridge connections
sb.add_conn(gp, 0.3)
sb.add_conn(vp, 0.2)
sb.add_conn(kd, 0.3)
sb.add_conn(nb, 0.1)
sb.add_conn(aud, 0.1)

# RAM connections
ram.add_conn(nb, 1.0)

# GP connections
gp.add_conn(nb, 1.0)

# audio contr connections
aud.add_conn(cpu, 1.0)

# VP connection
vp.add_conn(cpu, 1.0)

# cashe connection
cashe.add_conn(nb, 1.0)

# KD connection
kd.add_conn(sb, 1.0)

system = ASystem([cpu, nb, sb, ram, gp, aud, vp, cashe, kd], 5)
