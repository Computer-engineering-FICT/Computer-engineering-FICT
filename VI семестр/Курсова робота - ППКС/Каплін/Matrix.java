

public class Matrix {
	
	private int N;
	private int H;
	private int[][] M;
	
	public Matrix(int N){
		this.N = N;
		this.H = N;
		M = new int[N][N];
	}
	
	public Matrix(int N, int x){
		this.N = N;
		this.H = N;
		M = new int[N][N];
		for (int i=0; i<N; i++){
			for (int j=0; j<N; j++){
				M[i][j] = x;
			}
		}
	}
	
	public Matrix(int H, int N, boolean Flag){
		this.N = N;
		this.H = H;
		M = new int[H][N];
	}
	
	public Matrix(int N, int H, int x){
		this.N = N;
		this.H = H;
		M = new int[H][N];
		for (int i=0; i<N; i++){
			for (int j=0; j<N; j++){
				M[i][j] = x;
			}
		}
	}
	
	public void setElement(int posX, int posY, int value){
		this.M[posX][posY] = value;
	}
	
	public int getElement(int posX, int posY){
		return M[posX][posY];
	}
	
	public int getN(){
		return N;
	}
	
	public int getH(){
		return H;
	}
	
	public void printMatrix(){
		for (int i=0; i<H; i++){
			for (int j=0; j<N; j++){
				System.out.print("M["+i+"]["+j+"]="+M[i][j]+"  ");
			}
			System.out.println();
		}
	}
}
