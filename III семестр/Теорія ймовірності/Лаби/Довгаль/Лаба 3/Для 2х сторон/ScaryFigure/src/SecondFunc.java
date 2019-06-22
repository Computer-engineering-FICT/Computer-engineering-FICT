public class SecondFunc implements MyFunction{

    double a= Main.a;
    double b= Main.b;
    @Override
    public double doOperation(double y) {
        return 3*(b-y)/(Math.pow(b,2)*a);
    }
}
