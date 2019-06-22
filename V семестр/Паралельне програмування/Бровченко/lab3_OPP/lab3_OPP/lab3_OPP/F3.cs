using System;

namespace lab3
{
    public class F3
    {
    private Vector result;
    public Vector getResult()
    {
        return result;
    }

    private int N;

    public F3(int N)
    {
        this.N = N;
    }

    public void run()
    {
            Console.WriteLine("Task 3 start");
            Vector P = new Vector(N);
            Matrix MT = new Matrix(N), MR = new Matrix(N);
            result = MR.multiply(MT).multiply(P.sort());
            Console.WriteLine("Task 3 end");
    }
}

}
