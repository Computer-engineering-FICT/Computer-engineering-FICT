package com.example.myapplication;

public class Calculator {

    public double calculate1(double a, double b, double c) throws ArithmeticException {
        if (a < 0 || b + 5 * Math.sqrt(a) < 0) throw new ArithmeticException("Result undefined!");
        return Math.pow(5 + c * Math.sqrt(b + 5 * Math.sqrt(a)), 1.0 / 3);
    }

    public double calculate2(double k, double d) throws ArithmeticException {
        if (k > 10) {
            double res = k * Math.sqrt(d*d) + d * Math.sqrt(k*k);
            if (res < 0)  throw new ArithmeticException("Result undefined!");
            return Math.sqrt(res);
        }
        else {
            return Math.pow(k+d,2);
        }
    }

    public double calculate3 (double[] a_arr, double[] b_arr) {
        double multiplication = 1;
        int processed_elements = Math.min(a_arr.length,b_arr.length)-1;
        double sum = 0;
        for (int i = 0; i < processed_elements; i++) {
            multiplication *= a_arr[i] + b_arr[i+1];
            sum += a_arr[i+1] * b_arr[i];
        }

        return multiplication+sum;
    }
}
