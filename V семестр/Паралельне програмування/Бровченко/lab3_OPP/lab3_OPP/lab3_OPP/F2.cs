using System;

namespace lab3
{
    public class F2
    {
    private Matrix result;
    public Matrix getResult()
    {
        return result;
    }

    private int N;

    public F2(int N)
    {
        this.N = N;
    }

    public void run()
    {
            Console.WriteLine("Task 2 start");
            Matrix MF = new Matrix(N), MG = new Matrix(N);
            long k = 3;
            result = MG.multiply(MF.multiply(k));
            Console.WriteLine("Task 2 end");
    }
}

}
