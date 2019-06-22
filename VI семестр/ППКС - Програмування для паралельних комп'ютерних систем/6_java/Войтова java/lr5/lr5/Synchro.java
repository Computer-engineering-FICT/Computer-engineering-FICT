package lr5;

public class Synchro {
	
	private static int p = Main.p;
	private static int Fin = 0;
	private static int Fout = 0;
	private static int Fcalc = 0;
	
	public synchronized void inputDataSignal(){
		Fin++;
		 if (Fin == p){
			 notifyAll();
		 }
	}
	
	public synchronized void waitInputDataSignal(){
		try{
			if (Fin != p){
				wait();
			}
		}catch(Exception e){}
	}
	
	public synchronized void calcSignal(){
		Fcalc++;
		 if (Fcalc == p){
			 notifyAll();
		 }
	}
	
	public synchronized void waitCalcSignal(){
		try{
			if (Fcalc != p){
				wait();
			}
		}catch(Exception e){}
	}
	
	public synchronized void outputSignal(){
		Fout++;
		 if (Fout == (p - 1) ){
			 notifyAll();
		 }
	}
	
	public synchronized void waitOutputSignal(){
		try{
			if (Fout != (p - 1) ){
				wait();
			}
		}catch(Exception e){}
	}
}
