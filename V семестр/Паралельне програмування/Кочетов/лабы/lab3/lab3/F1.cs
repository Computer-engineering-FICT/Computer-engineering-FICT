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
            Vector A = new Vector(N), B = new Vector(N), D = new Vector(N);
            Matrix MA = new Matrix(N), ME = new Matrix(N);
            result = MA.multiply(ME).multiply(A).sum(B).sum(D);
            Console.WriteLine("Task 1 end");
    }
}

}
