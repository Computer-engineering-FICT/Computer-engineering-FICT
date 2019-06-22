import java.util.Random;

public class laba1TV {
	
	private static byte[] mas1= new byte[12];
	private static byte[] mas2= new byte[12];
	private static byte[] mas3= new byte[12];
	private static byte[] mas4= new byte[12];
	private static byte[] masK1= new byte[12];
	private static byte[] masK2= new byte[12];
	private static byte[] masiv = new byte[10000];
	
	public static byte[] LFSR(byte[] mas){
		int t = (mas[mas.length-1] + mas[5] + mas[3] + mas[0]) % 2; 
		for(int i = 1; i< mas.length; i++)
			mas[i-1] = mas[i];
	    mas[mas.length-1] = (byte) t;
		return mas;
	}
	
	public static byte[] Create(byte[] mas){
		Random r = new Random();
		for(int i = 0; i< mas.length-1; i++)
			mas[i] = (byte) r.nextInt(2);
		return mas;
	}
	
	
	public static int number(){
		//Create(masK1);
		//Create(masK2);
		mas1= LFSR(mas1);
		//mas2= LFSR(mas2);
		//mas3= LFSR(mas3);
		//mas4= LFSR(mas4);
		//masK1= LFSR(masK1);
		//masK2= LFSR(masK2);
	    byte k = 0;//(byte) (masK1[masK1.length-1]*10 + masK2[masK2.length-1]);
		switch(k){ 
		    case 0:
		    	k= mas1[mas1.length -1];
		    	break;
		    case 1:
		    	k= mas2[mas2.length -1];
		    	break;
		    case 10:
		    	k= mas3[mas3.length -1];
		    	break;
		    case 11:
		    	k= mas4[mas4.length -1];
		    	break;
		}
		return k;		
	}
	
		public static void main(String[] args) {
			Create(mas1);
			//Create(mas2);
			//Create(mas3);
			//Create(mas4);
			
		    
		    for (int i= 0; i<masiv.length; i++){
		    	masiv[i]= (byte) number();
		    }
		    for(int i = 0; i< masiv.length; i++)
		    {	System.out.print(masiv[i]); 
		    	System.out.println();
		    }
		    
		   double t1 = test.test1(masiv);
		   System.out.println("Результаты 1-го теста(частотный): " +t1);
		   double t2 = test.test2(masiv);
		   System.out.println("Результаты 2-го теста(дифференциально частотный): " +t2);
		   System.out.println("Результаты 3-го теста(ранговый): ");
		   int[] t3 = test.test3(masiv,4);
		   String answer = "";
			for (int i = 0; i < t3.length; i++) answer += t3[i] + ", ";
			System.out.println(answer.substring(0, answer.length()));
		   test.test4(masiv);


		}
		
		
	
}
