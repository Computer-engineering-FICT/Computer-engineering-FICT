public class T2 extends Tx {
    public T2(Data d, int n) {
        super(d, n);
    }

    public void run() {
    	System.out.println("Задача T" + num + " стартовала!"); 
    	
    	//1.	Ожидание ввода в задаче Т1, Т3, T4
        dat.InputSynchro();
        //2.	Копирование a2:=a, MO2:=MO, MB2:=MB  
    	ax = dat.copya();
    	MBx = dat.copyMB();
    	MOx = dat.copyMO();
        //3.	Cчёт MAH = MB2 * MCH + alfa2 * MO2 * MXH
        process();
        //4.	Сигнал задаче Т3 о завершении счёта MА
        dat.CalcEndSignal();
        
        System.out.println("Задача T" + num + " финишировала!");
    }
}
