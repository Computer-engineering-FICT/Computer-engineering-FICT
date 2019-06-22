package kpi.teorver.lab3333;

import java.util.Random;

/**
 *
 * @author Nightingale
 * 
 */
public class Main2 {
	private static double Sigma=2;
    private static double Mediana=2;
    private static double Lambda=2;
    private static int Number=1000;
    private static int NormalN = 6;
    private static double Correlation=0.6;
 

   

    private static double[] normalGenerator(double Mediana, double Sigma){
        double[] res = new double[Number];
        final double sqrt = Math.sqrt(12/NormalN);
        final int halfN = NormalN/2;
        Random Gen = new Random();
        for (int i=0;i<Number;i++){
            double Y =0;
            for (int j=0;j<NormalN;j++)
                Y+=Gen.nextDouble();
            res[i]=Sigma*sqrt*(Y-halfN)+Mediana;
        }
        return res;
    }

    private static double[] coralatedExponentialGenerator(double[]num,double Sigma){
        double[] res = new double[Number];
        Random Gen = new Random();
        for (int i=0;i<Number;i++)
            res[i]=-Math.log(Gen.nextDouble())*(
                    Sigma + (Correlation*Sigma/Lambda)*(num[i]-Mediana));
        return res;
    }

    private static double mathExpectation(double[] num){
        double S = 0;
        for (int i=0;i<num.length;i++)
            S+=num[i];
        return S/Number;
    }

    private static double dispertion(double[] num,double Mediana){
        double S=0;
        for (int i=0;i<num.length;i++)
            S+=(num[i]-Mediana)*(num[i]-Mediana);
        return S/Number;
    }

    private static double deviation(double[] num,double Mediana){
        return Math.sqrt(dispertion(num,Mediana));
    }

    private static double covariation(double[] num1,double m1,
            double[] num2,double m2){
        double S = 0;
        for (int i=0;i<Number;i++)
            S+=(num1[i]-m1)*(num2[i]-m2);
        return S/Number;
    }

    private static double correlation(double[] num1, double[] num2,
            double med1, double med2,
            double sigma1,double sigma2){
        return covariation(num1, med1, num2, med2)/(sigma1*sigma2);
    }
    public static void main(String[] args){            
        double[] ResultX = normalGenerator(Mediana,Sigma);

        double SigmaYX = (1/Lambda)*Math.sqrt(1-Correlation*Correlation);

        double[] ResultY = coralatedExponentialGenerator(ResultX,SigmaYX);

        for (int i=0;i<Number;i++)
            System.out.println(ResultX[i]+" "+ResultY[i]);

        System.out.println("Exponential expected: "+mathExpectation(ResultY));
        System.out.println("Exponential deviation: "+deviation(ResultY,SigmaYX));

        System.out.println("Normal expected: "+mathExpectation(ResultX));
        System.out.println("Normal deviation: "+deviation(ResultX,Mediana));

        System.out.println("Correlation: "+correlation(ResultX, ResultY,
                Mediana, SigmaYX,Sigma,SigmaYX));
    }
}