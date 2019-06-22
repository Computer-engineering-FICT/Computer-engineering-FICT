package main.java.com.yUvOsIl.lab2;


public class Lab2
{
    public static void main(String[] args)
    {
        int c5 = 5318 % 5; // =3 пряма сума
        int c7 = 5318 % 7; // =5 char
        int c11 = 5318 % 11; // =5 Обчислити суму найбільших елементів в рядках матриці з непарними номерами та найменших елементів в рядках матриці з парними номерами

        char[][] matrix1 = {{'a', 'b','f'}, {'c', 'd', 'r'}, {'j', 'i', 'y'},{'t', 'k', 'u'}};
        char[][] matrix2 = {{'e', 'f', 'v'}, {'g', 'h', 't'}};
        char[][] newMatrix = newMatrix(matrix1, matrix2);
        for (char[] chars:newMatrix)
        {
            for (char c:chars)
                System.out.print(c+" ");
            System.out.println();
        }
        System.out.println();

        System.out.println("Сума найбільших елементів в рядках матриці matrix1 з непарними номерами:");
        System.out.println(Max(matrix1)+" == "+('r'+'u'));

        System.out.println("Сума найменьших елементів в рядках матриці matrix1 з парними номерами:");
        System.out.println(Min(matrix1)+" == "+('a'+'i'));
    }

    public static char[][] newMatrix(char[][] A, char[][] B)
    {
        char[][] C = new char[A.length+B.length][A[0].length+B[0].length];
        for (int i = 0; i < C.length; i++)
            for (int j = 0; j < A[0].length; j++)
                C[i][j] = (i < A.length)? A[i][j]:'0';
        for (int i = 0; i < C.length; i++)
            for (int j = A[0].length; j < C[0].length; j++)
                C[i][j] = (i > (A.length-1))? B[i-A.length][j-A[0].length]:'0';
        return C;
    }

    public static char[][] XOR(char[][] A, char[][] B)
    {
        if (A.length != B.length || A[0].length != B[0].length) return null;

        char[][] C = new char[A.length][A[0].length];
        for (int i = 0; i < A.length; i++)
            for (int j = 0; j < A[0].length; j++)
            {
                C[i][j] = (char)(A[i][j]^B[i][j]);
            }
        return C;
    }

    public static int Max(char[][] A)
    {
        int result = 0;
        int  max;
        for (int i = 1; i < A.length; i += 2)
        {
            max = A[i][0];
            for (int j = 1 ; j < A[0].length; j++)
            {
                max = (max < A[i][j])? A[i][j] : max;
            }
            result += max;
        }
        return (char) result;
    }

    public static int Min(char[][] A)
    {
        int result = 0;
        int  min;
        for (int i = 0; i < A.length; i += 2)
        {
            min = A[i][0];
            for (int j = 1 ; j < A[0].length; j++)
            {
                min = (min > A[i][j])? A[i][j] : min;
            }
            result += min;
        }
        return (char) result;

    }
}