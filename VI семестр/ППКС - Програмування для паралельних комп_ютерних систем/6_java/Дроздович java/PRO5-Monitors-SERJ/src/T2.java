public class T2 extends Tx {
    public T2(Data d, int n) {
        super(d, n);
    }

    public void run() {
    	System.out.println("������ T" + num + " ����������!"); 
    	
    	//1.	�������� ����� � ������ �1, �3, T4
        dat.InputSynchro();
        //2.	����������� a2:=a, MO2:=MO, MB2:=MB  
    	ax = dat.copya();
    	MBx = dat.copyMB();
    	MOx = dat.copyMO();
        //3.	C��� MAH = MB2 * MCH + alfa2 * MO2 * MXH
        process();
        //4.	������ ������ �3 � ���������� ����� M�
        dat.CalcEndSignal();
        
        System.out.println("������ T" + num + " ������������!");
    }
}
