public class T3 extends Tx {
    public T3(Data d, int n) {
        super(d, n);
    }

    public void run() {
        //1.	���� M�
    	Lab5.MC = input();
        //2.	C����� ������� �1, �2, �4 � ���������� �����
        dat.InputSignal();
        //3.	�������� ����� � ������� �1, �4
        dat.InputSynchro();
        //4.	����������� MO1 := MO, alfa1 := alfa, MB1 := MB
    	ax = dat.copya();
    	MBx = dat.copyMB();
    	MOx = dat.copyMO();
        //5.	C��� MAH = MB1 * MCH + alfa1 * MO1 * MXH
        process();
        //6.	����� ���������� ����� MA � ������� �1, �2, �4 
        dat.OutputSynchro();
    	//7.	����� ��             
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
