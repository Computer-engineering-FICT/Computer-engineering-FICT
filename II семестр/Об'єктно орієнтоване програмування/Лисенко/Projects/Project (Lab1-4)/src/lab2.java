/*
C5  = 1 => C = B^T
C7  = 5 => char
C11 = 0 => Обчислити суму найменших елементів кожного стовпця матриці
 */
public class lab2 {

    private void printMatrix(char[][]matrix, int n, int m) {
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                System.out.printf("%6d", (int) matrix[i][j]);
            }
            System.out.println();
        }
    }


    public static void main(String[] args) {
        Read in = new Read();
        System.out.print("number of lines   of matrix B = ");
        int n = in.readInt();
        System.out.print("number of columns of matrix B = ");
        int m = in.readInt();
        char[][] B = new char[n][m];

        System.out.print("1 - manual entry\n2 - random filling\nyour choice: ");
        int choice;
        boolean cycle = true;
        do {
            choice = in.readInt();
            if (choice == 1 || choice == 2){
                cycle = false;
            }
        } while(cycle);

        if (choice == 1) {
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < m; j++) {
                    System.out.print("element "+(i+1)+","+(j+1)+" = ");
                    B[i][j] = in.readChar();
                }
            }
        } else {
            System.out.print("max (to 65535) = ");
            char max = in.readChar();
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < m; j++) {
                    B[i][j] = (char) (Math.random() * (max + 1));
                }
            }
        }

        lab2 obj = new lab2();
        System.out.println("Matrix B:");
        obj.printMatrix(B, n, m);

        char[][] C = new char[m][n];
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                C[i][j] = B[j][i];
            }
        }
        System.out.println("Matrix C = B^T:");
        obj.printMatrix(C, m, n);

        int sum = 0;
        char term;
        for (int j = 0; j < n; j++) {
            term = C[0][j];
            for (int i = 1; i < m; i++) {
                    term = (char) Math.min(term, C[i][j]);
            }
            sum += term;
        }
        System.out.println("sum = " + sum);
    }
}
