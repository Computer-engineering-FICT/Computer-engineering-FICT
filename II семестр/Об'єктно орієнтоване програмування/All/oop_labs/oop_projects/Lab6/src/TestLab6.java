
/**
 * 
 * ����� ����������� ���� Sportsmen
 * @author RED
 *
 */
public class TestLab6 {//���������� ����
	public static void main(String[] args) {
		Sportsmen[] array = new Sportsmen[3];	//��������� ������ ������������ �����
		//��������� ��'���� ��������� ����� Trainer
		Trainer trainer1 = new Trainer("������", "������������", 63, "���", "������ ����", "������", "������", "������", 34);
		Trainer trainer2 = new Trainer("��c����", "�������", 41, "���", "������", "������", "��������", "������������� ���������� ������ ���", 20);
		Trainer trainer3 = new Trainer("Ϻ�-�����", "����", 64, "���", "������", "����-��", "������", "�� ��� �����" ,20);
		//���������� ������
		array[0] = trainer1;
		array[1] = trainer2;
		array[2] = trainer3;
		//���������� ��� ����������
		System.out.println(" ");
		System.out.println("������1:");
		System.out.println("��'�: " + trainer1.getFName());
		System.out.println("�������: " + trainer1.getLName());
		System.out.println("³�: " + trainer1.getAge());
		System.out.println("�����: " + trainer1.getSex());
		System.out.println("����������: " + trainer1.getRank());
		System.out.println("��� ������: " + trainer1.getSport());
		System.out.println("�����: " + trainer1.getCountry());
		System.out.println("����� ����������: " + trainer1.getSportsTrain());
		System.out.println("���� ������: " + trainer1.getExperience());
		System.out.println(" ");
		System.out.println("������2:");
		System.out.println("��'�: " + trainer2.getFName());
		System.out.println("�������: " + trainer2.getLName());
		System.out.println("³�: " + trainer2.getAge());
		System.out.println("�����: " + trainer2.getSex());
		System.out.println("����������: " + trainer2.getRank());
		System.out.println("��� ������: " + trainer2.getSport());
		System.out.println("�����: " + trainer2.getCountry());
		System.out.println("����� ����������: " + trainer2.getSportsTrain());
		System.out.println("���� ������: " + trainer2.getExperience());
		System.out.println(" ");
		System.out.println("������3:");
		System.out.println("��'�: " + trainer3.getFName());
		System.out.println("�������: " + trainer3.getLName());
		System.out.println("³�: " + trainer3.getAge());
		System.out.println("�����: " + trainer3.getSex());
		System.out.println("����������: " + trainer3.getRank());
		System.out.println("��� ������: " + trainer3.getSport());
		System.out.println("�����: " + trainer3.getCountry());
		System.out.println("����� ����������: " + trainer3.getSportsTrain());
		System.out.println("���� ������: " + trainer3.getExperience());
		System.out.println(" ");
		//������� �� ����� "�������"
		trainer1.sortByLName(array);
		System.out.println("���������� �� ������� ������: ");
		for(int i = 0; i < array.length; i++){//���� ������������� ������
			System.out.println(array[i].getLName());
		}
		System.out.println(" ");
		//������� ��'���� �� ����
		trainer1.sortByAge(array);
		System.out.println("���������� �� ����: ");
		for(int i = 0; i < array.length; i++){ //���� ������������� ������
			System.out.println(array[i].getAge());
		}
		System.out.println(" ");
	}

}
