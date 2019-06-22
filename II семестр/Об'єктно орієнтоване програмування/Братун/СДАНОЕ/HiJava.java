import java.util.Scanner;
/**
 * C=2
 * C2=1
 * C3=2
 * C5=0
 * C7=5
 * O1 = -
 * C = 2
 * O2 = *
 * type i and j = float
 * Created by Андрей on 15.02.2017.
 */
public class HiJava {
    public static void main(String[] args) {
        int a = 0;
        int b = 0;
        int n = 0;
        int m = 0;
        int c = 2;
        double S = 0;

        boolean flag = true;
        Scanner sc = new Scanner(System.in);
        System.out.println("n=");
        if (sc.hasNextInt()) {
            n = sc.nextInt();
            System.out.println("m=");
            if (sc.hasNextInt()) {
                m = sc.nextInt();
                System.out.println("a(must be more tan 2)=");
                if (sc.hasNextInt()) {
                    a = sc.nextInt();
                    System.out.println("b=");
                    if (sc.hasNextInt()) {
                        b = sc.nextInt();

                    } else {
                        flag = false;
                        System.out.println("b is not integer");
                    }
                } else {
                    flag = false;
                    System.out.println("a is not integer");
                }
            } else {
                flag = false;
                System.out.println("m is not integer");
            }
        }else {
            flag=false;
            System.out.println("n is not integer");
        }
        if(a > m||b>n){
            flag=false;
            System.out.println("Wrong limits");
        }
        if(a <= c) {
            flag = false;
            System.out.println("Division by zero");
        }

        if (flag == true) {
            for (float i = a; i <=n; i++) {
                for (float j = b; j <= m; j++) {
                    S += (double)((i * j) / (i - c));

                }
            }
            System.out.println(S);
        }else{
            System.out.println("Error");
        }



    }
}
