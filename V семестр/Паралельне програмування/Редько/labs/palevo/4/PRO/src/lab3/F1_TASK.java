/*Глухенько Костянтин Анатолійович, група ІО-93
  лаб№ 3. Потоки в мові JAVA
  F1: 1.16  d = ((A + B)* C)   
  F2: 2.24  MG = SORT(MA - MB * MC)  
  F3: 3.22  S = SORT(MA*T)*/ 
package lab3;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class F1_TASK extends Thread{
    public F1_TASK(String NAME, int PRIORITY, int N, int VALUE){
        this.setPriority(PRIORITY);
        this.setName(NAME);
        A = new int[N];
        B = new int[N];
        C = new int[N];
        for(int i=0; i<N;i++){
            A[i] = VALUE;
            B[i] = VALUE;
            C[i] = VALUE;
        }
    }
    public F1_TASK(String NAME, int PRIORITY, int[] A, int[] B, int[] C){
        this.setPriority(PRIORITY);
        this.setName(NAME);
        this.A = A;
        this.B = B;
        this.C = C;
    }
    private int[] PLUS(int[] ARG1, int[] ARG2){
        int[] RESULT = new int[ARG1.length];
        for(int i=0; i<ARG1.length; i++)
            RESULT[i] = ARG1[i] + ARG2[i];
        return RESULT;
    }
    private int MUL(int[] ARG1, int[] ARG2){
        int RESULT = 0;
        for(int i=0; i<ARG1.length; i++)
            RESULT += ARG1[i] * ARG2[i];
        return RESULT;
    }
    public void run(){
        System.out.println(this.getName()+" started");
        d = MUL(PLUS(A,B),C);
        try {
            BufferedWriter outfile = new BufferedWriter(new FileWriter("F1.txt"));
            outfile.write("d = ((A + B)* C)="+d);
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
    public int getD() {
        return d;
    }
    private int[] A;
    private int[] B;
    private int[] C;
    private int d;
}
