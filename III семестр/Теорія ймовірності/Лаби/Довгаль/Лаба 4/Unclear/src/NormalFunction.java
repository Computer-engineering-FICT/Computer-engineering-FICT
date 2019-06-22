import java.util.Random;

public class NormalFunction {

    private double sigma;
    private double m;

    public double generateNumber(){
        Random rand = new Random();
        double sum = 0;
        for(int i = 0; i < 12; i++){
            sum += rand.nextDouble();
        }
        return (sum - 6)*sigma + m;
    }

    public double get(double x){
        double arg = -(x-m)*(x-m)/(2*sigma*sigma);
        return 1/(Math.sqrt(2*Math.PI)*sigma)*Math.exp(arg);

    }

    public NormalFunction(double sigma, double m) {
        this.sigma = sigma;
        this.m = m;
    }

}
