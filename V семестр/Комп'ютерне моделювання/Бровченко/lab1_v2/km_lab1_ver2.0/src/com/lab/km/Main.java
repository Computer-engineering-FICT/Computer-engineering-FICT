package com.lab.km;

import com.lab.km.SMOs.RAND_SMO;
import com.lab.km.SMOs.RR_SMO;
import com.lab.km.SMOs.SF_SMO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Created by User on 27.09.2016.
 */
public class Main {
    public static void main(String[] args) {

        System.out.println("Enter lambda");
        double lambda = getDouble();
        System.out.println("Enter mu");
        double mu = getDouble();
        System.out.println("Enter critical time for RR");
        double criticalTime = getDouble();

        System.out.println("====================== SF =========================");
        SF_SMO sf = new SF_SMO(mu, lambda);
        sf.start();

        System.out.println("====================== RAND =========================");
        RAND_SMO rand = new RAND_SMO(mu, lambda);
        rand.start();

        System.out.println("====================== RR =========================");
        RR_SMO rr = new RR_SMO(mu, lambda, criticalTime);
        rr.start();
    }


    private static double getDouble() {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        while (true) {
            try {
                String temp = reader.readLine();
                double result = Double.parseDouble(temp);
                return result;
            } catch (IOException ioE) {
                System.out.println("IOException");
            } catch (Exception e) {
                System.out.println("Incorrect number. Please try again");
            }
        }
    }
}
