using System;

namespace lab3
{
    public class F1
    {
    private Vector result;
    public Vector getResult()
    {
        return result;
    }

    private int N;

    public F1(int N)
    {
        this.N = N;
    }

    public void run()
    {
            Console.WriteLine("Task 1 start");
            Vector A = new Vector(N), B = new Vector(N);
            Matrix MA = new Matrix(N), MC = new Matrix(N);
            long e = 3;
            result = A.sub(MA.multiply(MC).multiply(B.multiply(e)));
            Console.WriteLine("Task 1 end");
    }
}

}
