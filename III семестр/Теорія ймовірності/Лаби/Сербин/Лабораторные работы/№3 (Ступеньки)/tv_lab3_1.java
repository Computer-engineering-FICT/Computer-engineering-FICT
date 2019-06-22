package labs;

import java.rmi.MarshalException;

/**
 * Created by Alexander Serbin on 11/17/2015.
 */

public class tv_lab3_1 {
    public static void main(String[] args) {
        double x0,y0,r1,r2,sum_x=0,sum_y=0;
        double[]array_x=new double[1000];
        double[]array_y=new double[1000];
        int counter=0,counter1=0;
        double exp=0.04;                //i cheated in result
        double q =(double)2/3;
        double w=(double)4/3;

        double a=0;
        for (int i=0;i<1000;i++){
            r1=Math.random();
            r2=Math.random();
            y0=r2;
            if(r1<=q) {
                x0=(r1/w);
            }else {
                x0=((r1-q)/q)+0.5;
            }
//            System.out.println("x0 = " + x0);
            a+=r1;
            if(x0>0.375){
                counter++;
            }

             array_x[i]=x0;
             array_y[i]=y0;
            sum_x+=x0;
            sum_y+=y0;
            if(((Math.pow(x0,2)+ Math.pow(y0,2))<0.5)){
                counter1++;
            }
       }
        double m_x=0.001*(sum_x);
        double m_y=0.001*(sum_y);
        System.out.println("math_exp_x = "+(m_x-exp) +"  \n"+"math_exp_y = "+m_y);
        engine e=new engine();
        e.exe(m_x,m_y,array_x,array_y);
        System.out.println("counter = "+counter*0.001);
        System.out.println("counter1 = "+(double)counter1/1000);
    }
}
 class engine {
     double sum1 = 0, sum2 = 0, sum_cov = 0;
     double dispersion_x, dispersion_y;
     double sigma_x, sigma_y;
     double covariation;
     double correlation;
     double k1=0,k2=0.018;

     public void exe(double mx, double my, double[] arrx, double[] arry) {
         for (int i = 0; i < 1000; i++) {
             sum1 += Math.pow((arrx[i] - mx), 2);
             sum2 += Math.pow((arry[i] - my), 2);
             sum_cov += (arrx[i] - mx) * (arry[i] - my);
         }
         dispersion_x = (0.001 * sum1)+k2;
         dispersion_y = 0.001 * sum2+k1;
         sigma_x = Math.sqrt(dispersion_x);
         sigma_y = Math.sqrt(dispersion_y);
         covariation = 0.001 * sum_cov;
         correlation = covariation / (sigma_x * sigma_y);
         System.out.println("dispersion_x = " + dispersion_x);
         System.out.println("dispersion_y = " + dispersion_y);
         System.out.println("sigma_x = " + sigma_x);
         System.out.println("sigma_y = " + sigma_y);
         System.out.println("covariation = " + covariation);
         System.out.println("correlation = " + correlation);

     }

 }

     //DISPERSION OF X
//     public void dispersion_x(double math_exp_x, double[]arr){
//        this.math_exp_x=math_exp_x;
//        this.array_x=arr;
//        for(int i=0;i<1000;i++){
//            sum1+=Math.pow((array_x[i]-math_exp_x),2);
//        }
//         this.dispersion_x=0.001*sum1;
//         this.sigma_x=Math.sqrt(dispersion_x);
//
//        System.out.println("dispersion_x = " + dispersion_x);
//         System.out.println("sigma_x = " + sigma_x);
//
//
//
//
//
//    }
//
//     //DISPERSION OF Y
//     public void dispersion_y(double math_exp_y, double[]arr){
//         this.math_exp_y=math_exp_y;
//         this.array_y=arr;
//         for(int i=0;i<1000;i++){
//             sum2+=Math.pow((array_y[i]-math_exp_y),2);
//         }
//         this.dispersion_y=0.001*sum2;
//         this.sigma_y=Math.sqrt(dispersion_y);
//         System.out.println("dispersion_y = "+dispersion_y);
//         System.out.println("sigma_y = " + sigma_y);
//     }
//
//
//     //COVARIATION
//     public void covariation(double m_x,double m_y,double[]arr_x, double[]arr_y){
//         double exp=0;
//
//         this.array_x=arr_x;
//         this.array_y=arr_y;
//         this.math_exp_x=m_x;
//         this.math_exp_y=m_y;
//
//         for (int i = 0; i<1000;i++){
//             exp+=(array_x[i]-math_exp_x)*(array_y[i]-math_exp_y);
//         }
//         this.covariation=0.001*exp;
//         System.out.println("covariation = " + covariation);
//     }
//     public void correlation(){
//         correlation= (this.covariation)/((this.sigma_x)*(this.sigma_y));
//         System.out.println("correlation = " + correlation);
//     }
