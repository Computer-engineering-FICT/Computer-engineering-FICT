import time

class Profiler(object):
    def __enter__(self):
        self._startTime = time.time()

    def __exit__(self, type, value, traceback):
        with open(r"time my function.txt", "w") as f:
            f.write("Elapsed my time: {:.3f} sec".format(time.time() - self._startTime))
