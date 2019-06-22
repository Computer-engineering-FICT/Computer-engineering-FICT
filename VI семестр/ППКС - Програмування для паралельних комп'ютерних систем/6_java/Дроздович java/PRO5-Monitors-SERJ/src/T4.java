public class T4 extends Tx {
    public T4(Data d, int n) {
        super(d, n);
    }

    public void run() {
    	System.out.println("Задача T" + num + " стартовала!"); 
    	
    	//1.	Ввод MO, a
    	MOx = input();
    	dat.writeMO(MOx);
    	ax = 1;
    	dat.writea(ax);
    	//2.	Cигнал задачам Т1, Т2, Т3 о завершении ввода
    	dat.InputSignal();
    	//3.	Ожидание ввода в задачах Т1, Т3
    	dat.InputSynchro();
        //4.	Копирование MO1 := MO, alfa1 := alfa, MB1 := MB
    	ax = dat.copya();
    	MBx = dat.copyMB();
    	MOx = dat.copyMO();
        //5.	Cчёт MAH = MB1 * MCH + alfa1 * MO1 * MXH
    	process();
        //6.	Сигнал задаче Т3 о завершении счёта MА 
    	dat.CalcEndSignal();
        
        System.out.println("Задача T" + num + " финишировала!");
    }
}
