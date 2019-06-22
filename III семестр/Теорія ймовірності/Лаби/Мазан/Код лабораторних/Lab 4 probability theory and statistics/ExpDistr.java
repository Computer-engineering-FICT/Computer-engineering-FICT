import java.util.Random;
public class ExpDistr {
    private double lambda;
    private Random generator;

    public ExpDistr(double lambda) {
        this.lambda = lambda;
        generator = new Random();
    }

    public double nextNum() {
        double r = generator.nextDouble();
        return -1.0/lambda * Math.log(1-r);
    }

    public double lambda() {
        return lambda;
    }

    public double definite_integral(double start, double end) {
        return Math.exp(-lambda*start)-Math.exp(-lambda*end);
    }
}
