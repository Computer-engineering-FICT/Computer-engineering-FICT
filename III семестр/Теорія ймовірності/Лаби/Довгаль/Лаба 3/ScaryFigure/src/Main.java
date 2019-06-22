import java.util.Random;

public class Main {

    final static int count=5000;
    static double a;
    static double delta;

    public static String doAllmyWork(double A, double Delta) {

        a=A; delta=Delta;

        double xMas[]= new double[count];
        double yMas[]= new double[xMas.length];
        Random r= new Random();
        PhiX phiX= new PhiX();
        AfterFunc afterFunc;
        StringBuilder answrer= new StringBuilder("");

        answrer.append("Текущее значение стороны А - "+ a+ "\n");
        answrer.append("Соответственно значение высоты H - "+ 3/Math.pow(a,2)+ "\n");
        answrer.append("Точность для метода трапеций - "+ delta+ "\n"+ "\n");

        long startTime= System.currentTimeMillis();

        for (int i=0;i<xMas.length;i++){
            double tmp= r.nextDouble();
            xMas[i]= Operations.calcTrap(tmp,phiX);
            afterFunc= new AfterFunc(xMas[i]);
            tmp= r.nextDouble();
            yMas[i]= Operations.calcTrap(tmp,afterFunc);
        }

        double matWx= Operations.matWaiting(xMas);
        double matWy= Operations.matWaiting(yMas);
        answrer.append("Матожидание для X - "+ matWx+ "\n");
        answrer.append("Матожидание для Y - "+ matWy+ "\n");

        double xDis= Operations.dispersion(xMas,matWx);
        double yDis= Operations.dispersion(yMas,matWy);
        answrer.append("Дисперсия для X - "+ xDis+ "\n");
        answrer.append("Дисперсия для Y - "+ yDis+ "\n");

        double xSigma= Math.sqrt(xDis);
        double ySigma= Math.sqrt(yDis);
        answrer.append("Сигма для X - "+ xSigma+ "\n");
        answrer.append("Сигма для Y - "+ ySigma+ "\n");

        double cov= Operations.covariation(xMas, yMas, matWx, matWy);
        answrer.append("Ковариация - "+ cov+ "\n");

        answrer.append("Коефициент корреляции - "+ Operations.correlNum(cov,xSigma,ySigma)+ "\n"+ "\n");

        answrer.append("Времени затрачено - "+ (double)(System.currentTimeMillis()-startTime)/1000+ " секунд"+ "\n");

        return answrer.toString();
    }
}
