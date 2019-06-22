/*Глухенько Костянтин Анатолійович, група ІО-93
  лаб№ 3. Потоки в мові JAVA
  F1: 1.16  d = ((A + B)* C)   
  F2: 2.24  MG = SORT(MA - MB * MC)  
  F3: 3.22  S = SORT(MA*T)*/ 
package lab3;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class F3_TASK implements Runnable{
    public F3_TASK(int N, int VALUE){
        T = new int[N];
        MA = new int[N][N];
        for(int i=0; i<N;i++)
            T[i] = VALUE;
        for(int i=0; i<N;i++)
            for(int j=0; j<N;j++)
                MA[i][j] = VALUE;
    }
    public F3_TASK(int[][] MA, int[] T, int[] S){
        this.MA = MA;
        this.S = S;
        this.T = T;
    }
    private int[] MUL(int[][] ARG1, int[] ARG2){
        int[] RESULT = new int[ARG2.length];
        for(int i=0; i<ARG1.length; i++)
            for(int j=0; j<ARG1.length; j++)
                RESULT[i] += ARG1[i][j] * ARG2[j];
        return RESULT;
    }
    private int[] SORT(int[] ARG){
        for(int i=0; i<ARG.length-1; i++)
            for(int j=i+1; j<ARG.length; j++)
                if(ARG[i] > ARG[j]){
                    int t = ARG[j];
                    ARG[j] = ARG[i];
                    ARG[i] = t;
                }   
        return ARG;
    }
    public void run(){
        System.out.println(Thread.currentThread().getName()+" started");
        S = SORT(MUL(MA, T));
        try {
            BufferedWriter outfile = new BufferedWriter(new FileWriter("F3.txt"));
            outfile.write("S = SORT(MA*T)");
            outfile.newLine();
            for(int i=0; i<S.length; i++)
                    outfile.write(S[i]+" ");
            outfile.close();
        }
        catch (IOException e) { 
            e.printStackTrace();
        }
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread().getName()+" finished");
    }
    public int[] getS() {
        return S;
    }
    private int[] S;
    private int[] T;
    private int[][] MA;   
}
