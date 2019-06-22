public class T4 extends Tx {
    public T4(Data d, int n) {
        super(d, n);
    }

    public void run() {
    	System.out.println("Задача T" + num + " стартовала!"); 
    	
    	//1.	Ввод MB, MZ, ME, MR,	a
    	//2.	Копирование a4:=a, MZ4:=MZ, MR4:=MR   
    	Lab5.MB = input();
    	Lab5.ME = input();
    	MZx = input();
    	MRx = input();
    	ax = 1;
    	dat.writeOP(MRx, MZx, ax);
    	
    	//3.	Cигнал задачам Т1, Т2, Т3 о завершении ввода
    	dat.InputSignal();
    	//4.	Счёт MAH = (MBH*MZ4*a4) + MEH*MR4
    	process();
    	//5.	Сигнал задаче Т1 о конце счёта             
    	dat.CalcEndSignal();
        
        System.out.println("Задача T" + num + " финишировала!");
    }
}
