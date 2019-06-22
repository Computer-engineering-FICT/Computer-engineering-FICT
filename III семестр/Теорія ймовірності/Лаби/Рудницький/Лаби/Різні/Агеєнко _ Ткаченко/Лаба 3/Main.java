
public class Main {

	public static void main(String[] args) {
		double[] xi = new double[1000];
		double[] yi = new double[1000];
		double mx = 0;
		double my = 0;
			for(int i=0; i<1000; i++){
				xi[i] = calcXi(Math.random());

				yi[i] = calcYi(Math.random(),xi[i]);
			}
		mx = getM(xi);
		my = getM(yi);
		double sigmax = Math.sqrt(getD(xi,mx));
		double sigmay = Math.sqrt(getD(yi,my));
		double cov = 0;
		for(int i = 0; i<1000; i++){
			cov+=(xi[i]-mx)*(yi[i]-my);
		}
		cov/=1000;
		double ro = cov/sigmax/sigmay;
		System.out.println("mx="+mx+"\n"+"my="+my+"\nDx="+getD(xi,mx)+"\nDy="+getD(yi,my)+"\nsigmax="+sigmax+"\nsigmay="+sigmay+"\ncov="+cov+"\nro="+ro);
	}
	
	public static double Fy(double y, double xi){
		return (1-xi-y)/(0.5-xi-xi*xi/2);		
	}
	
	public static double calcXi(double S){
		return Math.cbrt(S-1)+1;
	}
	
	public static double calcYi(double S, double xi){
		return -Math.sqrt(-(S-1)*Math.pow(xi-1, 2))-xi+1;
	}
	
	public static double getYi(double S, double xi){
		double integral = 0;
		double interval = 0.0001;
		int i = 0;
		double temp;
		while(Math.abs(S-integral)>0.0001){
			temp = i*interval+interval/2;
			integral += Fy(temp,xi)*interval;
			if(temp>1){
				return 0;
			}
			i++;
		}
		return i*interval;		
	}
	
	public static double getM(double[] array){
		double S = 0;
		int count;
		for(int i=0; i<array.length; i++){
			count = 0;
			for(int j=0; j<array.length; j++){
				if(array[i]==array[j]){
					count++;
				}
			}
			S+=array[i]*count;
		}
		return S/array.length;
	}
	
	public static double getD(double[] array, double m){
		double S = 0;
		int count;
		for(int i=0; i<array.length; i++){
			count = 0;
			for(int j=0; j<array.length; j++){
				if(array[i]==array[j]){
					count++;
				}
			}
			S+=array[i]*array[i]*count;
		}
		return S/array.length-m*m;
	}
}
