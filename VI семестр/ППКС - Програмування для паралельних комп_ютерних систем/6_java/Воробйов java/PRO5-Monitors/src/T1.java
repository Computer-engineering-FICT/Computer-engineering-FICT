public class T1 extends Tx {
    
    public T1(Data d, int n) {
        super(d, n);
    }
    
	public void run() {
        System.out.println("������ T" + num + " ����������!");
        
        //1.	�������� ����� � ������ �4
        dat.InputSynchro();
        //2.	����������� a1:=a, MZ1:=MZ, MR1:= MR  
        MRx = dat.copyMR();
        MZx = dat.copyMZ();
        ax  = dat.copya();
        //3.	���� MAH =(MBH*MZ1*a1) + MEH*MR1
        process();
        //4.	�������� ��������� ����� �� �2, �3, �4	 
        dat.OutputSynchro();
        //5.	����� ��                     

        if (Lab5.N <= 8) {
            for (int i = 0; i < Lab5.N; i++) {
                for (int j = 0; j < Lab5.N; j++) {
                    System.out.print(Lab5.MA[i][j] + "   ");
                }
                System.out.println();
            }
        }

        System.out.println("������ T" + num + " ������������!");
    }
}
