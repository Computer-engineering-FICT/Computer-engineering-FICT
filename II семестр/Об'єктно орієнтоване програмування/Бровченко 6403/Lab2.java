public class Lab2 {
    public static void main(String[] args) {
        double A[][] = {{4, 7, 7},
                        {5, 1, 8},
                        {4, 8, 4},
                        {4, 5, 3},
                        {2, 4, 8}};
        double B[][] = {{8, 1, 4},
                        {2, 7, 1},
                        {4, 7, 1},
                        {7, 9, 6},
                        {4, 5, 6}};
        double S = 0;

        if (A.length == B.length) {
            int maxl = 0;

            for (int i = 0; i < A.length; i++) {
                if (A[i].length != B[i].length) System.out.println("Невірні вхідні дані!"); return;
            }

            for (int i = 0; i < A.length; i++) {
                if (A[i].length > maxl) maxl = A[i].length;
            }
            double C[][] = new double[A.length][maxl];

            for (int i = 0; i < A.length; i++) {
                for (int j = 0; j < A[i].length; j++) {
                    C[i][j] = (byte) A[i][j] ^ (byte) B[i][j];
                }
            }

            System.out.println("Матриця С:");
            for (int i = 0; i < C.length; i++) {
                for (int j = 0; j < C[i].length; j++) {
                    System.out.print(C[i][j] + " ");
                }
                System.out.println(" ");
            }

            for (int i = 0; i < C.length; i++) {
                double min = C[i][0];
                for (int j = 1; j < C[i].length; j++)
                    if (C[i][j] < min) min = C[i][j]; S += min;
            }
            System.out.println("\nСума найменших елементів у кожному рядку дорівнює: " + S);
        }
        else System.out.println("Матриці різного розміру!");
    }
}

