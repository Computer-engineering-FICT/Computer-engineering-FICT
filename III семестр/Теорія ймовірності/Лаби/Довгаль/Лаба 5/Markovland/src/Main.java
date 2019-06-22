import java.util.ArrayList;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        double[][] smallArr= {{0,1},{2,1}};/*{{0.4,0.2,0.4},{0,0.3,0.7},{0.5,0.5,0}};*/

        double[][] bigArr= new double[10][10];

        double l11= smallArr[0][0]*3;
        double l12= smallArr[0][1]*3;
        double l21= smallArr[1][0]*3;
        double l22= smallArr[1][1]*3;

        bigArr[0][2]= l11;
        bigArr[0][6]= l12;
        bigArr[1][4]= l22;
        bigArr[1][9]= l21;
        bigArr[2][3]= l11;
        bigArr[3][0]= l11;
        bigArr[4][5]= l22;
        bigArr[5][1]= l22;
        bigArr[6][7]= l12;
        bigArr[7][1]= l12;
        bigArr[8][0]= l21;
        bigArr[9][8]= l21;

        OperClass op= new OperClass();
        ArrayList nulled= new ArrayList();
        double[][] ligthBigArr= op.simplifyArr(bigArr, nulled);
        double[][] bigSLAU= op.createSLAUarr(ligthBigArr);
        double[] bigResult= new double[bigArr.length];
        double[] result= op.gaus(bigSLAU);

        int pos=0;
        for (int i=0;i<bigResult.length;i++){
            if (!nulled.contains(i)) {bigResult[i]= result[pos]; pos++;}
        }
        bigResult[0]+=bigResult[6]+bigResult[7]+bigResult[2]+bigResult[3];
        bigResult[1]+=bigResult[8]+bigResult[9]+bigResult[4]+bigResult[5];

        System.out.println("Initial matrix :");
        for (int i=0;i<smallArr.length;i++) System.out.println(Arrays.toString(smallArr[i]));
        System.out.println("\nIt is calculated theoretically : "+ bigResult[0]+ " "+ bigResult[1]);
        double[] practic= op.calculeteProbability(bigArr);
        System.out.println("It is calculated practically : "+ practic[0]+ " "+ practic[1]);

    }
}
