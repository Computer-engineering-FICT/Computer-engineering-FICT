package Minimization;

import java.util.ArrayList;
import java.util.StringTokenizer;

public class Kwaine_Minimization {
	
	public static double count_type; //���������� ������������������ ������
	public static double count_mini; //���������� ���������������� ������
	public static double block_type; //���������� ��������� �, ��� �� �����������
	public static double block_mini; //���������� ��������� �, ��� ����� �����������
	
	//������: "0000v0110v10-1" ���������
	//s - ������ ��� �����������
	public static String minimize(String s) {
		StringTokenizer st = new StringTokenizer(s,"v"); //����������� ��� ����������
		ArrayList<String[]> al = new ArrayList<String[]>();
		count_type = 0;
		block_type = 0; //���������������� "��������" ����� ����
		block_mini = 0; //�� ������������� �����������
		
		int count = st.countTokens(); //��������� ���������� ���������
		
		for (int i = 0; i < count; i++) {
			String[] ss = {st.nextToken(), "0"}; //�������� ������ ������, ����������� 
			al.add(ss); 			//�������� ���������� � �������� ����������, 
			count_type += ss[0].length();//0 - �� ������, 1 - ������
		}
		count_mini = 0;
		block_type = 2 * count - 1;
		
		
		
		//1.4. ���� �� ��������� ��������� ��� ����������, ����� ��������� ���������� �� ���� �����/������� ������� � �����. � ������������ ��-�� ����� ���������� ������������ ����� � ����.
		//1.5. ����� ������ �������������, ����� ��������� ��������� ����� ������.

		for (int i = 0; i < al.size(); i++) {
			//1.2. �� ������ ������ ����������/����...
			char[] first = al.get(i)[0].toCharArray();
			//...� �������� �������� �� ����� ������������/������� ������� ��������� ������ �� ������.
			for (int j = i + 1; j < al.size(); j++) {
				char[] second = al.get(j)[0].toCharArray();
				boolean flag = false, toExit = false;
				int place = -1;
				for (int z = 0; z < second.length & !toExit; z++) {
					//���� ��� ���������� ����� � ��� �� ������
					boolean iff = ((first[z] == '-') & (second[z] == '-')) 
						| ((first[z] != '-') & (second[z] != '-'));
					
					if (iff) {
						//���� ��������� �������� � ���� ����� ������������...
						if ((first[z] != second[z]) & !flag) {
							//...�������� ����, ��� �� �������� ����� ��� ����������
							place = z; flag = true; 
						} else if ((first[z] != second[z]) & flag) { //���� ��� ��� �������
							place = -1; toExit = true; //�� ������ �� ��������, ������� �� �����
						}
					} else {
						toExit = true; //��� ��� ���� ��� ���������� ������ �����. �������� 0-0 � -00
					}
				}
				
				//���� �� �� � ��� ���� �������, ��� ���������� ��������
				if (!toExit & (place != -1)) { 
					second[place] = '-'; //�� ����� ������ ��� ������ ������� "-"
					al.get(i)[1] = "1"; //� ��������� ��� ���������� ��� ��������
					al.get(j)[1] = "1";
					String buff = "";
					for (int z = 0; z < second.length; z++) {
						buff += second[z];
					}
					String[] ss = {buff , "0"}; //��������� ����� ����������/���� � ������
					al.add(ss);
				}
			}
		}
		//����� ����������! ���! ���� ��� ���� �������������!
		String buff = "";
		
		ArrayList<String> implicants = new ArrayList<String>();
		for (int i = 0; i < al.size(); i++) {
			if (al.get(i)[1] == "0") { //��� ������������ ����������,
				if (!implicants.contains(al.get(i)[0])) {//� ������������ � ���� ��
					implicants.add(al.get(i)[0]); //���������� ��������!
				}
			}
		}
		
		//����� �������������! 
		for (int i = 0; i < implicants.size() & !al.isEmpty(); i++) {
			//������ ����������
			char[] first = implicants.get(i).toCharArray();
			for (int j = 0; j < al.size(); j++) {
				//� ������������ � ��������� ������������ ��������
				char[] second = al.get(j)[0].toCharArray();
				boolean toExit = false;
				for (int z = 0; z < second.length & !toExit; z++) {
					boolean iff = (first[z] == '-'); //���� � ���� ����� �������
					//����� ���� ��� ���������, �� �� �����
					
					if (!iff & (first[z] != second[z])) { //���� � ���� �� ������ ��������
						toExit = true; //� � ���� �� ���� ������, ������, ���, ���������� �� ��� �����
					} //��������� �����.
				} //��� � ����������... �����...
				
				if (!toExit) { //�� ���� �� �� ���������!
					al.remove(j); //������� �������� ����!
				}
			}
			//��� ����������� ������������� ������ ���������������� �������.
			if (buff != "") {
				buff += "v";
				block_mini++;
			}
			buff += implicants.get(i);
			block_mini++;
		}

		char[] ww = buff.toCharArray();
		for (int i = 0; i < ww.length; i++) {
			if ((ww[i] != 'v') & (ww[i] != '-'))
				count_mini++;
		}
		
		return buff;
	}
	
	//������������� ����������� �� ���������� ������
	public static double getTermEfficient() {
		return count_type / count_mini;
	}
	//������������� ����������� �� ���������� ���������/������	
	public static double getBlockEfficient() {
		return block_type / block_mini;
	}
}
