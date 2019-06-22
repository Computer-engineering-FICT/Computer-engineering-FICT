package com.example.myapplication;

public class Parser {

    private String raw;
    public Parser (String text) {
        this.raw = text;
    }

    public double[] parseArray() throws Exception {
        String[] arr = raw.split(" ");
        double[] res = new double[arr.length];
        for (int i = 0; i < arr.length; i++) {
            try {
                res[i] = Double.parseDouble(arr[i]);
            }
            catch (Exception e){
                throw new Exception("Wrong input data");
            }
        }
        return res;
    }

    public double parseNumber() throws Exception {
        System.out.println(raw);
        try {
            return Double.parseDouble(raw);
        }
        catch (Exception e){
            throw new Exception("Wrong input data");
        }
    }
}
