using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;

namespace proLab5
{
    /**
 * Function 2
 * MD = (MA + MB)*(MA *MC)*(MB + MA)
 *
 */
    class F2
    {
    Matrix MA, MB, MC;
	Matrix result;
    public Thread t;
	String name;
	
	public F2(String name, ThreadPriority priority, Matrix ma, Matrix mb, Matrix mc) {
		this.MA = ma;
		this.MB = mb;
		this.MC = mc;
		this.name = name;
        t = new Thread(calc);
		t.Name = name;
        t.Priority = priority;
		t.Start();
        Console.WriteLine(t.Name + " started");
	}
	
	public void calc() {
		if (result == null) {
			Matrix MAB = MA.plus(MB);
			result = MAB.mul(MA.mul(MC)).mul(MAB) ;
		}
       result.saveMatrix("F2.txt");
       Console.WriteLine(t.Name + " ended.");
	}
    }
}
