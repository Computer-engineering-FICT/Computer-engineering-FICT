public class T4 extends Tx {
    public T4(Data d, int n) {
        super(d, n);
    }

    public void run() {
    	System.out.println("������ T" + num + " ����������!"); 
    	
    	//1.	���� MO, a
    	MOx = input();
    	dat.writeMO(MOx);
    	ax = 1;
    	dat.writea(ax);
    	//2.	C����� ������� �1, �2, �3 � ���������� �����
    	dat.InputSignal();
    	//3.	�������� ����� � ������� �1, �3
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
