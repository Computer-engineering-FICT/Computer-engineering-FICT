public class Lab1 {
    public static void main(String[] args) {
        long i, j;
        // встановлення константи С та суми S
        double S=0;
        int C=0, a=0, n=5, b=1, m=5;
        // перевірка границь сумування
        if ((a<=n)&&(b<=m)){
            for (i=a; i<=n; i++)
            if (i==C) {
                // перевірка на умову ділення на 0
                System.out.println("Ділення на 0");
                return;
            }
            else {
                for (j=b; j<=m; j++)
                S += (double) (i+j)/(i-C);
            }
            // виведення результату
            System.out.println("S = " + S);
        }
        else System.out.print("Помилка в границях сумування");
    }
}