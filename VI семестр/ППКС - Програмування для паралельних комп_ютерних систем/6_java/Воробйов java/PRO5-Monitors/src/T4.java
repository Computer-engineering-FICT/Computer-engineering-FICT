public class T4 extends Tx {
    public T4(Data d, int n) {
        super(d, n);
    }

    public void run() {
    	System.out.println("������ T" + num + " ����������!"); 
    	
    	//1.	���� MB, MZ, ME, MR,	a
    	//2.	����������� a4:=a, MZ4:=MZ, MR4:=MR   
    	Lab5.MB = input();
    	Lab5.ME = input();
    	MZx = input();
    	MRx = input();
    	ax = 1;
    	dat.writeOP(MRx, MZx, ax);
    	
    	//3.	C����� ������� �1, �2, �3 � ���������� �����
    	dat.InputSignal();
    	//4.	���� MAH = (MBH*MZ4*a4) + MEH*MR4
    	process();
    	//5.	������ ������ �1 � ����� �����             
    	dat.CalcEndSignal();
        
        System.out.println("������ T" + num + " ������������!");
    }
}
