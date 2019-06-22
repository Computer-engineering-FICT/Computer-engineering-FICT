import java.util.Scanner;
import java.util.Random;
/**
 * Created by Андрей on 21.02.2017.
 * C5 = 6305 % 5 = 0
 * C7 = 6305 % 7 = 5
 * C11 = 6305 % 11 = 2
 *
 *
 * C5 = a * B, a = const
 * C7 = char
 * C11 = Обчислити суму найменших елементів кожного рядка матриці
 */
public class Lab2 {
    public static void main(String[] args) {
        int c5 = 6305 % 5; // = 0 множення на константу
        int c7 = 6305 % 7; // = 5 char
        int c11 = 6305 % 11; // = 2 Обчислити суму найменших елементів кожного рядка матриці


        char[][] matrix =   {{'a', 'b','f'},
                            {'c', 'd', 'r'},
                            {'j', 'i', 'y'},
                            {'t', 'k', 'u'}};


    /*
        int m = 3;
        int n = 4;

        char[][] matrix = new char[m][n];
        Random random = new Random();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                matrix[i][j] = (char) (random.nextInt(100));
            }
        }
*/

        boolean flag = true;
        int constant = 0;

        Scanner scan1 = new Scanner(System.in);
        System.out.println("Enter the constant:");
        if (scan1.hasNextInt()) {
            constant = scan1.nextInt();
        }
        else {
            flag = false;
            System.out.println("Constant dont`t integer");
        }

        char[][] newMatrix = newMatrix(matrix,constant);

        if (flag == true) {
            System.out.print("Matrix C:");
            for (int i = 0; i < newMatrix.length; i++) {
                System.out.println();
                System.out.println("-----------");
                for (int j = 0; j < newMatrix[0].length; j++) {
                    System.out.print(newMatrix[i][j] + " | ");
                }
            }
            System.out.println();
            System.out.println("-----------");


            System.out.println();

            System.out.println("Сума найменших елементів кожного рядка матриці:");
            System.out.println(Min(newMatrix) + " == " + ('a' + 'c' + 'i' + 'k') * constant);
        }
        else {
            System.out.println("Error");
        }

    }

    public static char[][] newMatrix(char[][] A, int constanta) {
        char[][] C = new char[A.length][A[0].length];
        for (int i = 0; i < C.length; i++)
            for (int j = 0; j < A[0].length; j++)
                C[i][j] = (char) (A[i][j] * constanta);
        return C;
    }

    public static int Min(char[][] A) {
        int result = 0;
        for (int i = 0; i < A.length; i++) {
            char tmp = A[i][0];
            for (int j = 1; j < A[0].length; j++) {

                if (A[i][j] < tmp) tmp = A[i][j];
            }
            result += tmp;


        }
        return (char) result;

    }
}