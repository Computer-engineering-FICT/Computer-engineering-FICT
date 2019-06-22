
public class Vector {
	
	private int N;
	private int[] V;
	
	public Vector(int N){
		this.N = N;
		V = new int[N];
	}
	
	public Vector(int N, int x){
		this.N = N;
		V = new int[N];
		for (int i=0; i<N; i++){
			V[i] = x;
		}
	}
	
	public void setElement(int pos, int value){
		this.V[pos] = value;
	}
	
	public int getElement(int pos){
		return V[pos];
	}
	
	public int getN(){
		return N;
	}
	
	public void printVector(){
		for (int i=0; i<N; i++){
			System.out.print("V["+i+"]="+V[i]+"  ");
		}			
	}
	

}
