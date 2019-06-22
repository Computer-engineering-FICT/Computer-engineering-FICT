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
            Vector S = new Vector(N);
            Matrix MO = new Matrix(N), MP = new Matrix(N), MR = new Matrix(N);
            result = MO.multiply(MP).multiply(S).sum(MR.multiply(S.sort()));
            Console.WriteLine("Task 3 end");
    }
}

}
