public class Lab2 {

	public static void main(String[] args) {
	double A[][] = {{4,7,7},
					{-5,1,8},
					{4,8,4,1,5,-20,4},
					{4,5,3},
					{2,4,8,8,4,-20}};
	double B[][] = {{8,1,4},
					{2,7,1},
					{4,7,1,4,1,-5,1},
					{-7,9,6},
					{4,5,6,7,7,23}};
	double S=0;
	boolean flag=true;
	if (A.length == B.length) {
		int maxl=0;
	for (int i=0; i<A.length; i++) {
		if (A[i].length!=B[i].length) flag=false;
		if (A[i].length>maxl) maxl=A[i].length;
		}
		if (flag==true) {
	double C[][] = new double [A.length][maxl];
	for (int i=0; i<A.length; i++) {
		for (int j=0; j<A[i].length; j++) {
		C[i][j] =(long) A[i][j] ^ (long) B[i][j];
		}
	}
	System.out.println("Матриця С:");
	for (int i=0; i<C.length; i++) {
		for (int j=0; j<C[i].length; j++) {
		System.out.print(C[i][j] +" ");	
		}
		System.out.println("");
	}
	for (int i=0; i<C.length; i++) {
		double max = C[i][0]; 
		for (int j=0; j<C[i].length; j++) {
			if (C[i][j]>max) max = C[i][j];
		}
		S+=max;
	}
	System.out.println("Сума найбільших елементів у кожному рядку дорівнює: "+S);
	}
		else if (flag==false) System.out.println("Невірні вхідні дані!");
}
	else System.out.println("Матриці різного розміру!");
	}
}