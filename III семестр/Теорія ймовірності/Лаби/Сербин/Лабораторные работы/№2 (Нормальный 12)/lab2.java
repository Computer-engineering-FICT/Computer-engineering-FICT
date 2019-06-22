package labs;




public class lab2 {
    public static void main(String[]args){
        double sigma=5,m=10;

        System.out.println("M = "+m);
        System.out.println("SIGMA  = "+ sigma);
        int k=0;
        double ksi, sum;
        double x,x_av, sum_x=0,x_i, sigma_exp, sigma_exp1=0 ;
        double ar2[]=new double [5000];
        for(int i=0;i<5000;i++) {
            double [] ar1 = new double[12];
            sum=0;
            for (int q = 0; q < 12; q++) {//creating and filling R array
                ar1[q] = Math.random();
                //System.out.println(ar1[q]);
                sum = sum + ar1[q];
                /*if(i==1){
                    System.out.println("rand x="+ar1[q]);
                    System.out.println("sum="+sum);
                    System.out.println(1+ar1[q]);

                }*/


            }
            ///System.out.println("11111"+ar1[2]);
            /*for (int w = 0; w < ar1.length; w++) {
                sum += ar1[w];
            }
            if (i==0){
                System.out.println("sum "+sum);
            }*/
            ksi = sum - 6;                      //calculating KSI
            /*if (i==0){
                System.out.println("ksi "+ksi);
            }*/
            x = (ksi * sigma) + m;//calculating X
            /*if (x>12){
                k++;

            }*/
            /*if(i==0){
                System.out.println("x= "+x);
            }*/
            ar2[i] = x;
            sum_x+= x;
            /*if(i==1) {
                System.out.println("SUM DIV 12 = "+sum/12);

            }*/
        }
        //System.out.println("sumx= "+ sum_x);
        double xdiv=(double)1/5000;
        //System.out.println("xdiv "+xdiv);
        x_av=xdiv*sum_x;//x average*/
        System.out.println("X AVERAGE = "+x_av);
        for(int e=0;e<5000;e++){
            x_i=ar2[e];
            sigma_exp1+=Math.pow((x_i-x_av),2);

        }
        //System.out.println("P(x>12)="+ (double)k/ar2.length);
        sigma_exp=Math.sqrt(xdiv*sigma_exp1);//sigma experimental
        System.out.println("SIGMA EXP = "+sigma_exp);
        //System.out.println(Math.pow(2, 5));



    }
}
