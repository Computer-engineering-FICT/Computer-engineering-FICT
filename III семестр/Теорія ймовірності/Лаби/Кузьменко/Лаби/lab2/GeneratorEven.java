public class GeneratorEven {
	private double[] value = new double[5000];

	public GeneratorEven(double a, double b, double c, double d, double e,
			double h1, double h2, double h3, double h4) {
		
		Rectangle [] rectangle = new Rectangle [4];
		rectangle[0]= new Rectangle(a, b, h1);
		rectangle[1] = new Rectangle(b, c, h2);
		rectangle[2] = new Rectangle(c, d, h3);
		rectangle[3]= new Rectangle(d, e, h4);
		
		int i=0;
		for (int k = 0; k < value.length; k++) {
		i=0;	
		double r =Math.random();
		double bufferr = r;
		
		double rectSq = rectangle[i].getSquare();
		
		while (rectSq<r){
			i++;
			rectSq +=rectangle[i].getSquare();
			
		}
		double bufSum = 0;
		for (int j = 0; j < i; j++) {
			bufSum += rectangle[j].getSquare();
		}
		
		bufferr = r - bufSum;
		value[k]=(bufferr/rectangle[i].getH())+rectangle[i].getLastParam();
		}
	}
	public double [] getValues (){
		return value;
	}
}
