
public class Rectangle {
	private double square;
	private double H;
	private double startParam;
	public Rectangle (double a, double b, double h){
		square = (b-a)*h;
		H = h;
		startParam=a;
	}
	public double getH(){
		return H;
	}
	public double getSquare (){
		return square;
	}
	public double getLastParam (){
		return startParam;
	}
	
}
