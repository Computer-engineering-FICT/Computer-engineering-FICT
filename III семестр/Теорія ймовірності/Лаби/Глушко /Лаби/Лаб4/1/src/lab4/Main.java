package lab4;

import java.util.Arrays;

/**
 *
 * @author Solimr
 */
public class Main {

    private static double[] Sample = {3,27,27,33,9,9,21,21,21,15,33,27,21,39,15,15};
    private static int L = 3;
    private static double[] borders = new double[L+1];
    private static int[] bordersPlace = new int[L+1];
    private static double[] probability = new double[L];

    public static void main(String[] args){
//        Sample=Lab2.Main.generate();
        Arrays.sort(Sample);
        double M = expected(Sample);
        double A = Math.max(M-Sample[0], Sample[Sample.length-1]-M);
        for (int i=1;i<L;i++){
            bordersPlace[i]=i*(Sample.length)/L;
            borders[i]=(Sample[bordersPlace[i]+1]+Sample[bordersPlace[i]])/2;
            while (borders[i]==Sample[bordersPlace[i]]){
                bordersPlace[i]++;
                borders[i]=(Sample[bordersPlace[i]+1]+Sample[bordersPlace[i]])/2;
            }
        }
        borders[0]=Sample[0];
        borders[L]=Sample[Sample.length-1];
        bordersPlace[0]=-1;
        bordersPlace[L]=Sample.length-1;

        for (int i=0;i<L;i++){
            probability[i]=square(M,A, borders[i+1]);
        }

        for (int i=L-1;i>0;i--)
            probability[i]-=probability[i-1];
        probability[0]-=square(M,A, borders[0]);

        double HiHi=HiHi(bordersPlace,probability,Sample.length);

        for (int i=0;i<Sample.length;i++)
            System.out.print(Sample[i]+" ");
        System.out.println();
        System.out.println("M "+M);
        System.out.println("A "+A);
        for (int i=0;i<borders.length;i++){
            System.out.println("Bor "+borders[i]);
            System.out.println("BorPl "+bordersPlace[i]);
        }
        for (int i=0;i<probability.length;i++){
            System.out.println("Pr "+probability[i]);
        }
        System.out.println(HiHi);
    }

    private static double expected(double[] num){
        double S = 0;
        for (int i=0;i<num.length;i++)
            S+=num[i];
        return S/num.length;
    }

    private static double HiHi(int[] place, double[] values,int size){
        double HiHi=0;
        for (int i=0;i<L;i++){
            if (values[i]!=0.0)
                HiHi+=((place[i+1]-place[i])*(place[i+1]-place[i]))/
                        (size*values[i]);
        }
        return HiHi-=size;
    }

    private static double HiHiAlt(int[] place, double[] values,int size){
        double HiHi=0;
        for (int i=0;i<L;i++){
            HiHi+=((place[i+1]-place[i]-size*values[i])*(place[i+1]-place[i]-size*values[i]))/
                    (size*values[i]);
        }
        return HiHi;
    }

    private static double square(double M, double Angle,double x){
        if (x<M)
            return (x-M+Angle)*(x-M+Angle)/(2*Angle*Angle);
        else
            return 1-((M+Angle-x)*(M+Angle-x)/(2*Angle*Angle));
    }
}
