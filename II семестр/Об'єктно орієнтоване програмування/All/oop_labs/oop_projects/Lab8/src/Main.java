//import java.io.File;
//import java.io.FileNotFoundException;
//import java.io.IOException;
//
//
//public class Main {
//
//	public static void main(String[] args) { 
//			//throws FileNotFoundException, NullPointerException, IOException,
//			//	ClassNotFoundException
//		Sportsmen sp1 = new Sportsmen("���", "��������", 29, "Ƴ���", 
//				"4-� ������ ��������� ��������", "��������� ��������",
//				"������");
//		Sportsmen sp2 = new Sportsmen("�����", "���������", 27, "Ƴ���",
//				"��������� �������� �������� ���������� ����", "�������" +
//				" ���������",
//				"������");
//		Sportsmen sp3 = new Sportsmen("�����", "������", 30, "������", 
//				"���������� ������ ������ ���", "������", "����");
//		SportsmenList list = new SportsmenList();
//		list.add(sp1);
//		list.add(sp2);
//		list.add(sp3);
//		//System.out.println("������: \n");
//		//list.listOnScreen();
//		
//		FileSportsmen fsp = new FileSportsmen();
//		//fsp.saveList(list, "C:/sportsmen.dat");
//		//fsp.loadList("C:/sportsmen.dat");
//		
//		FileSportsmen fsp2 = new FileSportsmen();
//		Sportsmen [] array = new Sportsmen[3];
//		array[0] = sp1;
//		array[1] = sp2;
//		array[2] = sp3;
//		fsp2.saveSportsmen(array, "C:/sportsmen.dat");
//		fsp2.loadSportsmen("C:/sportsmen.dat");
//		System.out.println(array[1]);
//	}
//
//}
