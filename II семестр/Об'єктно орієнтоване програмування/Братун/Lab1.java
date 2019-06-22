package main.java.com.yUvOsIl.lab1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Lab1
{
    public static void main(String[] args) throws IOException
    {
        int c2 = 5318%2; // +
        final int C = 5318%3; //=2
        int c5 = 5318%5; // %
        int c7 = 5318%7; // float

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        float a = Float.parseFloat(reader.readLine());
        float n = Float.parseFloat(reader.readLine());
        float b = Float.parseFloat(reader.readLine());
        float m = Float.parseFloat(reader.readLine());

        double S = 0;
        if (a%2!=0 && a==n)
        {
            for (float i = a; i <= n; i++)
            {
                for (float j = b; j <= m; j++)
                {
                    S += (i + j) / (i % C);
                }
            }
            System.out.println(S);
        } else System.out.println("Деление на 0");
    }
}
