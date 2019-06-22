public class T1 extends Tx {
    
    public T1(Data d, int n) {
        super(d, n);
    }
    
	public void run() {
        System.out.println("Задача T" + num + " стартовала!");
        
        //1.	Ожидание ввода в задаче Т4
        dat.InputSynchro();
        //2.	Копирование a1:=a, MZ1:=MZ, MR1:= MR  
        MRx = dat.copyMR();
        MZx = dat.copyMZ();
        ax  = dat.copya();
        //3.	Счёт MAH =(MBH*MZ1*a1) + MEH*MR1
        process();
        //4.	Ожидание окончания счёта от Т2, Т3, Т4	 
        dat.OutputSynchro();
        //5.	Вывод МА                     

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
