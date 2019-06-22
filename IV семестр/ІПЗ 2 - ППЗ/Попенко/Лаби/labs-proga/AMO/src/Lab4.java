import bsh.EvalError;
import bsh.Interpreter;


public class Lab4 {
	static double iteration;
	public static double f (double x){
		return Math.log10(x)+x-0.5;
	}
	public static double roundResult (double d, int precise) {
		 
		   precise = 10^precise;
		   d = d*precise;
		   int i = (int) Math.round(d);
		   return (double) i/precise;
		 
	}
	
	public static double df (double x){
		double dx=0.000000001;
		return roundResult((f(x+dx)-f(x))/dx,4);
		
	}
	
	public static double phi (double x){		
		return x-f(x)/df(x);		
	}
	
	public static  double iterationRoot (double x0,  double eps){ 
		double iter=0;
		double x=x0;
		double s=x0;
		 for (double i = 1.0; eps<Math.abs(f(x)); i=i+1.0) {
			 if(df(0) == 0)
		            break;
			 s=x;
			 iter=i;
			 x=phi(x);
			 
		}
		iteration=iter;
		
		return s; 
		
	} 
	
	
	public static void main(String[] args) throws EvalError {
		System.out.println(iterationRoot(0.6,0.000001)+" "+iteration);
		
		Interpreter interpreter = new Interpreter();
		interpreter.eval("result = Math.sin(5)");
		double d=(double) interpreter.get("result");
		System.out.println(d);
	}

}
