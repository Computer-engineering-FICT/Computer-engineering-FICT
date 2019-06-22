package sample;

import java.util.LinkedList;

public class Solver {
    private double a;
    private double b;
    private double e;
    private Function function = new Function();
    private LinkedList<Double> intervals;
    private int gr;

    Solver(double a, double b, double e) {
        this.a = a;
        this.b = b;
        this.e = e;
        this.gr = (int) (1.0 / e);
        Spliter s = new Spliter();
        intervals = s.getInterval(a, b, e);
    }

    private double getNextA(double xx, double c) {
        return xx - function.getValue(xx) * (c - xx) / (function.getValue(c) - function.getValue(xx));
    }

    private double getNextB(double xx, double c) {
        return xx - function.getValue(xx) * (xx - c) / (function.getValue(xx) - function.getValue(c));
    }

    public LinkedList<Double> getIntervals() {
        Spliter s = new Spliter();
        return s.getInterval(a, b, e);
    }

    public LinkedList<Double> getSolution() {
        LinkedList<Double> result = new LinkedList<Double>();
        if ((((function.getValue(a) * function.getValue(b)) > 0) && (intervals.size() != 2))
                || ((function.getValue(a) * function.getValue(b)) < 0)) {

            for (int i = 0; i < intervals.size() - 1; i++) {
                double left = intervals.get(i);
                double right = intervals.get(i + 1);

                if ((function.getValue(left) * function.getSecondDerivative(left)) > 0) {
                    double xTemp = right;
                    double xPrev = xTemp - 10 * e;
                    while (Math.abs(xTemp - xPrev) > e) {
                        xPrev = xTemp;
                        xTemp = getNextA(xPrev, left);
                    }

                    if ((result.size() == 0) || ((result.size() > 0) && (Math.abs(result.get(result.size() - 1) - xTemp) > e)))
                        result.add(xTemp);

                } else {
                    double xTemp = left;
                    double xPrev = xTemp - 10 * e;
                    while (Math.abs(xTemp - xPrev) > e) {
                        xPrev = xTemp;
                        xTemp = getNextB(xPrev, right);
                    }
                    if ((result.size() == 0) || ((result.size() > 0) && (Math.abs(result.get(result.size() - 1) - xTemp) > e)))
                        result.add(xTemp);
                }
            }
        }
        return result;
    }
}
