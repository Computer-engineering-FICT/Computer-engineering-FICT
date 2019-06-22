package labs.lab1_r;

/**
 * Created by Alexander Serbin on 11/22/2015.
 */

public class Berlecamp_Test {
    //Змінні тесту лінійної складності
    static int[] b, c, t, s;
    static int N, L, m;
    //Метод тесту лінійної складності (довжина вибірки, масив вибірки)
    public static int test(String choice){
        b = new int[choice.length()];
        c = new int[choice.length()];
        t = new int[choice.length()];
        s = new int[choice.length()];
        for (int i = 0; i < choice.length(); i++) {
            b[i] = c[i] = t[i] = 0;
            s[i] = Integer.parseInt(String.valueOf(choice.charAt(i)));
        }
        b[0] = c[0] = 1;
        N = L = 0;
        m = -1;
        return runTest();
    }
    //Алгоритм Berlicamp-Massey
    private static int runTest()
    {
        int d;
        while (N < s.length)
        {
            d = 0;
            for (int i = 0; i <= L; i++)
                d += s[N-i] * c[i];
            d = d % 2;

            if (d != 0)
            {
                t = c.clone();
                for (int i = 0; i <= s.length + m - 1 - N; i++)
                    c[N - m + i] = (byte)(c[N - m + i] ^ b[i]);
                if (L <= (N / 2))
                {
                    L = N + 1 - L;
                    m = N;
                    b = t.clone();
                }
            }
            N++;
        }
        return L;
    }

}
