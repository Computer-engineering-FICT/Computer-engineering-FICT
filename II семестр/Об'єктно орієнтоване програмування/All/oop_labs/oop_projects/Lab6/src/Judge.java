import java.util.Arrays;


public class Judge extends Sportsmen { //���� ������
	private String duties; //��������
	private String law; //�����
	
	//������������
	public Judge(String fName, String lName, int age, String sex, String rank, String sport, String country, String duties, String law) {
		super(fName, lName, age, sex, rank, sport, country);
		setDuties(duties);
		setLaw(law);
	}
	public Judge(){
		this("��'�", "�������", 18, "�����", "������", "��� ������", "������", "������������� ���������� ������ ���", "���� �� ����� ������������ ���� ��������");
	}
	
	public void sortByLName(Sportsmen[] array) {
		Arrays.sort(array, new CompareLName());
	}
	public void sortByAge(Sportsmen[] array) {
		Arrays.sort(array, new CompareAge());
	}
	
	//������ �������
	public void setDuties(String duties) {
		this.duties = duties;
	}
	public String getDuties() {
		return duties;
	}
	public void setLaw(String law) {
		this.law = law;
	}
	public String getLaw() {
		return law;
	}

}
