import java.util.*;

/**
 * ���������� ����, �� ����� �������� <code>SportsmenList</code> 
 * � ����� ���� ��������� �� �������� �����.
 */

public class Main {
	public static void main(String[] args) {
		SportsmenList list1 = new SportsmenList();
		System.out.println("��������� ������:");
		list1.listOnScreen();
		System.out.println();
		
		SportsmenList list = new SportsmenList(new Sportsmen());
		System.out.println("��������� ������:");
		list.listOnScreen();
		
		ArrayList<Sportsmen> arraylist = new ArrayList<Sportsmen>();
		arraylist.add(new Sportsmen("���-�����", "����������", 36, "������", "���������� ������ ������", "���� �����", "�������"));
		list.add(arraylist);
		System.out.println("��������� ������ ArrayList:");
		list.listOnScreen();
		
		Sportsmen sportsmen = new Sportsmen("���", "��������", 29, "Ƴ���", "4-� ������ ��������� ��������", "��������� ��������", "������");
		list.replace(1, sportsmen);
		list.add(new Sportsmen("�����", "���������", 27, "Ƴ���", "��������� �������� �������� ���������� ����", "������� ���������", "������"));
		list.add(new Sportsmen("�����", "������", 30, "������", "���������� ������ ������ ���", "������", "����"));
		System.out.println("����� ����� ������� �� sportsmen(��� ��������):");
		list.listOnScreen();
		
		list.remove(1, 2);
		System.out.println("������ ���� ��������� ����� � ����� �������");
		list.listOnScreen();	
	}
}