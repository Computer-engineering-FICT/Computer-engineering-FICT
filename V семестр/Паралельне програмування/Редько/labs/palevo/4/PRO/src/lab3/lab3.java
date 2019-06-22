/*Глухенько Костянтин Анатолійович, група ІО-93
  лаб№ 3. Потоки в мові JAVA
  F1: 1.16  d = ((A + B)* C)   
  F2: 2.24  MG = SORT(MA - MB * MC)  
  F3: 3.22  S = SORT(MA*T)*/ 
package lab3;
public class lab3 {
    public static void main(String[] args) {
        System.out.println("lab3 started");
        F1_TASK f1 = new F1_TASK("T1", 4, 5000, 1);
        F2_TASK f2 = new F2_TASK("T2", 1, 5000, 1);
        F3_TASK f3 = new F3_TASK(5000, 1);
        f1.start();
        f2.start();
        Thread t = new Thread(f3);
        t.setName("T3");
        t.setPriority(1);
        t.start();
        try {
            f1.join();
            f2.join();
            t.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("lab3 finished");
    }
}
