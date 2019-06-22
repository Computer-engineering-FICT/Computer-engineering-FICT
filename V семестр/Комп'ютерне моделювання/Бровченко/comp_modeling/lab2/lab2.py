import math as m
import random as r
import time
ct = time.time()
T = 100000
S = 1000000
P = 9
A = 5

petri_xtime = [0.003, 0.03, 0.01, 0.05, 0.02, 0.04, 0.3, 0.1, 0.1]
#petri_xtime = [3, 30, 10, 50, 20, 40, 300, 100, 100]
petri_id = ['Процесор', 'кеш', 'Граф.Проц.', 'Память', 'Пн.Міст.', 'Пд.Міст', 'Конт.Диску', 'Конт.Аудио', 'Конт.Видео']
# petri_switch = [[0.16667, 0.16666, 0.16667, 0.16667, 0.16666, 0.16667],
#                 [0.16667, 0.16666, 0.16667, 0.16667, 0.16666, 0.16667],
#                 [0.16667, 0.16666, 0.16667, 0.16667, 0.16666, 0.16667],
#                 [0.16667, 0.16666, 0.16667, 0.16667, 0.16666, 0.16667],
#                 [0.16667, 0.16666, 0.16667, 0.16667, 0.16666, 0.16667],
#                 [0.16667, 0.16666, 0.16667, 0.16667, 0.16666, 0.16667]]
petri_switch = [[0, 0.7, 0, 0, 0.3, 0, 0, 0, 0],
                [0, 0, 0, 0, 1, 0, 0, 0, 0],
                [0, 0, 0, 0, 1, 0, 0, 0, 0],
                [0, 0, 0, 0, 1, 0, 0, 0, 0],
                [0.2, 0.1, 0.2, 0.2, 0, 0.3, 0, 0, 0],
                [0, 0, 0, 0, 0.3, 0, 0.1, 0.3, 0.3],
                [0, 0, 0, 0, 0, 1, 0, 0, 0],
                [1, 0, 0, 0, 0, 0, 0, 0, 0],
                [1, 0, 0, 0, 0, 0, 0, 0, 0]]
petri_dic = [{petri_id[j]:petri_switch[i][j] for j in range(P)} for i in range(P)]


class Petri:
    def __init__(self, xtime, pid, switchdic):
        self.time = None
        self.xtime = xtime
        self.pid = pid
        self.switchpid = []
        self.switch = []
        self.dic_to_id(switchdic)
        self.queue = []
        self.processing = []
        self.life = []
        self.ptime = 0

    def dic_to_id(self, dic):
        for i in dic.items():
            self.switchpid.append(i[0])
            self.switch.append(i[1] + self.switch[-1] if self.switch else i[1])

    def start_process(self, tm):
        self.life.append(['q', tm - self.ptime, self.ptime, tm])
        action = self.queue.pop(0)
        action.q_to_p(self.pid, tm)
        self.processing.append(action)
        self.ptime = tm
        self.time = tm - (1 / self.xtime) * m.log(r.random())

    def end_process(self):
        action = self.processing.pop()
        self.life.append(['p_' + action.aid, self.time - self.ptime, self.ptime, self.time])
        action.p_to_q(self.pid, self.time)
        self.random_switch(action)
        self.ptime = self.time
        self.time = None

    def random_switch(self, action):
        rr = r.random()
        for i in range(len(self.switch)):
            if self.switch[i] > rr:
                for j in list_petri:
                    if j.pid == self.switchpid[i]:
                        j.queue.append(action)
                        break
                break


class Action:
    def __init__(self, aid):
        self.aid = aid
        self.life = []
        self.start_time = 0

    def q_to_p(self, pid, t):
        self.life.append(["q_" + pid, t - self.start_time, self.start_time, t])
        self.start_time = t

    def p_to_q(self, pid, t):
        self.life.append(["p_" + pid, t - self.start_time, self.start_time, t])
        self.start_time = t


def sortby_time(pet):
    return pet.time


list_petri = [Petri(petri_xtime[i], petri_id[i], petri_dic[i]) for i in range(P)]
list_action = [Action(str(i + 1)) for i in range(A)]
for i in range(P):
    try:
        list_petri[i].queue.append(list_action[i])
    except: pass


t = 0
s = 0
while t < T and s < S:
    for i in list_petri:
        if i.queue and not i.processing:
            i.start_process(t)
    sp = []
    for i in list_petri:
        if i.time:
            sp.append(i)
    sp.sort(key=sortby_time)
    petri = sp[0]
    t = petri.time
    s += 1
    petri.end_process()

print("Загруженность сетей Петри :")
#print("ID сети Петри | Частота |  Простой  |", " | ".join([" Задача №{} ".format(i + 1) for i in range(A)]))
print("ID сети Петри | Частота     |  Простой          | Завантаженість ")
for i in list_petri:
    statistic = [0 for l in range(A + 1)]
    for j in i.life:
        if j[0] == "q":
            statistic[0] += j[1] / t
        else:
            statistic[int(j[0].split("_")[1])] += j[1] / t

#    print("{:<14}|{:<9}|".format(i.pid, i.xtime), " |  ".join("{:>10%}".format(i) for i in statistic))
    print("{:<9}    |  {:<9}  |  {:<9}  |  {:<9}".format(i.pid, i.xtime, statistic[0]*100, 100 - statistic[0]*100 ))

#print("\n\nВыполнение задач :")
#print("ID задачи |", "|".join(["Выполнение на {0:<5}| Ожидание на {0:<5} ".format(i.pid) for i in list_petri]))
#for i in list_action:
#    statistic = [0 for l in range(P * 2)]
#    for j in i.life:
#        for k in list_petri:
#            if k.pid == j[0].split("_")[1]:
#                statistic[list_petri.index(k) * 2 if j[0][0] == 'p' else list_petri.index(k) * 2 + 1] += j[1] / t
#    print("{:<10}|    ".format(i.aid), "       |      ".join("{:>10%}".format(i) for i in statistic))
#print(time.time() - ct)
#print(t)
