public class PhiX implements MyFunction{

    double a= Main.a;
    @Override
    public double doOperation(double x) {
        return 3*(Math.pow(a,2)-Math.pow(x,2))/(2*Math.pow(a,3));
    }
}
