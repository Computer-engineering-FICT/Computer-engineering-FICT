package Teor_ver_lab3;

/**
 * Created by l on 29.10.2017.
 */
public class Main {
    public static void main(String[] args) {
        int[] arrX = new int[5000];
        int[] arrY = new int[5000];
        Realise.forAll();
        for (int i = 0; i < 5000; i++) {
            int[] xy = Realise.createXandY();
            arrX[i] = xy[0];
            arrY[i] = xy[1];
        }

        System.out.println("            Теор. значения характеристик: ");
        double Mx =  Realise.countMx();
        double My =  Realise.countMy();
        double Dx =  Realise.countDx();
        double Dy =  Realise.countDy();
        double sigmaX = Math.sqrt(Dx);
        double sigmaY = Math.sqrt(Dy);
        double covTeor = Realise.countCov();


        System.out.println("m(x) = " + Mx);
        System.out.println("m(y) = " + My);
        System.out.println("D(x) = " + Dx);
        System.out.println("D(y) = " + Dy);
        System.out.println("σ(x) = " + sigmaX);
        System.out.println("σ(y) = " + sigmaY);
        System.out.println("cov = " + covTeor);
        System.out.println("ϱ = " + covTeor/(sigmaX * sigmaY));


        System.out.println("            Эксп. значения характеристик: ");

        double mX = 0.0;
        for (double d: arrX) {
            mX += d;
        }
        mX = mX/arrX.length;
        System.out.println("m(x) = " + mX);


        double mY = 0.0;
        for (double d: arrY) {
            mY += d;
        }
        mY = mY/arrY.length;
        System.out.println("m(y) = " + mY);


        double dX = 0.0;
        for (double d: arrX) {
            dX += Math.pow(d - mX, 2);
        }
        dX /= arrX.length;
        System.out.println("D(x) = " + dX);

        double dY = 0.0;
        for (double d: arrY) {
            dY += Math.pow(d - mY, 2);
        }
        dY /= arrY.length;
        System.out.println("D(y) = " + dY);

        double sigma_x = Math.sqrt(dX);
        double sigma_y = Math.sqrt(dY);
        System.out.println("σ(x) = " + sigma_x);
        System.out.println("σ(y) = " + sigma_y);

        double cov = 0.0;
        for (int i = 0; i < 5000; i++) {
            cov += (arrX[i] - mX) * (arrY[i] - mY);
        }
        cov /= 5000;
        System.out.println("cov = " + cov);

        System.out.println("ϱ = " + cov/(sigma_x * sigma_y));

    }
}
