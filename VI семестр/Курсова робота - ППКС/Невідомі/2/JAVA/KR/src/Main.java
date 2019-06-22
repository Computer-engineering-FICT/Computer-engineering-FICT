
public class Main {
	static Monitor m = new Monitor();
	static Tasks[] T;
	static void RunTask(){
		T = new Tasks[m.P];
		for(int i = 0; i < m.P; i ++){
			T[i] = new Tasks(m, i);
		}
		for(int i = 0; i < m.P; i ++){
			T[i].start();
		}
	}
	public static void main(String[] args) {
		RunTask();
	}
}
