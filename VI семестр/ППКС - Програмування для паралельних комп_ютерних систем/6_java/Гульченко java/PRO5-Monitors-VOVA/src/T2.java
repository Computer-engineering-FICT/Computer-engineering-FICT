public class T2 extends Tx {
    public T2(Data d, int n) {
        super(d, n);
    }

    public void run() {
    	System.out.println("������ T" + num + " ����������!"); 

    	//1.	�������� ����� � ������ �4
        dat.InputSynchro();
        //2.	����������� a2:=a, MZ2:=MZ, MR2:=MR  
        MCx = dat.copyMC();
        ax  = dat.copya();
        //3.	���� MAH = MBH + a2 * (MC2 * MZH)
        process();
        //4.	������ ������ �4 � ����� �����
        dat.CalcEndSignal();
        
        System.out.println("������ T" + num + " ������������!");
    }
}
