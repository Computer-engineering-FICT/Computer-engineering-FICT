package Teor_ver_lab3;

/**
 * Created by l on 28.10.2017.
 */
public class Realise {

    private static double[][] arr = {
        {0.02, 0.03, 0.04},
        {0.03, 0.05, 0.06},
        {0.04, 0.06, 0.07},
        {0.06, 0.08, 0.09},
        {0.07, 0.1, 0.2}
    };

    private static double[] tableLittlePforX;
    private static double[] tableBigPforX;
    private static double Mx;
    private static double My;

    public static void forAll(){
        tableLittlePforX = new double[5];
        for (int i = 0; i < 5; i++) {
            double sum = 0.0;
            for (double d: arr[i]){
                sum += d;
            }
            tableLittlePforX[i] = sum;
        }

        tableBigPforX = new double[5];
        for (int i = 0; i < 5; i++){
            double sum = 0.0;
            int j = 0;
            while (j != i + 1){
                sum += tableLittlePforX[j];
                j++;
            }
            tableBigPforX[i] = sum;
        }
    }

    public static int[] createXandY (){
        double rX = Math.random();
        int x = 0;
        for (int i = 0; i < 5; i++){
            if (tableBigPforX[i] > rX){
                x = i + 1;
                break;
            }
        }
        double k = 1/tableLittlePforX[x - 1];
        double pY1 = arr[x-1][0] * k;
        double pY2 = arr[x-1][1] * k;
        double pY3 = 1 - pY1 - pY2;
        double[] tableLittlePforY = {pY1, pY2, pY3};

        double[] tableBigPforY = new double[3];
        for (int i = 0; i < 3; i++){
            double sum = 0.0;
            int j = 0;
            while (j != i + 1){
                sum += tableLittlePforY[j];
                j++;
            }
            tableBigPforY[i] = sum;
        }


        double rY = Math.random();
        int y = 0;
        for (int i = 0; i < 3; i++){
            if (tableBigPforY[i] > rY){
                if (i == 0) y = 5;
                if (i == 1) y = 7;
                if (i == 2) y = 10;
                break;
            }

        }

        int[] result = {x, y};
        return result;
    }

    public static double countMx(){
        Mx = 0.0;
        for (int i = 0; i < 5; i++){
            Mx += (i + 1) * tableLittlePforX[i];
        }
        return Mx;
    }

    public static double countMy(){
        int[] y = {5, 7, 10};
        My = 0.0;
        for (int i = 0; i < 3; i++){
            double sum = 0.0;
            for (int j = 0; j < 5; j++){
                sum += arr[j][i];
            }
            My += y[i] * sum;
        }
        return My;
    }

    public static double countDx(){
        double Dx = 0.0;
        for (int i = 0; i < 5; i++){
            Dx += tableLittlePforX[i] * Math.pow((i+1), 2);
        }
        return Dx - Math.pow(Mx, 2);
    }

    public static double countDy(){
        int[] y = {5, 7, 10};
        double Dy = 0.0;
        for (int i = 0; i < 3; i++){
            double sum = 0.0;
            for (int j = 0; j < 5; j++){
                sum += arr[j][i];
            }
            Dy += Math.pow(y[i], 2) * sum;
        }
        return Dy - Math.pow(My, 2);
    }

    public static double countCov(){
        double cov = 0.0;
        int[] y = {5, 7, 10};
        for (int i = 0; i < 5; i++) {
            for (int j = 0; j < 3; j++) {
                cov += arr[i][j] * (i + 1) * y[j];
                //System.out.println();
            }
        }
        return cov - (Mx * My);
    }

}
