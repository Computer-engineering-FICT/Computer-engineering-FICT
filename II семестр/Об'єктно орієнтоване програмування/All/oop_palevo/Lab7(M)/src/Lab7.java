import java.util.*;
// ��������������� ��� ��������� ��'���� ����� ArrayList

public class Lab7 {   
	public static void main(String args[]){
		WeaponsList wList1 = new WeaponsList(new Weapons("��-74", "�������", "7.62�39 ��", (short)870, 3.8f, (byte)30, (short)650, (short)1974)); 
		tableHead();
		wList1.listOnScreen();
		
		ArrayList<Weapons> wArray = new ArrayList<Weapons>();
		wArray.add(new Weapons("���", "����������� ��������", "7.62x54R", (short)1225, 4.31f, (byte)10, (short)30, (short)1963));
		Weapons temp = new Weapons("�� ���", "����������� ��������", "9x39 ��", (short)875, 2.5f, (byte)20, (short)30, (short)1986);
		
		wList1.add(wArray);
		tableHead();
		wList1.listOnScreen();
		
		wList1.replace(1, temp);
		wList1.add(new Weapons("��", "ϳ������", "9x18 ��", (short)161, 0.73f, (byte)8, (short)500, (short)(1951)));
		tableHead();
		wList1.listOnScreen();	
		
		wList1.remove(1, 2);
		tableHead();
		wList1.listOnScreen();			
	}
	public static void tableHead(){
		System.out.println("------------------------------------------------------------------------------");		
		System.out.println("| ����� | ����� | ������� | ���� | ������� | �������������� | ����������� |");
		System.out.println("------------------------------------------------------------------------------");		
	}
}