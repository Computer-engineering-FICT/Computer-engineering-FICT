from threading import Thread
from F1 import F1
from F2 import F2
from F3 import F3

N = 100

print 'Lab 7 start\n'
f1, f2, f3 = F1(N), F2(N), F3(N)
t1, t2, t3 = Thread(target = f1.run), Thread(target = f2.run), Thread(target = f3.run)
t1.start()
t2.start()
t3.start()
t1.join()
t2.join()
t3.join()
print(f1.result)
print(f2.result)
print(f3.result)
print '\nLab 7 end\n'
print 'Press Enter...'
raw_input()