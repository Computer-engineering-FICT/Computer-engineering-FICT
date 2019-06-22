/**
 * ��'��� ����� <code>Sportsmen</code> ���� ����������.
 * ��������� �� ��'�, �������, ��, �����, ����������, ��� ������, �����.
 * ���� ������ ��� ��������� ��'����: <code>oSport</code> � <code>oCountry</code>.
 */

public class Sportsmen {
	private String fName;
	private String lName;
	private int age;
	private String sex;
	private String rank;
	private Sport oSport = new Sport();
	private Country oCountry = new Country();
	private Sportsmen next;
	private Sportsmen previous;
	
	/**
	 * ����������� �� �������������
	 */
	public Sportsmen() {
		this("³��", "���������");
	}
	
	public Sportsmen(String fName, String lName) {
		this(fName, lName, 24);
	}
	public Sportsmen(String fName, String lName, int age) {
		this(fName, lName, age, "Ƴ���");
	}
	public Sportsmen(String fName, String lName, int age, String sex) {
		this(fName, lName, age, sex, "������ ������", "�������", "������");
	}
	/**
	 * �����������, ���� ���������� �� ���
	 * @param fName ��'�
	 * @param lName �������
	 * @param age ³�
	 * @param sex �����
	 * @param rank ����������
	 * @param sport ��� ������
	 * @param country �����
	 */
	public Sportsmen(String fName, String lName, int age, String sex, String rank, String sport, String country ) {
		setFName(fName);
		setLName(lName);
		setAge(age);
		setSex(sex);
		setRank(rank);
		oSport.setSport(sport);
		oCountry.setCountry(country);
		setNext(null);	
		setPrevious(null);
	}
	
	/**
	 * ����� ��� ����� �� ����� ���������� ��� ����������
	 */
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
		oSport.setSport(s);
	}
	public final void setCountry(String c) {
		oCountry.setCountry(c);
	}
	public final void setNext(Sportsmen next){
		this.next = next;
	}
	public final void setPrevious(Sportsmen previous){
		this.previous = previous;
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
		return oSport.getSport();
	}
	public final String getCountry() {
		return oCountry.gerCountry();
	}
	public final Sportsmen getNext(){
		return next;
	}
	public final Sportsmen getPrevious(){
		return previous;
	}
}
