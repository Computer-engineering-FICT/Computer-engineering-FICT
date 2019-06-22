
public class Sportsmen {
	private String fName;
	private String lName;
	private int age;
	private String sex;
	private String rank;
	private Sport osport = new Sport();
	private Country ocountry = new Country();
	private Sportsmen next;

	
	public Sportsmen(String fName, String lName, int age, String sex, String rank, String sport, String country) {
		setFName(fName);
		setLName(lName);
		setAge(age);
		setSex(sex);
		setRank(rank);
		osport.setSport(sport);
		ocountry.setCountry(country);
		setNext(null);
	}
	public Sportsmen(String fName, String lName, int age, String sex) {
		this(fName, lName, age, sex, "Мастер спорту", "Біатлон", "Україна");
	}
	public Sportsmen(String fName, String lName, int age) {
		this(fName, lName, age, "Жінка");
	}
	public Sportsmen(String fName, String lName) {
		this(fName, lName, 24);
	}
	public Sportsmen() {
		this("Віта", "Семеренко");
	}
	
	public final void printAll(){
		System.out.println("FName: " + getFName());
		System.out.println("LName: " + getLName());
		System.out.println("Age: " + getAge());
		System.out.println("Sex: " + getSex());
		System.out.println("Rank: " + getRank());
		System.out.println("Sport: " + getSport());
		System.out.println("Country: " + getCountry());
		System.out.println("");
	}
	
	public final void setFName(String fn) {
		fName = fn;
	}
	public final void setLName(String ln) {
		lName = ln;
	}
	public final void setAge(int a) {
		age = a;
	}
	public final void setSex(String h) {
		sex = h;
	}
	public final void setRank(String r) {
		rank = r;
	}
	public final void setSport(String s) {
		osport.setSport(s);
	}
	public final void setCountry(String c) {
		ocountry.setCountry(c);
	}
	
	public final String getFName() {
		return fName;
	}
	public final String getLName() {
		return lName;
	}
	public final int getAge() {
		return age;
	}
	public final String getSex() {
		return sex;
	}
	public final String getRank() {
		return rank;
	}
	public final String getSport() {
		return osport.getSport();
	}
	public final String getCountry() {
		return ocountry.gerCountry();
	}
	public void setNext(Sportsmen next) {
		this.next = next;
	}
	public Sportsmen getNext() {
		return next;
	}
}
