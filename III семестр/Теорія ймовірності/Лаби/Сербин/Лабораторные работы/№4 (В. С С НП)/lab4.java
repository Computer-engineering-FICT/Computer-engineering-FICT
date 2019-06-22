package labs;


public class lab4 {
    public static void main(String[] args) {

        double m0=0;
        double m1=3;
        double a=2;
        double c1=1, c2=9;
        double p=0.9 ;

        double r,y;
        int n=50000000;
        int i,k1=0,k2=0;
        double F0[] = new double [n];
        double F1[] = new double [n];

        y=(p*c1*(m0+a)+m1*(1-p)*c2-a*(1-p)*c2)/((1-p)*c2+p*c1);
//        y=1.5 ;
        System.out.println("x = " + y);
        for (i=0;i<n;i++){
            r = Math.random();
            if (r<=0.5)
                F0[i] = m0-a+a/Math.sqrt(0.5/r);
            else{
                r=1-r;
                F0[i] = m0+a-a/Math.sqrt(0.5/r);
            }
            if (F0[i]>=y)
                k1++;
        }

        for (i=0;i<n;i++){
            r = Math.random();
            if (r<=0.5)
                F1[i] = m1-a+a/Math.sqrt(0.5/r);
            else{
                r=1-r;
                F1[i] = m1+a-a/Math.sqrt(0.5/r);
            }
            if (F1[i]<=y)
                k2++;
        }
        double k11=k1*p;
        double k22=k2*(1-p);
        System.out.println("First kind error: "+k11/n);
        System.out.println("Second kind error: "+k22  /n);
    }

}
