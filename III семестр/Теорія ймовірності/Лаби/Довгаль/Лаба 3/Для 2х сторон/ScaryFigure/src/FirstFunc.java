public class FirstFunc implements MyFunction{

    double a= Main.a;
    double b= Main.b;
    @Override
    public double doOperation(double x) {
        return 3*(a-x)/(Math.pow(a,2)*b);
    }
}
