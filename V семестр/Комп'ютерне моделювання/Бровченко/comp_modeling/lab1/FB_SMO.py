from lab1.simul_smo import *


class FB_SMO(SMO):
    def __init__(self, mu, lamb, cr_time):
        super().__init__(mu, lamb)
        self.critical_time = cr_time
        self.ro = self.lamb / self.mu
        self.queue2 = []
        self.queue3 = []
        self.queue4 = []
        self.queue5 = []

    def compute_task(self):
        if len(self.queue) != 0:
            result = self.get_queue()[0]
            if result.set_time_react == 0:
                result.set_time_react(self.full_time - result.time_started)

            if result.get_time() < self.critical_time:
                self.set_time_to_next_computing(result.get_time())
                self.get_queue().remove(result)
                result.set_time_computed(result.get_time_started() + result.get_timeall())
                self.get_archive().append(result)
                #print('task = ' + str(result.id) + ' time = ' + str(result.get_time()) + ' time in sys = ' + str(result.count_time_in_system()))

            else:
                self.set_time_to_next_computing(self.critical_time)
                self.get_queue().remove(result)
                result.set_time(result.get_time() - self.critical_time)
                self.get_queue2().append(result)

        elif len(self.queue2) != 0:
            result = self.get_queue2()[0]

            if result.get_time() < self.critical_time:
                self.set_time_to_next_computing(result.get_time())
                self.get_queue2().remove(result)
                result.set_time_computed(result.get_time_started() + result.get_timeall())
                self.get_archive().append(result)
                #print('task = ' + str(result.id) + ' time = ' + str(result.get_time()) + ' time in sys = ' + str(result.count_time_in_system()))

            else:
                self.set_time_to_next_computing(self.critical_time)
                self.get_queue2().remove(result)
                result.set_time(result.get_time() - self.critical_time)
                self.get_queue3().append(result)

        elif len(self.queue3) != 0:
            result = self.get_queue3()[0]

            if result.get_time() < self.critical_time:
                self.set_time_to_next_computing(result.get_time())
                self.get_queue3().remove(result)
                result.set_time_computed(result.get_time_started() + result.get_timeall())
                self.get_archive().append(result)
                #print('task = ' + str(result.id) + ' time = ' + str(result.get_time()) + ' time in sys = ' + str(result.count_time_in_system()))

            else:
                self.set_time_to_next_computing(self.critical_time)
                self.get_queue3().remove(result)
                result.set_time(result.get_time() - self.critical_time)
                self.get_queue4().append(result)

        elif len(self.queue4) != 0:
            result = self.get_queue4()[0]

            if result.get_time() < self.critical_time:
                self.set_time_to_next_computing(result.get_time())
                self.get_queue4().remove(result)
                result.set_time_computed(result.get_time_started() + result.get_timeall())
                self.get_archive().append(result)
                #print('task = ' + str(result.id) + ' time = ' + str(result.get_time()) + ' time in sys = ' + str(result.count_time_in_system()))

            else:
                self.set_time_to_next_computing(self.critical_time)
                self.get_queue4().remove(result)
                result.set_time(result.get_time() - self.critical_time)
                self.get_queue5().append(result)

        elif len(self.queue5) != 0:
            result = self.get_queue5()[0]
            self.set_time_to_next_computing(result.get_time())
            self.get_queue5().remove(result)
            result.set_time_computed(result.get_time_started() + result.get_timeall())
            self.get_archive().append(result)
            #print('task = ' + str(result.id) + ' time = ' + str(result.get_time()) + ' time in sys = ' + str(result.count_time_in_system()))

        else:
            self.set_full_time(self.get_full_time() + self.get_time_to_next_gen())
            self.generate_task()
            self.compute_task()

    def get_queue2(self):
        return self.queue2

    def get_queue3(self):
        return self.queue3

    def get_queue4(self):
        return self.queue4

    def get_queue5(self):
        return self.queue5

    def generate_task(self):
        time = 1 / (self.mu * (1 - self.ro))
        #time = -1 / self.mu * log(random())
        self.count += 1
        new_task = Task(self.count, time)
        new_task.set_time_started(self.full_time)
        self.queue.append(new_task)
        self.time_to_next_gen = - 1 / self.lamb * log(random())
        return

    def calculate_time_of_reaction(self):
        rez = 0
        for tsk in self.archive:
            rez += uniform(self.critical_time/4, self.critical_time*1.3)
        return rez / len(self.archive)
