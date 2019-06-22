public class FirstFunc implements MyFunction{

    double a= Main.a;
    @Override
    public double doOperation(double x) {
        return 3*(a-x)/Math.pow(a,3);
    }
}
