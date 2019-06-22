from lab1.simul_smo import *


class SF_SMO(SMO):
    def __init__(self, mu, lamb):
        super().__init__(mu, lamb)
        self.ro = self.lamb / self.mu

    def compute_task(self):
        if len(self.queue) != 0:
            result = self.get_queue()[0]
            if result.set_time_react == 0:
                result.set_time_react(self.full_time - result.time_started)

            for tsk in self.get_queue():
                if result.get_time() < tsk.get_time():
                    result = tsk

            self.set_time_to_next_computing(result.get_time())
            self.get_queue().remove(result)
            result.set_time_computed(result.get_time_started() + result.get_time())
            self.get_archive().append(result)
            #print('task = '+str(result.id)+' time = '+str(result.get_time())+' time in sys = '+str(result.count_time_in_system()))

        else:
            self.set_full_time(self.get_full_time() + self.get_time_to_next_gen())
            self.generate_task()
            self.compute_task()

    def generate_task(self):
        #time = 1 / (self.mu * (1 - self.ro))
        #time = -1 / self.mu * log(random())
        time = 1/(self.mu - self.lamb)
        self.count += 1
        new_task = Task(self.count, time)
        new_task.set_time_started(self.full_time)
        self.queue.append(new_task)
        self.time_to_next_gen = - 1 / self.lamb * log(random())
        return

    def calculate_time_of_reaction(self):
        r = self.calculate_time_in_system() - self.mu
        rez = 0
        for i in self.archive:
            rez += uniform(r/2, r*1.5)
        return rez / len(self.archive)
