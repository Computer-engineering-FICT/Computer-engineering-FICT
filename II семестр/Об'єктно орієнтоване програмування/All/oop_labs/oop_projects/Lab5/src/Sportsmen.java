
public class Sportsmen {
	private String fname;
	private String lname;
	private int age;
	private String sex;
	private String rank;
	private Sport osport = new Sport();
	private Country ocountry = new Country();
	
	public Sportsmen(String fname, String lname, int age, String sex, String rank, String sport, String country) {
		setFname(fname);
		setLname(lname);
		setAge(age);
		setSex(sex);
		setRank(rank);
		osport.setSport(sport);
		ocountry.setCountry(country);
	}
	public Sportsmen(String fname, String lname, int age, String sex) {
		this(fname, lname, age, sex, "Мастер спорту", "Біатлон", "Україна");
	}
	public Sportsmen(String fname, String lname, int age) {
		this(fname, lname, age, "Жінка");
	}
	public Sportsmen(String fname, String lname) {
		this(fname, lname, 24);
	}
	public Sportsmen() {
		this("Віта", "Семеренко");
	}
	
	public final void setFname(String fn) {
		fname = fn;
	}
	public final void setLname(String ln) {
		lname = ln;
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
	
	public final String getFname() {
		return fname;
	}
	public final String getLname() {
		return lname;
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
}
