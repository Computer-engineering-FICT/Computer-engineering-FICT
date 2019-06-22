/*Глухенько Костянтин Анатолійович, група ІО-93
  лаб№ 3. Потоки в мові JAVA
  F1: 1.16  d = ((A + B)* C)   
  F2: 2.24  MG = SORT(MA - MB * MC)  
  F3: 3.22  S = SORT(MA*T)*/ 
package lab3;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class F2_TASK extends Thread{
    public F2_TASK(String NAME, int PRIORITY, int N, int VALUE){
        this.setPriority(PRIORITY);
        this.setName(NAME);
        MA = new int[N][N];
        MB = new int[N][N];
        MC = new int[N][N];
        for(int i=0; i<N;i++)
            for(int j=0; j<N;j++){
                MA[i][j] = VALUE;
                MB[i][j] = VALUE;
                MC[i][j] = VALUE;
            }
    }
    public F2_TASK(String NAME, int PRIORITY, int[][] MA, int[][] MB, int[][] MC){
        this.setPriority(PRIORITY);
        this.setName(NAME);
        this.MA = MA;
        this.MB = MB;
        this.MC = MC;
    }
    private int[][] MINUS(int[][] ARG1, int[][] ARG2){
        int[][] RESULT = new int[ARG1.length][ARG1.length];
        for(int i=0; i<ARG1.length; i++)
            for(int j=0; j<ARG1.length; j++)
                RESULT[i][j] = ARG1[i][j] - ARG2[i][j];
        return RESULT;
    }
    private int[][] MUL(int[][] ARG1, int[][] ARG2){
        int[][] RESULT = new int[ARG1.length][ARG1.length];
        for(int i=0; i<ARG1.length; i++)
            for(int j=0; j<ARG1.length; j++)
                for(int k=0; k<ARG1.length; k++)
                    RESULT[i][j] += ARG1[i][k] * ARG2[k][j];
        return RESULT;
    }
    private int[][] SORT(int[][] ARG){
        for(int i=0; i<ARG.length; i++)
            for(int j=0; j<ARG.length; j++){
                for(int k=j+1; k<ARG.length; k++)
                    if(ARG[i][j] < ARG[i][k]){
                        int t = ARG[i][j];
                        ARG[i][j] = ARG[i][k];
                        ARG[i][k] = t;
                    }   
                for(int k=i+1; k<ARG.length; k++)
                    for(int m=0; m<ARG.length; m++)
                        if(ARG[i][j] < ARG[k][m]){
                            int t = ARG[i][j];
                            ARG[i][j] = ARG[k][m];
                            ARG[k][m] = t;
                        } 
            }
        return ARG;
    }
    public void run(){
        System.out.println(this.getName()+" started");
        MG = SORT(MINUS(MA, MUL(MB, MC)));
        try {
            BufferedWriter outfile = new BufferedWriter(new FileWriter("F2.txt"));
            outfile.write("MG = SORT(MA - MB * MC)");
            outfile.newLine();
            for(int i=0; i<MG.length; i++){
                for(int j=0; j<MG.length; j++)
                    outfile.write(MG[i][j]+" ");
                outfile.newLine();
            }
            outfile.close();
        }
        catch (IOException e) { 
            e.printStackTrace();
        }
        try {
            sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(this.getName()+" finished");
    }
    public int[][] getMG() {
        return MG;
    }
    private int[][] MA;
    private int[][] MB;
    private int[][] MC;
    private int[][] MG;
}