public class TestFunction {

    private static double P;
    private static double c1;
    private static double c2;
    private static double m0, s0, m1, s1;

    private NormalFunction f0;
    private NormalFunction f1;

    public TestFunction(){
        f0 = new NormalFunction(s0, m0);
        f1 = new NormalFunction(s1,m1);
    }

    public static String main(double Pl, double c1l, double c2l, double m0l, double s0l, double m1l, double s1l){

        P= Pl;
        c1= c1l;
        c2= c2l;
        m0= m0l;
        s0= s0l;
        m1= m1l;
        s1= s1l;

        TestFunction t = new TestFunction();

        int SecontErrorCounter = 0;
        int FirstErrorCounter = 0;

        for(int i = 0; i < 10000; i++){
            double x = t.f0.generateNumber();
            if(!t.expression(x)) {
                SecontErrorCounter++;
            }
        }

        for(int i = 0; i < 10000; i++){
            double x = t.f1.generateNumber();
            if(t.expression(x))
                FirstErrorCounter++;
        }

        return "Probability of first error : " + (double)FirstErrorCounter / 10000+ '\n'+
        "Probability of second error : " + (double)SecontErrorCounter/10000;
    }

    public boolean expression(double x){
        return f1.get(x)/f0.get(x) < P*c1/((1-P)*c2);
    }

}
