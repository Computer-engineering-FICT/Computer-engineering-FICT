import java.util.Arrays;

public class Generator {

    public static void main(String[] args) {

        int n = 100;
        double p = 0.3;
        int c = 50000;
        double r;
        double[] PM = new double [n + 1];
        double[] SPM = new double [n + 1];
        int[] RM = new int[c];

        for(int i = 0; i < n + 1; i++)
            PM[i] = bernulli(i, n, p);

        for(int i = 0; i < n + 1; i++){
            for(int j = 1; j <= i; j++)
                SPM[i] += PM[j];
        }

        boolean flag = true;
        for(int i = 0; i < c; i++){
            do {
                r = Math.random();
                if (r > SPM[n]) flag = false;
            } while (!flag);
            for(int j = 0; j < n; j++)
                if ((r > SPM[j]) && (r < SPM[j+1]))
                    RM[i] = j;
        }

        //System.out.println(Arrays.toString(RM));

        double m, sg;
        double s1 = 0;

        for(int i = 0; i < c; i++)
            s1 += RM[i];
        m = s1 / (double) c;
        m++;
        System.out.println("Матожидание m = " + m);
        double s2 = 0;
        for(int i = 0; i < c; i++)
            s2 += Math.pow(RM[i] - s1 / (double) c, 2);
        sg = Math.pow(s2 / (double) c, 0.5);
        System.out.println("Среднее квадратическое отклонение = " + sg);


    }

    public static double bernulli(int k, int n, double p) {

        double Cmk, Pk, Pmk, P;

        Pk = Math.pow(p, k);
        Pmk = Math.pow(1 - p, n - k);
        Cmk = factorial(n)/(factorial(n - k)*factorial(k));
        P = Cmk * Pk * Pmk;
        return P;

    }

    public static double factorial(double a) {

        double r = 1;
        for(int i = 2; i <= a; i++)
            r *= i;
        return r;

    }

}
