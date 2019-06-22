public class T3 extends Tx {
    public T3(Data d, int n) {
        super(d, n);
    }

    public void run() {
        //1.	Ввод MС
    	Lab5.MC = input();
        //2.	Cигнал задачам Т1, Т2, Т4 о завершении ввода
        dat.InputSignal();
        //3.	Ожидание ввода в задачах Т1, Т4
        dat.InputSynchro();
        //4.	Копирование MO1 := MO, alfa1 := alfa, MB1 := MB
    	ax = dat.copya();
    	MBx = dat.copyMB();
    	MOx = dat.copyMO();
        //5.	Cчёт MAH = MB1 * MCH + alfa1 * MO1 * MXH
        process();
        //6.	Ждать завершение счёта MA в задачах Т1, Т2, Т4 
        dat.OutputSynchro();
    	//7.	Вывод МА             
    	if (Lab5.N <= 8) {
            for (int i = 0; i < Lab5.N; i++) {
                for (int j = 0; j < Lab5.N; j++) {
                    System.out.print(Lab5.MA[i][j] + "   ");
                }
                System.out.println();
            }
        }
        
        System.out.println("Задача T" + num + " финишировала!");
    }
}
