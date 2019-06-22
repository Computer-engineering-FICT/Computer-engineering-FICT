package laboratoryWork2;
import javax.swing.JOptionPane;

public class Generate {
	
	private double sigma;
	private double m;
	
	double tempSequence(){
		double[] array= new double[12];
		double sum=0.0;
		
		for(int i=0; i<array.length; i++){	
			array[i]=Math.random();
			sum+=array[i];
		}
		sum=sum-6.0;
		return sum;
	}
	
	void coefSigma(){
		boolean q=false;
		// input coefficient sigma
				while(q==false){
					try{
						sigma=Double.parseDouble(JOptionPane.showInputDialog("Enter coefficient sigma"));
						if((sigma<100.0) && (sigma>-100.0)) 	q=true;
					}
					catch (NumberFormatException e){
						JOptionPane.showMessageDialog(null, "wrong value of coefficient sigma");
					}
				}
				System.out.println("Inputed value of sigma coefficient :"+sigma);
	}
	
	void coefM(){
		boolean q=false;
		// input coefficient m
				while(q==false){
					try{
						m=Double.parseDouble(JOptionPane.showInputDialog("Enter coefficient m"));
						if((m<100.0) && (m>-100.0)) 	q=true;
					}
					catch (NumberFormatException e){
						JOptionPane.showMessageDialog(null, "wrong value of coefficient m");
					}
				}
				System.out.println("Inputed value of m :"+m);
	}
	
	double getElementOfSequence(double sum){	
		return sigma*sum+m;
	}
}