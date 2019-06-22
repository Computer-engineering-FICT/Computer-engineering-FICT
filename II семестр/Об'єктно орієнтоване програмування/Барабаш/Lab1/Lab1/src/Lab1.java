public class Lab1 {
	public static void main(String[] args) {
		byte a=1, n=5, b=3, m=8, i, j;
		// встановлення константи С та суми S
		double S=0;
		int C=2;
		// перевірка границь сумування
		if ((a<=n)&&(b<=m)){	
		    		  for (i=a; i<=n; i++)
		    		  // перевірка на умову ділення на 0
		    		  if (i!=C) {
		    			  for (j=b; j<=m; j++)
			    		  S += (double) (i+j)/(i-C);
		    			  System.out.println("S = " + S);
		    		  }
		    		  else {
		    		  System.out.println("Ділення на 0");
		    		  break;	  
		    		  }
			// виведення результату
		   }
		else System.out.print("Помилка в границях сумування");
		}
}
