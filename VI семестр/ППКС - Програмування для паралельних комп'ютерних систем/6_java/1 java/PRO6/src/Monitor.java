
public class Monitor {
	private int a=0;
	private int F1=0;
	private int F2=0;
	private int[]C;
	private int [][]MO;
	private int P;
	public synchronized void writeMO (int [][] MO){
		this.MO=MO;
	}
	public synchronized void writeC (int [] C){
		this.C=C;
	}
	public synchronized int[][] copyMO (){
		int [][] temp = MO;
		return temp;
	}
	public synchronized int[] copyC(){
		int [] temp = C;
		return temp;
	}
	public synchronized void inputSignal(){
		F1++;
		notify();
	}
	public synchronized void countA(int ai){
		a=a+ai;
		F2++;
		notify();
	}
	public synchronized int outputA(){
		return a;
	}
	public synchronized void waitInput(){
		try {
			while (F1!=3){
				wait();
			}
			notify();
		} catch (InterruptedException e) {
				e.printStackTrace();
		}
	}
	public synchronized void waitCountA(){
		try {
			while (F2!=P){
				wait();
			}
			notify();
		} catch (InterruptedException e) {
				e.printStackTrace();
		}
	}
	public Monitor(int p){
		this.P=p;
	}

}
