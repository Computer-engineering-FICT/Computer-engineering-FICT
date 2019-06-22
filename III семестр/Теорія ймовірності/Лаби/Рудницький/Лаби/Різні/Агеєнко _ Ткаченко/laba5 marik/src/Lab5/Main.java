package Lab5;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.apache.commons.math.linear.Array2DRowRealMatrix;
import org.apache.commons.math.linear.LUDecompositionImpl;
import org.apache.commons.math.linear.RealMatrix;


public class Main {
	
	public static double[] height = new double[]{177,186,185,180,187,181,180,188,186,177,185,175,185,180,170,180,184,177,181,178,170,176,185,182,184,180,180,174,186,174,180,172,189,183,180,171,172,167,186,183,184,172};
	public static double[] length = new double[]{7,6.6,7,9.5,6.5,9.5,7.7,7,6,7,5.5,7.5,8.5,7.5,6.9,7.8,8.5,8,8.5,7.5,7.6,9,8.5,8,7.7,7,7,7.5,7.5,9.5,7,7.2,7.5,7.5,6.5,6.1,7.2,6.5,6.5,7.6,7.7,6.5};
	public static double[] physics = new double[]{4,4,4,4,3,4,3,5,4.5,3.5,3,4,3,4,3.5,3.5,3,3,3,3.5,3.5,3,4,3.5,4,3.5,4,3.5,3,5,4,4,5,3,5,4,3,3.5,3,3,3,4};
	
	public static void main(String[] args) {
		int var = 2;
		double[][] cov = new double[var][var];
		double[][] sequence = new double[][]{height, length};
		double[] covy = new double[var];
		for(int i=0; i<var; i++){
			for(int j=0; j<var; j++){
				cov[i][j] = getCovariance(sequence[i], sequence[j], getM(sequence[i]), getM(sequence[j]));
			}
			covy[i] = getCovariance(physics, sequence[i], getM(physics), getM(sequence[i]));
		}
		RealMatrix matrix = new Array2DRowRealMatrix(cov);
		RealMatrix modMatrix;
		double L = getL(matrix);
		double[] Li = new double[var];
		double[] B = new double[var];
		double alpha = 0;
		for(int i=0; i<Li.length; i++){
			modMatrix = new Array2DRowRealMatrix(cov);
			modMatrix.setColumn(i, covy);
			Li[i] = getL(modMatrix);
			B[i] = Li[i]/L;
			alpha+=B[i]*getM(sequence[i]);
		}
		alpha = getM(physics) - alpha;
		System.out.println("y="+alpha+"+"+B[0]+"*x1+"+B[1]+"*x2");
		try{
			BufferedReader stream = new BufferedReader(new InputStreamReader(System.in));
			System.out.println("Enter x1, x2");
			double x1 = Double.parseDouble(stream.readLine());
			double x2 = Double.parseDouble(stream.readLine());
			double S = alpha+B[0]*x1+B[1]*x2;
			System.out.println("y="+S);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static double getD(double[] array, double m){
		double S = 0;
		for(int i=0; i<array.length; i++){
			S+=array[i]*array[i];
		}
		return S/array.length-m*m;
	}
	
	public static double getM(double[] array){
		double S = 0;
		for(int i=0; i<array.length; i++){
			S+=array[i];
		}
		return S/array.length;
	}
	
	public static double getCovariance(double[] array1, double[] array2, double m1, double m2){
		double S = 0;
		for(int i = 0; i<array1.length; i++){
			S+=(array1[i]-m1)*(array2[i]-m2);
		}
		return S/array1.length;
	}
	
	public static double getL(RealMatrix matrix){		
		return new LUDecompositionImpl(matrix).getDeterminant(); 
	}
}
