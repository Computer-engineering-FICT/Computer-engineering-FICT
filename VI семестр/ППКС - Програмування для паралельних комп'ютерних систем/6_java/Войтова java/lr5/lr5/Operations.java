package lr5;

public class Operations {
	
	public static int H = Main.H;
	public static int N = Main.N; 
	
	public static void Matrix_Multiplication (Matrix matr1, Matrix matr2,
			 int id, Matrix matr3){
		int from = (id - 1)*H;
		int till = id*H;
		int el = 0;
		
		for (int i = from; i < till; i++){
			for (int j = 0; j < N; j++)
				matr3.setElement(i, j, 0);
		}//end for
		
		for (int k = from; k < till; k++){
			for (int es = 0; es < N; es++){
				el = 0;
				for (int s = 0; s < N; s++){
				 el = el + matr1.getElement(k, s)*matr2.getElement(s, es);
				}
			matr3.setElement(k, es, el);
			}	
		}//end for
	}//end Matrix_Multiplication
	
	public static void Matrix_Scalar_Multiplication(Matrix inmatr, int scalar, 
			int id, Matrix outmatr){
		int from = (id - 1)*H;
		int till = id*H;
		int buf = 0;
		
		for (int i = from; i < till; i++){
			for (int j = 0; j < N; j++){
				buf = scalar*inmatr.getElement(i, j);
				outmatr.setElement(i, j, buf);
			}	
		}//end for
	}//end Matrix_Scalar_Multiplication
	
	public static void Matrix_Subtraction(Matrix MA, Matrix MB,
			int id, Matrix outmatr){
		int from = (id - 1)*H;
		int till = id*H;
		int buf = 0;
		
		for (int i = from; i < till; i++){
			for (int j = 0; j < N; j++){
				buf = MA.getElement(i, j) - MB.getElement(i, j);
				outmatr.setElement(i, j, buf);
			}
		}
	}//end Matrix_Summation;

	//TODO: debug this. I need columns, not lines
	public static void Vector_Matrix_Multi (Vector vec, Matrix matr, 
			int id, Vector outvec){
		int from = (id - 1)*H;
		int till = id*H;
		int buf = 0;
		
		for (int i = from; i < till; i++){
			buf = 0;
			for (int j = 0; j < N; j++){
				buf = buf + vec.getElement(j)*matr.getElement(j, i);
			}
			outvec.setElement(i, buf);
		}
	}//end Vector_Matrix_Multi;
	
	public static void calculatingMD(Matrix MX, Matrix ME, Matrix MU, 
			int alpha, int id, Matrix MD){
		Matrix m1 = new Matrix(N);
		Matrix m2 = new Matrix(N);
		
		System.out.println("    T"+id+ " - MXh*ME");
		Matrix_Multiplication(MX,ME,id,m1);
		System.out.println("      T"+id+ " - alpha*MUh");
		Matrix_Scalar_Multiplication(MU,alpha,id,m2);
		System.out.println("        T"+id+ " - MDh = MXh*ME - alpha*MUh");
		Matrix_Subtraction(m1,m2,id,MD);
	}
	
	
}
