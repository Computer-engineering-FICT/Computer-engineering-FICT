import java.util.Random;
import java.lang.Math.*;

public class NormalFunction {

    private double sigma;
    private double m;

    public double generateNumber(){
        Random rand = new Random();
        double summ = 0;
        for(int i = 0; i < 12; i++){
            summ += rand.nextDouble();
        }
        return (summ - 6)*sigma + m;
    }

    public double get(double x){
        double arg = -(x-m)*(x-m)/(2*sigma*sigma);
        return 1/(sqrt(2*PI)*sigma)*exp(arg);
    }

    public NormalFunction(double sigma, double m) {
        this.sigma = sigma;
        this.m = m;
    }

}
