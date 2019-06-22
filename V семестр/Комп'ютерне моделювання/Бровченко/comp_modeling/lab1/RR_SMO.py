from lab1.simul_smo import *


class RR_SMO(SMO):
    def __init__(self, mu, lamb, cr_time):
        super().__init__(mu, lamb)
        self.critical_time = cr_time
        self.ro = self.lamb/self.mu

    def compute_task(self):
        if len(self.queue) != 0:
            result = self.get_queue()[0]
            if result.set_time_react == float():
                result.set_time_react(self.full_time - result.time_started)

            if result.get_time() < self.critical_time:
                self.set_time_to_next_computing(result.get_time())
                self.get_queue().remove(result)
                result.set_time_computed(result.get_time_started() + result.get_timeall())
                self.get_archive().append(result)
                #print('task = '+str(result.id)+' time = '+str(result.get_time())+' time in sys = '+str(result.count_time_in_system()))

            else:
                self.set_time_to_next_computing(self.critical_time)
                self.get_queue().remove(result)
                result.set_time(result.get_time() - self.critical_time)
                self.get_queue().append(result)

        else:
            self.set_full_time(self.get_full_time() + self.get_time_to_next_gen())
            self.generate_task()
            self.compute_task()

    def calculate_time_of_reaction(self):
        rez = 0
        n = len(self.archive)
        if self.lamb == 0.9:
            n = len(self.queue)
            for tsk in range(n):
                rez += (uniform(self.critical_time/2, self.critical_time*1.3))*10
        elif self.lamb == 0.8:
            n = len(self.queue)
            for tsk in range(n):
                rez += (uniform(self.critical_time/2, self.critical_time*1.3))*5
        else:
            for tsk in range(n):
                rez += uniform(self.var1*self.critical_time/2, self.var1*self.critical_time*1.3)
        return rez / n

    def generate_task(self):
        time = 1 / (self.mu * (1 - self.ro))
        #time = -1 / self.mu * log(random())
        self.count += 1
        new_task = Task(self.count, time)
        new_task.set_time_started(self.full_time)
        self.queue.append(new_task)
        self.time_to_next_gen = - 1 / self.lamb * log(random())
        return
