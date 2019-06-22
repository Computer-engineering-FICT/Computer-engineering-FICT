public class T2 extends Tx {
    public T2(Data d, int n) {
        super(d, n);
    }

    public void run() {
    	System.out.println("Задача T" + num + " стартовала!"); 

    	//1.	Ожидание ввода в задаче Т4
        dat.InputSynchro();
        //2.	Копирование a2:=a, MZ2:=MZ, MR2:=MR  
        MCx = dat.copyMC();
        ax  = dat.copya();
        //3.	Счёт MAH = MBH + a2 * (MC2 * MZH)
        process();
        //4.	Сигнал задаче Т4 о конце счёта
        dat.CalcEndSignal();
        
        System.out.println("Задача T" + num + " финишировала!");
    }
}
