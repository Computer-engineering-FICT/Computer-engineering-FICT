package lab2;

/**
 *         Assignment #2
 *    Student: Andrew Logvinchuk
 *    Group:   IO-41
 *    Date:    19/09/2016
 *
 *    F1 = ((A + B)*(C*(MA*ME)))
 *    F2 = SORT(TRANS(MF)*MK)
 *    F3 = MAX((MO*MP)*R + MS*S)
 *
 */
public class Main {

    public static final int N = 1500;

    public static void main(String[] args) throws InterruptedException {
        Thread t1 = new F1("T1", Thread.MIN_PRIORITY, N);
        Thread t2 = new F2("T2", Thread.MAX_PRIORITY, N);
        Thread t3 = new Thread(new F3(N));
        t3.setName("T3");
        t3.setPriority(Thread.NORM_PRIORITY);

        t1.start();
        t2.start();
        t3.start();

        t1.join();
        t2.join();
        t3.join();

    }

}
