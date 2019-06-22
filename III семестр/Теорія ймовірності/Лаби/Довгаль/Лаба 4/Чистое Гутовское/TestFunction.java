import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class TestFunction {

    private double P= 0.5;
    private double c1= 1;
    private double c2= 1;

    private NormalFunction f0;
    private NormalFunction f1;

    public TestFunction(){
        double m0 = 0, s0 = 10, m1 = 6, s1 = 2;
        f0 = new NormalFunction(s0, m0);
        f1 = new NormalFunction(s1,m1);
    }

    public static void main(String[] args){

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

        System.out.println("Probability of first error:" + (double)FirstErrorCounter / 10000);
        System.out.println("Probability of second error:" + (double)SecontErrorCounter/10000);
    }

    public boolean expression(double x){
        //return f1.get(x)/f0.get(x) < P*c1/((1-P)*c2);
    }

}
