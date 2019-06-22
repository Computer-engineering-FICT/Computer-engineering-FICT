package lab9;

import java.io.IOException;
import java.io.PipedReader;
import java.io.PipedWriter;

public class Node extends Thread {
    public final int K = 2; //count of peripheral nodes
    
    int num;
    Node [] nodearr;
    
    PipedWriter rightwrite = new PipedWriter();
    PipedWriter leftwrite = new PipedWriter();
    PipedWriter [] perifwrite = new PipedWriter [K];    
    
    PipedReader rightread;
    PipedReader leftread;
    PipedReader [] perifread = new PipedReader [K];
    
    PerifNode [] perif = new PerifNode [K];
    
    int [][] MB = new int [Lab9.N][Lab9.N];
    int [][] MC = new int [Lab9.N][Lab9.N];
    int [][] MZ;
    
    int [][] rez;
    
    class PerifNode extends Thread{
        int [][] MB = new int [Lab9.N][Lab9.N];
        int [][] MC = new int [Lab9.N][Lab9.N];
        int [][] MZ = new int [Lab9.H / (K+1)][Lab9.N];        
        
        PipedWriter mainwrite = new PipedWriter();                       
        PipedReader mainread;
        
        public PerifNode (PipedWriter mainwr) {                      
            try {
                mainread = new PipedReader(mainwr, Lab9.N*Lab9.N*4);
            } catch (IOException e) { e.printStackTrace(); }
        }
         
        
        public void run () {
            //System.out.println ("Perif started");
            MB = readPipe(mainread, Lab9.N);
            MC = readPipe(mainread, Lab9.N);
            MZ = readPipe(mainread, Lab9.H / (K+1));
            
            rez = process(MB, MC, MZ);
            
            writePipe(mainwrite, rez, rez.length);
            //System.out.println ("Perif finished");
        }
    }
    
    public Node (int num, Node [] nodearr) {
        this.num = num;
        this.nodearr = nodearr;
        
        MZ = new int [(num + 1)*Lab9.H][Lab9.N];        
        
        for (int i = 0; i < K; i++)
            perifwrite[i] = new PipedWriter();
        
        for (int i = 0; i < K; i++)
            perif[i] = new PerifNode(perifwrite[i]);
    }

    public void createPipes () {
        try {
            if (num > 0)        leftread  = new PipedReader(nodearr[num-1].rightwrite, Lab9.N*Lab9.N*4);
            if (num < Lab9.P-1) rightread = new PipedReader(nodearr[num+1].leftwrite, Lab9.N*Lab9.N*4);
        } catch (IOException e) { e.printStackTrace(); }    
        
        for (int i = 0; i < K; i++)
            try {
                perifread[i] = new PipedReader (perif[i].mainwrite);
            } catch (IOException e) { e.printStackTrace(); }
    }
    
    public void run () {
        System.out.println ("Thread " + num + ": started");       
        
        if (num < Lab9.P / 2) {
            if (num == 0) {
                inputMatr(MB);
                
                //MB[1][2] = 2;
                
            } else {
                MB = readPipe (leftread, MB.length);
            }
            
            System.out.println ("Thread " + num + ": received MB");
            
            writePipe (rightwrite, MB, MB.length);     
            
            System.out.println ("Thread " + num + ": send MB");
            
            MC = readPipe (rightread, MC.length);            
            MZ = readPipe (rightread, MZ.length);
            System.out.println ("Thread " + num + ": receive MC & MZ");
            
            if (num > 0) {
                writePipe (leftwrite, MC, MC.length);
                writePipe (leftwrite, MZ, MZ.length - Lab9.H);
            }
            System.out.println ("Thread " + num + ": send MC");
        } else {
            if (num == Lab9.P-1) {
                inputMatr(MC);
                inputMatr(MZ);  
                
                //MZ[1][2] = 2;
                //MC[1][2] = 2;
                
                transpon(MZ);
            } else {
                MC = readPipe (rightread, MC.length);
                MZ = readPipe (rightread, MZ.length);
            }
            
            System.out.println ("Thread " + num + ": received MC & MZ");
            
            writePipe (leftwrite, MC, MC.length);
            writePipe (leftwrite, MZ, MZ.length - Lab9.H);
            
            System.out.println ("Thread " + num + ": send MC & MZ");
            
            MB = readPipe (leftread, MB.length);
            System.out.println ("Thread " + num + ": received MB");
            if (num < Lab9.P-1) writePipe (rightwrite, MB, MB.length);
            System.out.println ("Thread " + num + ": send MB");
        }
        
        for (int i = 0; i < K; i++) 
            perif[i].start();
        
        int part = Lab9.H / (K+1);
        
        for (int i = 0; i < K; i++) {
            writePipe(perifwrite[i], MB, MB.length);
            writePipe(perifwrite[i], MC, MC.length);            
            writePipe(perifwrite[i], scissors (MZ, num*Lab9.H + i, part), part);
        }
        
        int [][] temp = process(MB, MC, scissors (MZ, num*Lab9.H + K*part, part));
        
        int [][] MTemp1 = new int [Lab9.H][Lab9.N];
        
        glue (MTemp1, temp, K*part);
        
        for (int i = 0; i < K; i++) {
            temp = readPipe(perifread[i], part);
            glue (MTemp1, temp, i*part);
        }              
        
        int [][] MRez = new int [(Lab9.P - num)*Lab9.H][Lab9.N];
        
        glue(MRez, MTemp1, 0);
        
        int [][] MTemp2 = new int [(Lab9.P - num - 1)*Lab9.H][Lab9.N];
        if (num < Lab9.P - 1) {
            MTemp2 = readPipe(rightread, MTemp2.length);
            glue(MRez, MTemp2, Lab9.H);
        }
        
        if (num > 0) writePipe(leftwrite, MRez, MRez.length);
        
        if ( (num == 0) && (Lab9.N < 25) ) {
            transpon (MRez);
            printMatr(MRez);
        }
            
        System.out.println ("Thread " + num + ": finished");
    }
    
    private void glue (int [][] rez, int[][] part, int start) {
        for (int i = 0; i < part.length; i++) {
            rez[start + i] = part[i];
        }
    }
    
    private int[][] scissors (int [][] MX, int start, int len) {
        int [][] rez = new int [len][Lab9.N];
        
        for (int i = 0; i < len; i++) {
            rez[i] = MX[start + i];
        }
        
        return rez;
    }
    
    private void transpon (int [][] MX) {
        int temp;
        for (int i = 0; i < MX.length; i++) {
            for (int j = i; j < MX[0].length; j++) {                
                temp = MX[i][j];
                MX[i][j] = MX[j][i];
                MX[j][i] = temp;
            }
        }
    }
    
    private void inputMatr (int [][] MX) {
        for (int i = 0; i < MX.length; i++) 
            for (int j = 0; j < MX[0].length; j++) 
                MX[i][j] = 1;
    }
    
    private int [][] readPipe (PipedReader pipe, int J) {
        int [][] rez = new int [J][Lab9.N];
        
        for (int i = 0; i < J; i++) {
            for (int j = 0; j < Lab9.N; j++) {
                try {
                    rez[i][j] = pipe.read();
                } catch (IOException e) { e.printStackTrace(); }
            }
        }
        
        return rez;
    }   
    
    private void writePipe (PipedWriter pipe, int[][] MX, int J) {
        for (int i = 0; i < J; i++) {
            for (int j = 0; j < Lab9.N; j++) 
                try {
                    pipe.write(MX[i][j]);
                } catch (IOException e) { e.printStackTrace(); }
        }
    }
    
    private void printMatr (int [][] MX) {
        for (int i = 0; i < MX.length; i++) {
            for (int j = 0; j < MX[0].length; j++) {
                System.out.print(MX[i][j] + "   ");
            }
            System.out.println ();
        }
    }
    
    private int [][] process (int [][] MB, int [][] MC, int [][] MZ) {
        int [][] rez = new int [Lab9.H / (K+1)][Lab9.N];
        int [][] temp = new int [Lab9.H / (K+1)][Lab9.N];
        
        int sum;
        
        for (int z = 0; z < temp.length; z++) {
            for (int i = 0; i < Lab9.N; i++) {
                sum = 0;
                for (int j = 0; j < Lab9.N; j++) {
                    sum = sum + MC[i][j]*MZ[z][j];
                }
                temp[z][i] = sum;
            }
        }
        
        for (int z = 0; z < temp.length; z++) {
            for (int i = 0; i < Lab9.N; i++) {
                sum = 0;
                for (int j = 0; j < Lab9.N; j++) {
                    sum = sum + MB[i][j]*temp[z][j];
                }
                rez[z][i] = sum;
            }
        }
        
        return rez;
    }
}
