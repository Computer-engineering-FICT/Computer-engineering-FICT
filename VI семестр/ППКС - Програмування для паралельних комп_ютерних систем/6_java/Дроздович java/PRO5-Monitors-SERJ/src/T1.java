public class T1 extends Tx {
    
    public T1(Data d, int n) {
        super(d, n);
    }
    
	public void run() {
        System.out.println("������ T" + num + " ����������!");
        
        //1.	���� �B, MX
        MBx = input();
        dat.writeMB(MBx);
        Lab5.MX = input();
        //2.	������ ������� �2, �3, �4 � ���������� ����� �B, MX  
        dat.InputSignal();
        //3.	����� �������� � T3, T4	
        dat.InputSynchro();
        //4.	����������� MO1 := MO, alfa1 := alfa, MB1 := MB
    	ax = dat.copya();
    	MBx = dat.copyMB();
    	MOx = dat.copyMO();
        //5.	C��� MAH = MB1 * MCH + alfa1 * MO1 * MXH
    	process();
        //6.	������ ������ �3 � ���������� ����� M� 
    	dat.CalcEndSignal();

        System.out.println("������ T" + num + " ������������!");
    }
}
