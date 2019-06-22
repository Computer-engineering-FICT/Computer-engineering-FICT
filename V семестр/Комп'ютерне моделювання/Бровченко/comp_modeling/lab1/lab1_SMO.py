from math import log, pow
from random import random, uniform

k1 = -1
k2 = -6
k3 = -3
k4 = 0
k5 = 4

t1 = 3
t2 = 4


class Task():
    def __init__(self, id: int, time: float):
        self.id = id
        self.time = time
        self.time_started = float()
        self.time_computed = float()
        self.time_in_system = float()
        self.timeall = time
        self.time_react = float()

    def count_time_in_system(self):
        self.time_in_system = (self.time_computed - self.time_started)*uniform(1, 3)
        return self.time_in_system

    def get_time(self):
        return self.time

    def get_timeall(self):
        return self.timeall

    def set_time_started(self, t: float):
        self.time_started = t

    def set_time_computed(self, t: float):
        self.time_computed = t

    def set_time(self, t: float):
        self.time = t

    def get_time_started(self):
        return self.time_started

    def get_time_react(self):
        return self.time_react

    def set_time_react(self, t):
        self.time_react = t


class SMO():
    def __init__(self, mu, lamb):
        self.mu = mu
        self.lamb = lamb
        self.count = 0
        self.queue = []
        self.archive = []
        self.time_to_next_gen = float()
        self.time_to_next_computing = float()
        self.full_time = 0
        self.iterations = 10000

    def compute_task(self):
        pass

    def start(self):
        while self.get_count() < self.iterations:
            if self.get_time_to_next_gen() < self.get_time_to_next_computing():
                time_to_next_operation = self.get_time_to_next_gen()
                self.set_full_time(self.get_full_time() + time_to_next_operation)

                self.set_time_to_next_computing(self.get_time_to_next_computing() - time_to_next_operation)
                self.generate_task()
            else:
                time_to_next_operation = self.get_time_to_next_computing()
                self.set_full_time(self.get_full_time() + time_to_next_operation)

                self.set_time_to_next_gen(self.get_time_to_next_gen() - time_to_next_operation)
                self.compute_task()

        var1 = self.calculate_time_in_system()
        try:
            var2 = self.calculate_dispersion(var1)
        except:
            var2 = self.calculate_dispersion()

        var3 = abs(self.calculate_time_of_reaction())
        var4 = self.calculate_ratio()
        var5 = self.calculate_relevance()
        Func = k1 * var1 + k2 * var2 + k3 * var3 + k4 * var4 + k5 * var5

        print('average time in system = {v1}\n'
              'average dispersion = {v2}\n'
              'average time of reaction = {v3}\n'
              'average ratio= {v4}\n'
              'summary relevance = {v5}\n'
              'Result Function = {F}\n'
              '==================================================='
              .format(v1=var1, v2=var2, v3=var3, v4=var4, v5=var5, F=Func))

    def generate_task(self):
        #time = 1 / (self.mu * (1 - self.ro))
        time = -1 / self.lamb * log(random())
        self.count += 1
        new_task = Task(self.count, time)
        new_task.set_time_started(self.full_time)
        self.queue.append(new_task)
        self.time_to_next_gen = - 1 / self.lamb
        return

    def calculate_time_in_system(self):
        rez = 0
        for tsk in self.archive:
            rez += tsk.count_time_in_system()
        return rez / len(self.archive)

    def calculate_dispersion(self, average_time_in_system):
        rez = 0
        for tsk in self.archive:
            rez += pow(tsk.count_time_in_system() - average_time_in_system/2, 2)
        return rez / len(self.archive)

    def calculate_time_of_reaction(self):
        rez = 0
        for tsk in self.archive:
            rez += tsk.time_react
        return rez / len(self.archive)

    def calculate_ratio(self):
        return len(self.archive) / self.count

    def calculate_relevance(self):
        """aktual`nost`"""
        res = 0

        for tsk in self.archive:
            if tsk.count_time_in_system() <= t1:
                res += 1
            if (tsk.count_time_in_system() > t1) and (tsk.count_time_in_system() < t1 + t2):
                res += (tsk.count_time_in_system() - t1) / t2
        return res

    def get_full_time(self):
        return self.full_time

    def get_count(self):
        return self.count

    def get_queue(self):
        return self.queue

    def get_archive(self) -> list:
        return self.archive

    def get_time_to_next_gen(self):
        return self.time_to_next_gen

    def get_time_to_next_computing(self):
        return self.time_to_next_computing

    def set_full_time(self, t):
        self.full_time = t

    def set_time_to_next_gen(self, t: float):
        self.time_to_next_gen = t

    def set_time_to_next_computing(self, t: float):
        self.time_to_next_computing = t

