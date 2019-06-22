package lab1;
import java.math.*;
public class Lab1 {
    static int arr[] = new int[8];
    static int X1[][] = new int[8][3];
    static double Xmin[] = new double[3];
    static double Xmax[] = new double[3];
    static double x0[] = new double[3];
    static double dx[] = new double[3];
    static double X2[][] = new double[8][3];
    
    // Возвращает значение ф-цыи отклика  ....
    public static double func(double q1, double q2, double q3){
        return 4*q1+5*q2+9*q3;
    }
    
    
    public static void main(String args[]){
        // Заполним Xmin и Xmax .....
        for (int j = 0; j < 3; j++){
            X1[0][j] = (int)(Math.random() * 20);
            Xmin[j] = X1[1][j];
            Xmax[j] = Xmin[j];
        }
        // Заполняем массив X1 и сравниваем элементы с Xmin и Xmax ......
        for (int j = 0; j < 3; j++){
            for (int i = 1; i < 8;i++){
                X1[i][j] = (int)(Math.random() * 20);
                if (X1[i][j] < Xmin[j]){
                    Xmin[j] = X1[i][j];
                }
                if (X1[i][j] > Xmax[j]){
                    Xmax[j] = X1[i][j];
                }
            }
        }
        // Заполняем массив arr используя ф-цыю описаную ранее - ф-цыя отклика ......
        for (int i = 0; i < 8; i++){
            arr[i] = (int)Math.floor(func(X1[i][0],X1[i][1],X1[i][2]));
        }
        
        for (int i = 0; i < 3; i++){
            x0[i] = (Xmax[i] + Xmin[i]) / 2;
            dx[i] = (Xmax[i] - Xmin[i]) / 2;
        }
        
        for (int i = 0; i < 8; i++){
            for (int j = 0; j < 3; j++){
                X2[i][j] = (X1[i][j] - x0[j]) / dx[j];
            }
        }
        System.out.println("#  |  X1   |   X2   |   X3   |   Y   |   _X1   |   _X2    |   _X3");
        System.out.println("---|------------------------------------------------------------------------------");
        for (int i = 0; i < 8; i++){
            System.out.println((i + 1) + "  |  " + X1[i][0] + "  |   " + X1[i][1] + "   |   " + X1[i][2] + "   |   " + arr[i] + "   |  " + X2[i][0] + "   |  " + X2[i][1] + "   |   " + X2[i][2]);
        }
        System.out.println("X0 |" + x0[0] + "   |   " + x0[1] + "  |  " + x0[2] + "  |  " + func(x0[0], x0[1], x0[2]));
        System.out.println("DX |" + dx[0] + "   |   " + dx[1] + "  |  " + dx[2]);
        
        /*for (int i = 0; i < 8; i++){
        	System.out.println(arr[i] - func(x0[0], x0[1], x0[2]));
        }*/
    }
}
