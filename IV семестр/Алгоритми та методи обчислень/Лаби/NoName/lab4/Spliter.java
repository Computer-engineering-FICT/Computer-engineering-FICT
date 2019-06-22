package sample;

import java.util.LinkedList;

public class Spliter {
    public LinkedList<Double> getInterval(double a, double b, double e) {
        LinkedList<Double> result = new LinkedList<Double>();
        Function function = new Function();
        int count = (int) ((b - a) / e);
        result.add(a);
        for (int i = 0; i < count; i++) {
            if (function.getValue(a) * function.getValue(a + e) <= 0)
                result.add(a + e);
            a = a + e;
        }
        result.add(b);
        return result;
    }

}
