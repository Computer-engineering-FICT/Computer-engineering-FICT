public class Main {

    public static void main(String[] args) {

        int i, j, k;
        //Ввід матриць
        long[][] array_A = {{2, 3, 5, 4,3},
                            {8, 18, 91, -6,3},
                            {4, 5, -8, 13,3},
                            {9, 4, 3, -10,3}};


        long[][] array_B = {{5, -3, 15, 0},
                            {2, 9, 1, 6},
                            {9, -5, -7, 3},
                            {-1, 42, 36, -1},
                            {-1, 42, 36, -91}};


        //Перевірка матриць
        int l = array_A[0].length;
        for (i = 0; i < array_A.length; i++) {
            if (l != array_A[i].length) {
                System.out.println("В матриці A в рядках різна кількість елементів!");
                return;
            }
        }
        l = array_B[0].length;
        for (i = 0; i < array_B.length; i++) {
            if (l != array_B[i].length) {
                System.out.println("В матриці B в рядках різна кількість елементів!");
                return;
            }
        }
        if (array_A[0].length != array_B.length) {
            System.out.println("В матриці A кількість стовпців не дорівнює кількості рядків у матриці B. Добуток неможливо обчислити");
            return;
        }
        //Перемножування матриць
        int n = array_A.length;//кть рядків A
        int m = array_A[0].length;//кть стовпців А
        int q = array_B[0].length;//кть стовпців B
        long [][]array_C = new long[n][q];
            for (i = 0; i < n; i++) {
                for (j = 0; j < q; j++) {
                    long s = 0;
                    for (k = 0; k < m; k++) {
                        s += array_A[i][k] * array_B[k][j];
                    }
                    array_C[i][j] = s;
                }
            }
        //Вивід С
        System.out.println("Матриця С:");
        for(i=0;i<n;i++) {
            for (j = 0; j < q; j++) {
                System.out.print(String.format("%-10s", Long.toString(array_C[i][j])));
            }
            System.out.println();
        }

        //Дія над C
        long [] maximal_in_string = new long [array_C.length];
        int Sum = 0;
            for (i = 0; i < n; i++) {
                for (j = 0; j < q; j++) {
                    if (array_C[i][j] >= maximal_in_string[i]) {
                        maximal_in_string[i] = array_C[i][j];
                    }
                }
            }

            for (i = 0; i < array_C.length; i++) {
                Sum += maximal_in_string[i];
            }
            System.out.println("Сума найбільших елементів кожного рядка матриці: " + Sum);
    }
}
