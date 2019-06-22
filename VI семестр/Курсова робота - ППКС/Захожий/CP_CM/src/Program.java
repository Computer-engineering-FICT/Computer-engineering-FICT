/*********************************
 *            ПРО-2              *
 * Курсовая работа. Система с ОП *
 * MA = (MX * MC) * ME - MM * MD *
 *  Захожий Игорь, группа ИВ-73  *
 *          06.05.2010           *
 *********************************/

import java.util.Scanner;

public class Program {

    public static void main(String[] args) {
        int N;
        int P;
        int H;
        Scanner input = new Scanner(System.in);
        System.out.println("Please, enter the count of threads:");
        System.out.print(">> ");
        P = input.nextInt();
        System.out.println("Please, enter the size of matrixes:");
        System.out.print(">> ");
        N = input.nextInt();
        if (N < P) {
            P = N;
        }
        H = N / P;
        SynchronizationMonitor synchronizationMonitor = new SynchronizationMonitor(P);
        DataMonitor dataMonitor = new DataMonitor();
        Matrix MX = new Matrix(N);
        Matrix MM = new Matrix(N);
        Matrix MA = new Matrix(N);
        for (int i = 0; i < P; i++) {
            CalcThread Ti = new CalcThread(i, synchronizationMonitor, dataMonitor, N, P, H, MX, MM, MA);
            Ti.start();
        }
    }

}
