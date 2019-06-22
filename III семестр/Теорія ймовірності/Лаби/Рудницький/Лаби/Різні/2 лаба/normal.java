package teorver5;

import java.util.Random;

public class normal {
	
	public static   double [] mass(){
		int q=1000;
		int complexity=5;
		double y=0;
		
		int m= 1;
		int G= 1;			
		double [] r = new double [complexity];	
		double [] R = new double [q];
			for (int i=0;i<q;i++){		
				double suma=0;				
				Random go = new Random();
					for (int w=0;w<complexity;w++){
						r[w]=go.nextDouble();							
					}
						
						
					for (int p=0;p<r.length;p++){
						suma+=r[p];
					}
				y =  (Math.sqrt(2))*(suma-3);				
				R[i]=y*G+m; 				
			}
		return R;
	}	


}
