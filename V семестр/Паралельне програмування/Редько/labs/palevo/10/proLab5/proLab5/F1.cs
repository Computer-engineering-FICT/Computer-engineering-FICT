using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace proLab5
{
    /**
 * Function 1
 * D = SORT(A) + SORT(B) - SORT(C) 
 */
    class F1 {
	Vector A, B, C;
	Vector result;
    public Thread t;
	String name;
	
	public F1(String name, ThreadPriority priority, Vector a, Vector b, Vector c) {
		this.A = a;
		this.B = b;
		this.C = c;
		this.name = name;
        t = new Thread(calc);
		t.Name = name;
        t.Priority = priority;
		t.Start();
        Console.WriteLine(t.Name + " started");
        Thread.Sleep(0);
	}
	
	public void calc() {
		if (result == null)
			result = Vector.sort(A).plus(Vector.sort(B)).minus(Vector.sort(C));
		result.saveVector("F1.txt");
        Console.WriteLine(t.Name + " ended.");
	}
}
}
