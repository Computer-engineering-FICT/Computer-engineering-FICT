/**
  * Laboratory Work # 5
  * Parallel and distributed calculations 
  * Java. Monitors
  * 
  * A = (B*MO)*(MX*ME - alpha*MU)
  * 
  * Voytova Anastasi
  * IO-71
  * 
  * 14 March 2010
  */

package lr5;

import java.util.Calendar;

public class Main {
	
	public static int N = 3200;
	public static int p = 4;
	public static int H = N/p;
	////
	public static boolean readValuesFromFile = false;
	public static int el = 1;
	public static int al = 1; //6
	////
	public static Matrix MD = new Matrix (N);
	public static Matrix MX = new Matrix (N);
	public static Matrix MU = new Matrix (N);
	public static Matrix MO = new Matrix (N);
	public static Vector Ch = new Vector (N);
	public static Vector A  = new Vector (N);
	////
	public static void main (String[]args){
		AccessToCR accessToCR = new AccessToCR();
		Synchro synchro = new Synchro();
		T1thread T1 = new T1thread(accessToCR,synchro);
		T2thread T2 = new T2thread(accessToCR,synchro);
		T3thread T3 = new T3thread(accessToCR,synchro);
		T4thread T4 = new T4thread(accessToCR,synchro);
		T1.start();
		T2.start();
		T3.start();
		T4.start();
	}
}

class T1thread extends Thread {
	////
	int N = Main.N;
	int id = 1;
	int el = Main.el;
	////
	Matrix ME1 = new Matrix(N);
	Vector B1 = new Vector(N);
	Vector C1 = new Vector(N);
	int alpha1;
	////
	AccessToCR accessToCR;
	Synchro synchro;
	////	
	public T1thread(AccessToCR mnCR,Synchro mnS){
		accessToCR = mnCR;
		synchro = mnS;
	}
	
	public void run(){
		long start,stop;
		Calendar cal = Calendar.getInstance();
		start = cal.getTimeInMillis();
		
		System.out.println("T1 started");
		System.out.println("1. T1 inputs data");
		if (Main.readValuesFromFile){
			Main.MO.Input_Matrix("MO.txt");
		}
		else{
			Main.MO.Input_Matrix(el);
		}
		//2. Signal to T2-T4
		synchro.inputDataSignal();
		//3. Waiting for T2-T4
		synchro.waitInputDataSignal();
		
		System.out.println("4. T1 copies data");
		alpha1 = accessToCR.copyMEAlphaB(ME1, B1);
		
		System.out.println("5. T1 is calculating... ");
		Operations.calculatingMD(Main.MX, ME1, Main.MU, alpha1, id, Main.MD);
		System.out.println("    T1 - Ch = B*MOh");
		Operations.Vector_Matrix_Multi(B1, Main.MO, id, Main.Ch);
		
		//6. Signal T2-T4
		synchro.calcSignal();
		//7. Wait for T2-T4
		synchro.waitCalcSignal();
		
		System.out.println("8. T1 inputs C into monitor");
		accessToCR.formC(Main.Ch,id);
		
		System.out.println("9. T1 copies C");
		accessToCR.copyC(C1);
		System.out.println("10. T1 is calculating... Ah");
		Operations.Vector_Matrix_Multi(C1, Main.MD, id, Main.A);
		
		//11. Wait for T2-T4
		synchro.waitOutputSignal();
		
		cal = Calendar.getInstance();
		stop = cal.getTimeInMillis();
		
		System.out.println("12. T1 outputs data");
		Vector.Print_Vector(Main.A, "out.txt");	
		System.out.println("T1 ended in " + (stop-start));
	}
}

class T2thread extends Thread {
	int N = Main.N;
	int id = 2;
	int el = Main.el;
	Matrix ME2 = new Matrix(N);
	Vector B2 = new Vector(N);
	Vector C2 = new Vector(N);
	int alpha2;
	
	Vector Bin = new Vector(N);
	
	AccessToCR accessToCR;
	Synchro synchro;
	
	public T2thread(AccessToCR mnCR,Synchro mnS){
		accessToCR = mnCR;
		synchro = mnS;
	}
	
	public void run(){
		long start,stop;
		Calendar cal = Calendar.getInstance();
		start = cal.getTimeInMillis();
		System.out.println("T2 started");
		System.out.println("1. T2 inputs data");
		if (Main.readValuesFromFile){
			Main.MX.Input_Matrix("MX.txt");
			Bin.Input_Vector("B.txt");
		}
		else{
			Main.MX.Input_Matrix(el);
			Bin.Input_Vector(el);
		}
		accessToCR.inputB(Bin);
		
		//2. Signal to T1,T3,T4
		synchro.inputDataSignal();
		//3. Waiting for T1,T3,T4
		synchro.waitInputDataSignal();
		
		System.out.println("4. T2 copies data");
		alpha2 = accessToCR.copyMEAlphaB(ME2, B2);
		
		System.out.println("5. T2 is calculating... ");
		Operations.calculatingMD(Main.MX, ME2, Main.MU, alpha2, id, Main.MD);
		System.out.println("    T2 - Ch = B*MOh");
		Operations.Vector_Matrix_Multi(B2, Main.MO, id, Main.Ch);
		
		//6. Signal T1,T3,T4
		synchro.calcSignal();
		//7. Wait for T1,T3,T4
		synchro.waitCalcSignal();
		System.out.println("8. T2 inputs C into monitor");
		accessToCR.formC(Main.Ch,id);
		
		System.out.println("9. T2 copies C");
		accessToCR.copyC(C2);
		System.out.println("10. T2 is calculating... Ah");
		Operations.Vector_Matrix_Multi(C2, Main.MD, id, Main.A);
		//11. Signal T1
		synchro.outputSignal();
		
		cal = Calendar.getInstance();
		stop = cal.getTimeInMillis();
		System.out.println("T2 ended in " + (stop-start));
	}
}
	
class T3thread extends Thread {
	int N = Main.N;
	int id = 3;
	int el = Main.el;
	Matrix ME3 = new Matrix(N);
	Vector B3 = new Vector(N);
	Vector C3 = new Vector(N);
	int alpha3;
	
	Matrix MEin = new Matrix(N);
	int alphain;
	
	AccessToCR accessToCR;
	Synchro synchro;
	
	public T3thread(AccessToCR mnCR,Synchro mnS){
		accessToCR = mnCR;
		synchro = mnS;
	}
	
	public void run(){
		long start,stop;
		Calendar cal = Calendar.getInstance();
		start = cal.getTimeInMillis();
		System.out.println("T3 started");
		System.out.println("1. T3 inputs data");
		if (Main.readValuesFromFile){
			MEin.Input_Matrix("ME.txt");
			alphain = Main.al;
		}
		else{
			MEin.Input_Matrix(el);
			alphain = Main.al;;
		}
		accessToCR.inputMEandAlpha(MEin, alphain);
		
		//2. Signal to T1,T2,T4
		synchro.inputDataSignal();
		//3. Waiting for T1,T2,T4
		synchro.waitInputDataSignal();
		
		System.out.println("4. T3 copies data");
		alpha3 = accessToCR.copyMEAlphaB(ME3, B3);
		
		System.out.println("5. T3 is calculating... ");
		Operations.calculatingMD(Main.MX, ME3, Main.MU, alpha3, id, Main.MD);
		System.out.println("    T3 - Ch = B*MOh");
		Operations.Vector_Matrix_Multi(B3, Main.MO, id, Main.Ch);
		
		//6. Signal T1,T2,T4
		synchro.calcSignal();
		//7. Wait for T1,T2,T4
		synchro.waitCalcSignal();
		System.out.println("8. T3 inputs C into monitor");
		accessToCR.formC(Main.Ch,id);
		
		System.out.println("9. T3 copies C");
		accessToCR.copyC(C3);
		System.out.println("10. T3 is calculating... Ah");
		Operations.Vector_Matrix_Multi(C3, Main.MD, id, Main.A);
		//11. Signal T1
		synchro.outputSignal();
		
		cal = Calendar.getInstance();
		stop = cal.getTimeInMillis();
		System.out.println("T3 ended in " + (stop-start));
	}
}

class T4thread extends Thread {
	int N = Main.N;
	int id = 4;
	int el = Main.el;
	Matrix ME4 = new Matrix(N);
	Vector B4 = new Vector(N);
	Vector C4 = new Vector(N);
	int alpha4;
	
	AccessToCR accessToCR;
	Synchro synchro;
	
	public T4thread(AccessToCR mnCR,Synchro mnS){
		accessToCR = mnCR;
		synchro = mnS;
	}
	
	public void run(){
		long start,stop;
		Calendar cal = Calendar.getInstance();
		start = cal.getTimeInMillis();
		System.out.println("T4 started");
		System.out.println("1. T4 inputs data");
		if (Main.readValuesFromFile){
			Main.MU.Input_Matrix("MU.txt");
		}
		else{
			Main.MU.Input_Matrix(el);
		}
		//Main.MU.setElement(2, 2, 0);

		//2. Signal to T1-T3
		synchro.inputDataSignal();
		//3. Waiting for T1-T3
		synchro.waitInputDataSignal();
		
		System.out.println("4. T4 copies data");
		alpha4 = accessToCR.copyMEAlphaB(ME4, B4);
		
		System.out.println("5. T4 is calculating...");
		Operations.calculatingMD(Main.MX, ME4, Main.MU, alpha4, id, Main.MD);
		System.out.println("    T4 - Ch = B*MOh");
		Operations.Vector_Matrix_Multi(B4, Main.MO, id, Main.Ch);
		
		//6. Signal T1-T3
		synchro.calcSignal();
		//7. Wait for T1-T3
		synchro.waitCalcSignal();
		System.out.println("8. T4 inputs C into monitor");
		accessToCR.formC(Main.Ch,id);
		
		System.out.println("9. T4 copies C");
		accessToCR.copyC(C4);
		System.out.println("10. T4 is calculating... Ah");
		Operations.Vector_Matrix_Multi(C4, Main.MD, id, Main.A);
		//11. Signal T1
		synchro.outputSignal();
		
		cal = Calendar.getInstance();
		stop = cal.getTimeInMillis();
		System.out.println("T4 ended in " + (stop-start));
	}		
}
