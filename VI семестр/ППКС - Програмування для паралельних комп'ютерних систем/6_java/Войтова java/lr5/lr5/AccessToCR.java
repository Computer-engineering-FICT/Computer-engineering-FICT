package lr5;

public class AccessToCR {
	
	private static int N = Main.N;
	private static int H = Main.H;
	private static Matrix ME = new Matrix(N);
	private static Vector B = new Vector(N);
	private static Vector C = new Vector(N);
	private static int alpha;
	
	public synchronized void inputMEandAlpha (Matrix MP, int al){
		for (int i = 0; i < N; i++){
			for (int j = 0; j < N; j++){
				ME.setElement(i, j, MP.getElement(i, j));
			}	
		}
		setAlpha(al);
	}
	
	public synchronized void inputB (Vector X){
		for (int i = 0; i < N; i++){
			B.setElement(i, X.getElement(i));
		}
	}
	
	public synchronized void formC (Vector X, int id){
		int from = (id - 1)*H;
		int till = id*H;
		for (int i = from; i < till; i++){
			C.setElement(i, X.getElement(i));
		}
	}
	
	public synchronized void copyC (Vector X){
		for (int i = 0; i < N; i++){
			X.setElement(i, C.getElement(i));
		}
	}
	
	public synchronized int copyMEAlphaB (Matrix MM, Vector X){
		for (int i = 0; i < N; i++){
			for (int j = 0; j < N; j++){
				MM.setElement(i, j, ME.getElement(i, j));
			}
			X.setElement(i, B.getElement(i));
		}
		return getAlpha();
	}

	public static int getAlpha() {
		return alpha;
	}

	public static void setAlpha(int alpha) {
		AccessToCR.alpha = alpha;
	}	

}
