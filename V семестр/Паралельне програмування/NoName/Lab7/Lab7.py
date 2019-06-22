import threading
import Func1
import Func2
import Func3

def writer():
	Lock.acquire();
	for x in range(1,10):
		print(x)
	Lock.release()

threadLock = threading.Lock()
func1 = Func1.Function1(3, threadLock)
func2 = Func2.Function2(4, threadLock)
func3 = Func3.Function3(5, threadLock)

#t1 = threading.Thread(target=func1.StartOfFunction());
#t2 = threading.Thread(target=func2.StartOfFunction());
#t3 = threading.Thread(target=func3.StartOfFunction());

#t1.start()
#t2.start()
#t3.start()

func1.start()
func2.start()
func3.start()

