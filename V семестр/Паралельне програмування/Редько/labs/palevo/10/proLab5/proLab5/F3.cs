using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace proLab5
{
    /**
     * Function 3
     * A = MAX(MB)*C
     */
    class F3
    {
    Matrix MB;
	Vector C;
	Vector result;
	public Thread t;
	String name;
	
	public F3(String name, ThreadPriority priority, Matrix mb, Vector c) {
		this.MB = mb;
		this.C = c;
		this.name = name;
        t = new Thread(calc);
        t.Name = name;
        t.Priority = priority;
        t.Start();
        Console.WriteLine(t.Name + " started");
        Thread.Sleep(10);
	}
	
	public void calc() {
		if (result == null) {
			result = C.mulScalar(MB.getMax());
		}
		result.saveVector("F3.txt");
        Console.WriteLine(t.Name + " ended.");
	}
    }
}
