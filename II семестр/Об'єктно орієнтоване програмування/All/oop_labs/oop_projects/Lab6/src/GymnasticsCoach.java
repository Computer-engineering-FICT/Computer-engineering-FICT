import java.util.Arrays;


public class GymnasticsCoach extends Sportsmen { //���������� ��� (��������� �����������)
	private int experience; //���� ������(����)
	private String education; //�� ����� ��� �������, �����
	
	//������������
	public GymnasticsCoach(String fName, String lName, int age, String sex, String rank, String sport, String country, String education, int experience) {
		super(fName, lName, age, sex, rank, sport, country);
		setEducation(education);
		setExperience(experience);
	}
	public GymnasticsCoach(){
		this("��'�", "�������", 18, "�����", "������", "��� ������", "������", "�������������", 0);
	}
	
	public void sortByLName(Sportsmen[] array) {
		Arrays.sort(array, new CompareLName());
	}
	public void sortByAge(Sportsmen[] array) {
		Arrays.sort(array, new CompareAge());
	}
	
	//������ �������
	public void setEducation(String education) {
		this.education = education;
	}
	public String getEducation() {
		return education;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}
	public int getExperience() {
		return experience;
	}

}
