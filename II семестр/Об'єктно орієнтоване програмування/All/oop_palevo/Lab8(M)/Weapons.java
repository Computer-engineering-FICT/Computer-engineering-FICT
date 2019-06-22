import java.io.Serializable;
// ��������������� ��� ���������� ����� Weapons

public class Weapons implements Serializable{
	private String name;	 		// ����� (���������� ����)		
	private String type; 			// ��� (���������� ����)
	private String calibre; 		// ����� (���������� ����)	
	private short length;			// ������� (�������)
	private float mass;				// ���� (�������)
	private byte magazine;			// ����� �������� (�����)
	private short shootingSpeed;	// �������� ������� (�������/�������)
	private short year;				// г� ������������
	// ������� ���� �� ������ �������������
	transient private Weapons next;			// ��������� �����
	transient private Weapons previous;		// ������� �����
	
	/* ������ GET �� SET ��� ��� ���� */
	public final void setName(String name){
		if (name == null){ // ������� ��������� ��������
			throw new NullPointerException("�������! ����� ���� null");
		} else {
			this.name = name;
		}
	}
	
	public final String getName(){
		return name;
	}
	
	public final void setType(String type){
		if (type == null){ // ������� ��������� ��������
			throw new NullPointerException("�������! ��� ���� null");
		} else {
			this.type = type;
		}
	}
	
	public final String getType(){
		return type;
	}

	public final void setCalibre(String calibre){
		if (calibre == null){ // ������� ��������� ��������
			throw new NullPointerException("�������! ����� ���� null");
		} else {
			this.calibre = calibre;
		}
	}
	
	public final String getCalibre(){
		return calibre;
	}
	
	public final void setLength(short length){
		if ((length > 5000) || (length < 0)){ // ������� ��������� ��������
			throw new IndexOutOfBoundsException("�������! ������ ������� ����");
		} else {
			this.length = length;
		}	
	}
	
	public final short getLength(){
		return length;
	}
	
	public final void setMass(float mass){
		if ((mass < 200) && (mass >= 0)){ // ������� ��������� ��������
			this.mass = mass;
		} else {
			throw new IndexOutOfBoundsException("�������! ��������� ���� ����");
		}
	}
	
	public final float getMass(){
		return mass;
	}

	public final void setMagazine(byte magazine){
		if (magazine >= 0){ // ������� ��������� ��������
			this.magazine = magazine;
		} else {
			throw new IndexOutOfBoundsException("�������! ���������� ����� ��������");
		}
	}
	
	public final byte getMagazine(){
		return magazine;
	}	
	
	public final void setShootingSpeed(short shootingSpeed){
		if ((shootingSpeed > 2500) || (shootingSpeed < 0)){ // ������� ��������� ��������
			throw new IndexOutOfBoundsException("�������! ����������� �������� ������� ����");
		} else {
			this.shootingSpeed = shootingSpeed;
		}
	}
	
	public final short getShootingSpeed(){
		return shootingSpeed;
	}		

	public final void setYear(short year){
		// ����� currentYear ������ �������� ��������� ����
		short currentYear = (short)Math.round(System.currentTimeMillis()/1000/3600/24/365.25 + 1970);
		if ((year <= currentYear) && (year > 1800)){ // ������� ��������� ��������
			this.year = year;
		} else {
			throw new IndexOutOfBoundsException("�������! ����������� �� ������������ ����");
		} 		
	}
	
	public final short getYear(){
		return year;
	}
	
	public final void setNext(Weapons next){
		this.next = next;
	}
	
	public final Weapons getNext(){
		return next;
	}
	
	public final void setPrevious(Weapons previous){
		this.previous = previous;
	}
	
	public final Weapons getPrevious(){
		return previous;
	}
	
	/* ������������ */
	public Weapons(){
	// ����������� �� �������������	
		this((short)1000, 5f, (byte)10, (short)600);
		setName("������� �����");		
		setYear((short)2000);
	}
	public Weapons(short wLength, float wMass, byte wMagazine, short wShootingSpeed){
	// ����������� ��� �������� ����
		setName("�������� �����");
		setType("�� ������ ���");
		setCalibre("�������� �����");		
		setLength(wLength);
		setMass(wMass);
		setMagazine(wMagazine);
		setShootingSpeed(wShootingSpeed);
		setYear((short)1986);
		setNext(null);	
		setPrevious(null);
	}
	public Weapons(String wName, String wType, String wCalibre, short wLength, float wMass, byte wMagazine,
			short wShootingSpeed, short wYear){
	// ����������� ��� ��� ����
		setName(wName);
		setType(wType);
		setCalibre(wCalibre);		
		setLength(wLength);
		setMass(wMass);
		setMagazine(wMagazine);
		setShootingSpeed(wShootingSpeed);
		setYear(wYear);
		setNext(null);	
		setPrevious(null);
	}

	/* ����� ��������� ���������� �� ����� */
	public void onScreen(){
		String temp = "| " + getName() + " | " + getType() + " | " + getCalibre() + " | " + getLength() + " �� | " 
			+ getMass() + " �� | " + getMagazine() + " �� | " + getShootingSpeed()  + " ��/�� | " + getYear() + " �� |";
		System.out.println(temp);
		System.out.println("------------------------------------------------------------------------------");
	}
}

