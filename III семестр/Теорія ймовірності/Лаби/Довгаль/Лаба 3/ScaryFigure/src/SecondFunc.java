public class SecondFunc implements MyFunction{

    double a= Main.a;
    @Override
    public double doOperation(double y) {
        return 3*(a-y)/Math.pow(a,3);
    }
}
