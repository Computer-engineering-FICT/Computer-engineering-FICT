import java.util.Arrays;


public class GymnasticsCoach extends Sportsmen { //інструктор ЛФК (лікувальна фізкультура)
	private int experience; //стаж роботи(років)
	private String education; //які курси ЛФК закінчив, освіта
	
	//конструктори
	public GymnasticsCoach(String fName, String lName, int age, String sex, String rank, String sport, String country, String education, int experience) {
		super(fName, lName, age, sex, rank, sport, country);
		setEducation(education);
		setExperience(experience);
	}
	public GymnasticsCoach(){
		this("ім'я", "прізвище", 18, "стать", "звання", "вид спорту", "Україна", "фізреабілітація", 0);
	}
	
	public void sortByLName(Sportsmen[] array) {
		Arrays.sort(array, new CompareLName());
	}
	public void sortByAge(Sportsmen[] array) {
		Arrays.sort(array, new CompareAge());
	}
	
	//методи доступу
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
