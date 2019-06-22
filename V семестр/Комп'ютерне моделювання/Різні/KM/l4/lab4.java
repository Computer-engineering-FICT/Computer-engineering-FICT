package l4;

public class lab4 {
	
	
	private static int n = 5; // кількість повторювань дослідів
	private static int k = 3; // кількість факторів
	private static int N = 4; // кількість дослідів (ДФЕ = 4)
	
	private static double[][] planingMatrixDFE = {
							{1.0, -1.0, -1.0, +1.0},
							{1.0, +1.0, -1.0, -1.0},
							{1.0, +1.0, +1.0, -1.0},
							{1.0, -1.0, +1.0, +1.0},
							};
	
	private static double[][] planingMatrixPFE = {
		{1.0, +1.0, +1.0, -1.0, +1.0, -1.0, -1.0, -1.0},
		{1.0, -1.0, +1.0, -1.0, -1.0, +1.0, -1.0, +1.0},
		{1.0, +1.0, -1.0, -1.0, -1.0, -1.0, +1.0, +1.0},
		{1.0, -1.0, -1.0, -1.0, +1.0, +1.0, +1.0, -1.0},
		{1.0, +1.0, +1.0, +1.0, +1.0, +1.0, +1.0, +1.0},
		{1.0, -1.0, +1.0, +1.0, -1.0, -1.0, +1.0, -1.0},
		{1.0, +1.0, -1.0, +1.0, -1.0, +1.0, -1.0, -1.0},
		{1.0, -1.0, -1.0, +1.0, +1.0, -1.0, -1.0, +1.0},
		};
	
	// табл. коеф. Кохрена для 4х дослідів (ДФЕ)
	private static double[] kohren4 = 
	{ 0, 0.9065, 0.7679, 0.6841, 0.6287, 0.5892, 0.5598, 0.5365, 0.5175, 0.5017,
			0.4884, 0.4366, 0.3720, 0.3093, 0.2500};
	// табл. коеф. Стюдента 
	private static double[] student = 
	{0, 12.71, 4.303, 3.182, 2.776, 2.571, 2.447,	2.365, 2.306, 2.262,
			2.228, 2.201, 2.179, 2.160, 2.145};
	private static double[] fisher = 
	{0, 224.6, 19.3, 9.1, 6.4,	5.2, 4.5, 4.1, 3.8, 3.6,
			3.5, 3.4, 3.3, 3.2, 3.1};
	private static double[][] dataMatrix;
	private static double[][] MY;
	private static double[] mmY = new double[2];
	private static double[][] MX = {
			{ 50,  60, 55},
			{-10, -20, 50 }
		};
	private static double[] averageY;
	private static double[] standardDeviationY;
	private static double[] probabilityDistributionY;
	
	//система рівняннь
	private static double[][] koef;
	private static double[] koefFree;
	
	//коеф. характ. р-ня
	private static double[] b;
	
	private static void initMY(int n){
		MY = new double[N][n];
		for(int i=0;i<MY.length;i++){
			for(int j=0;j<MY[0].length;j++){
				MY[i][j] = genY(mmY[1], mmY[0]);
			}
		}
	}
	
	private static double[][] addY(){
		double[][] newMY = new double[MY.length][MY[0].length+1];
		for(int i=0;i<newMY.length;i++){
			for(int j=0;j<newMY[0].length-1;j++){
				newMY[i][j] = MY[i][j];
			}
		}
		for(int j=0;j<newMY.length;j++){
			newMY[j][newMY[0].length-1] = genY(mmY[1], mmY[0]);
		}
		return newMY;
	}
	
	private static double genY(double min, double max){
		double res = 0;//Math.random()*1000;
		while((res<min)||(res>max)){
			res = Math.random()*1000;
		}
		return res;
	}
	
	private static void getStartY(){
		double s = 0;
		for(int i=0;i<MX[0].length;i++){
			s+=MX[0][i];
		}
		mmY[0] = 200 + s/k;
		s = 0;
		for(int i=0;i<MX[0].length;i++){
			s+=MX[1][i];
		}
		mmY[1] = 200 + s/k;
	}
	
	private static double[][] initDataMatrix(double[][] dm){
		dataMatrix = new double[N][N];
		for(int i=0;i<dm.length;i++){
			for(int j=1;j<dm[0].length;j++){
				if(dm[i][j] == 1 ){
					dm[i][j] = MX[0][j-1];
				}else{
					dm[i][j] = MX[1][j-1];
				}
			}
		}
		return dm;
	}
	
	public static void matrixOut(String s, double[][] m){
		System.out.println(s);
		for(int i=0;i<m.length;i++){
			for(int j=0;j<m[0].length;j++){
				System.out.printf("%10.1f",  m[i][j]);
			}
			System.out.println();
		}
		System.out.println();
	}
	
	private static void vecOut(String s, double[] v){
		System.out.println(s);
		for(int i=0;i<v.length;i++){
			System.out.printf("%5.5f ", v[i]);
		}
		System.out.println();
		System.out.println();
	}
	
	private static void getAverageY(){
		averageY = new double[N];
		double s = 0;
		for(int i=0;i<MY.length;i++){
			s = 0;
			for(int j=0;j<MY[i].length;j++){
				s += MY[i][j];
			}
			averageY[i] = s/MY[i].length;
		}
	}
	
	private static void getSi2(){
		standardDeviationY = new double[N];
		double s = 0;
		for(int i=0;i<MY.length;i++){
			s = 0;
			for(int j=0;j<MY[i].length;j++){
				s += (MY[i][j] - averageY[i]) *
					(MY[i][j] - averageY[i]);
			}
			standardDeviationY[i] = s/(n-1);
		}
	}
	
	private static void makeDistributionY(){
		probabilityDistributionY= new double[N];
		for(int i=0;i<probabilityDistributionY.length;i++){
			probabilityDistributionY[i] = Math.sqrt(standardDeviationY[i]);
		}
	}
	
	
	private static void getStudent(double[] param){
		double[] b = new double[N];
		for(int i=0;i<b.length;i++){
			for(int j=0;j<b.length;j++){
				b[i] += averageY[j]*dataMatrix[i][j];
			}
			b[i] = Math.abs(b[i]) / N;
		}
		
		double[] d = new double[N];
		
		System.out.println("Критерій Стюдента: ");
		for(int i=0;i<N;i++){
			d[i] += probabilityDistributionY[i];
			d[i] /= ( N*n);
			b[i] = b[i] / ( d[i]*d[i] );
			if(b[i] > param[n]){
				System.out.printf("%s %f > %f коефіцієнт значимий\n","\t",b[i], param[n]);
			}else{
				System.out.printf("%s %f < %f незначимий\n","\t",b[i], param[n]);
			}
		}
		
	}
	
	
	public static void fillMatrixForDFE(double[][] matr, double[] y){
		koef = new double[N][N];
		koefFree = new double[N];
		koef[0][0] = 1.0;
		for(int i=0;i<N;i++){
			koef[0][1] += matr[i][1];
			koef[0][2] += matr[i][2];
			koef[0][3] += matr[i][3];
			
			koef[1][0] += matr[i][1];
			koef[2][0] += matr[i][2];
			koef[3][0] += matr[i][3];
			
			koef[1][1] += (matr[i][1]*matr[i][1]);
			koef[2][2] += (matr[i][2]*matr[i][2]);
			koef[3][3] += (matr[i][3]*matr[i][3]);
			
			koef[1][2] += (matr[i][1]*matr[i][2]);
			koef[1][3] += (matr[i][1]*matr[i][3]);
			
			koef[2][1] += (matr[i][2]*matr[i][1]);
			koef[2][3] += (matr[i][2]*matr[i][3]);
			
			koef[3][1] += (matr[i][3]*matr[i][1]);
			koef[3][2] += (matr[i][3]*matr[i][2]);
			
			koefFree[0] +=    y[i];
			koefFree[1] +=  ( y[i]*matr[i][1] );
			koefFree[2] +=  ( y[i]*matr[i][2] );
			koefFree[3] +=  ( y[i]*matr[i][3] );
		}
		for(int i=0;i<4;i++){
			for(int j=0;j<4;j++){
				koef[i][j] /= N;
			}
			koefFree[i] /= N;
		}
	}
	
	public static void fillMatrixPFE(double[][] matr, double[] y){
		koef = new double[N][N];
		koefFree = new double[N];
		
		koef[0][0] = 8;
		for(int i=0;i<N;i++){
			koef[0][1] += matr[i][1];
			koef[0][2] += matr[i][2];
			koef[0][3] += matr[i][3];
			koef[0][4] += matr[i][4];
			koef[0][5] += matr[i][5];
			koef[0][6] += matr[i][6];
			koef[0][7] += matr[i][7];
			
			koef[1][0] += matr[i][1];
			koef[2][0] += matr[i][2];
			koef[3][0] += matr[i][3];
			koef[4][0] += matr[i][4];
			koef[5][0] += matr[i][5];
			koef[6][0] += matr[i][6];
			koef[7][0] += matr[i][7];
			
			koef[1][1] += (matr[i][1]*matr[i][1]);
			koef[2][2] += (matr[i][2]*matr[i][2]);
			koef[3][3] += (matr[i][3]*matr[i][3]);
			koef[4][4] += (matr[i][4]*matr[i][4]);
			koef[5][5] += (matr[i][5]*matr[i][5]);
			koef[6][6] += (matr[i][6]*matr[i][6]);
			koef[7][7] += (matr[i][7]*matr[i][7]);
			
			koef[1][2] += (matr[i][1]*matr[i][2]);
			koef[1][3] += (matr[i][1]*matr[i][3]);
			koef[1][4] += (matr[i][1]*matr[i][4]);
			koef[1][5] += (matr[i][1]*matr[i][5]);
			koef[1][6] += (matr[i][1]*matr[i][6]);
			koef[1][7] += (matr[i][1]*matr[i][7]);
			
			koef[2][1] += (matr[i][2]*matr[i][1]);
			koef[2][3] += (matr[i][2]*matr[i][3]);
			koef[2][4] += (matr[i][2]*matr[i][4]);
			koef[2][5] += (matr[i][2]*matr[i][5]);
			koef[2][6] += (matr[i][2]*matr[i][6]);
			koef[2][7] += (matr[i][2]*matr[i][7]);
			
			koef[3][1] += (matr[i][3]*matr[i][1]);
			koef[3][2] += (matr[i][3]*matr[i][2]);
			koef[3][4] += (matr[i][3]*matr[i][4]);
			koef[3][5] += (matr[i][3]*matr[i][5]);
			koef[3][6] += (matr[i][3]*matr[i][6]);
			koef[3][7] += (matr[i][3]*matr[i][7]);
			
			koef[4][1] += (matr[i][4]*matr[i][1]);
			koef[4][2] += (matr[i][4]*matr[i][2]);
			koef[4][3] += (matr[i][4]*matr[i][3]);
			koef[4][5] += (matr[i][4]*matr[i][5]);
			koef[4][6] += (matr[i][4]*matr[i][6]);
			koef[4][7] += (matr[i][4]*matr[i][7]);
			
			koef[5][1] += (matr[i][5]*matr[i][1]);
			koef[5][2] += (matr[i][5]*matr[i][2]);
			koef[5][3] += (matr[i][5]*matr[i][3]);
			koef[5][4] += (matr[i][5]*matr[i][4]);
			koef[5][6] += (matr[i][5]*matr[i][6]);
			koef[5][7] += (matr[i][5]*matr[i][7]);
			
			koef[6][1] += (matr[i][6]*matr[i][1]);
			koef[6][2] += (matr[i][6]*matr[i][2]);
			koef[6][3] += (matr[i][6]*matr[i][3]);
			koef[6][5] += (matr[i][6]*matr[i][5]);
			koef[6][4] += (matr[i][6]*matr[i][4]);
			koef[6][7] += (matr[i][6]*matr[i][7]);
			
			koef[7][1] += (matr[i][7]*matr[i][1]);
			koef[7][2] += (matr[i][7]*matr[i][2]);
			koef[7][3] += (matr[i][7]*matr[i][3]);
			koef[7][5] += (matr[i][7]*matr[i][5]);
			koef[7][6] += (matr[i][7]*matr[i][6]);
			koef[7][4] += (matr[i][7]*matr[i][4]);
			
			koefFree[0] +=    y[i];
			koefFree[1] +=  ( y[i]*matr[i][1] );
			koefFree[2] +=  ( y[i]*matr[i][2] );
			koefFree[3] +=  ( y[i]*matr[i][3] );
			koefFree[4] +=  ( y[i]*matr[i][4] );
			koefFree[5] +=  ( y[i]*matr[i][5] );
			koefFree[6] +=  ( y[i]*matr[i][6] );
			koefFree[7] +=  ( y[i]*matr[i][7] );
		}
		for(int i=0;i<N;i++){
			for(int j=0;j<N;j++){
				koef[i][j] /= N;
			}
			koefFree[i] /= N;
		}		
	}
	
	private static void dataWithInteraction(double[][] dm){
		for(int i=0;i<dm.length;i++){
			for(int j=1;j<4;j++){
				if(dm[i][j] == 1 ){
					dm[i][j] = MX[0][j-1];
				}else{
					dm[i][j] = MX[1][j-1];
				}
			}
			dm[i][4] = dm[i][1]* dm[i][2];
			dm[i][5] = dm[i][1]* dm[i][3];
			dm[i][6] = dm[i][2]* dm[i][3];
			dm[i][7] = dm[i][1]* dm[i][2]* dm[i][3];
		}		
		dataMatrix = dm;
	}
	
	private static boolean getKohren(double[] param, double[] d){
		double max = 0;
		double s = 0;
		for(int i=0;i<d.length;i++){
			if(d[i] > max){
				max = d[i];
			}
			s += d[i];
		}
		s = max / s;
		if(param[n] > s){
			System.out.println("Кохрен: " + s + "  <  " + param[n]
			                       + "\t(перевірка пройдена.)\t");
			return true;
		}
		System.out.println("Кохрен: " + s + "  >  " + param[n] + " непройдено");
		return false;
	}
	
	
	private static boolean getFisher(double[] param){
		
		double s = 0;
		for(int i=0;i<N;i++){
			s += averageY[i];
		}
		s /= N;
		
		double ad = 0;
		for(int i=0;i<N;i++){
			ad += (averageY[i]-s)*(averageY[i]-s);
		}
		ad *= (double)n/N;
		double d = 0;
		for(int i=0;i<N;i++){
			d += probabilityDistributionY[i];
		}
		d /=  N;
		ad /= d;
		ad = ad*n/N;		
		if(ad < param[N]){
			System.out.println("Фишер: " + ad + "  <  " + param[N] + " рівняння адекватне");
			return true;
		}
		System.out.println("Фишер: " + ad + "  >  " + param[N] + " неадекватне");
		return false;
	}
	
	
	private static void checkRivn(){
		System.out.println("Перевірка відповідності моделі: ");
		for(int row=0;row<N;row++){
			Gauss sl= new Gauss();
			b = sl.getResult(koef, koefFree);
			double s = 0;
			System.out.print("Y = ");
			for(int i=0;i<N;i++){
				s += b[i]*dataMatrix[row][i];
				System.out.printf(" %+5.5f ", b[i]*dataMatrix[row][i]);
			}
			System.out.println();
			System.out.printf("\tY= %+5.5f \ty %+5.5f \n",s,averageY[row]);
		}
	}

	public static void main(String[] args) {
			getStartY();
			boolean q;
			//таблиця експерименту (х)
			dataMatrix = initDataMatrix(planingMatrixDFE);
				n = 5; // кількість повторювань дослідів
				k = 3; // кількість факторів
				N = 8; // кількість дослідів (ПФЕ = 8)
			
				//отримання результатів досліджень
				initMY(n);
				matrixOut("Y: ", MY);	
				do {			
				//середні занчення отриманих Y
				getAverageY();
				vecOut("Average Y: ", averageY);
				
				dataWithInteraction(planingMatrixPFE);
				matrixOut("X: ", dataMatrix);
				
				//Коефіцієнти хар. р-ня
				fillMatrixPFE(dataMatrix, averageY);
				Gauss g= new Gauss();
				b = g.getResult(koef, koefFree);
				vecOut("Коефіцієнти хар. р-ня: ", b);
				//Середні квадратичні відхилення
				getSi2();
				
				//Дисперсія
				makeDistributionY();
			
				//виконуємо перевірку Кохрена на однорідність
				q = getKohren(kohren4, probabilityDistributionY);
				
				MY = addY();		
				n++;				
				}while(!q);
				//Перевірка критерію стюдента
				getStudent(student);
				getFisher(fisher);				
				checkRivn();
	}

}
