import java.io.Serializable;
// Використовується для серіалізації класу Weapons

public class Weapons implements Serializable{
	private String name;	 		// Назва (агреговане поле)		
	private String type; 			// Тип (агреговане поле)
	private String calibre; 		// Калібр (агреговане поле)	
	private short length;			// Довжина (міліметрів)
	private float mass;				// Маса (кілограм)
	private byte magazine;			// Розмір магазину (набоїв)
	private short shootingSpeed;	// Швидкість стрільби (пострілів/хвилину)
	private short year;				// Рік виготовлення
	// Наступні поля не будуть серіалізуватися
	transient private Weapons next;			// Наступний запис
	transient private Weapons previous;		// Минулий запис
	
	/* Методи GET та SET для всіх полів */
	public final void setName(String name){
		if (name == null){ // Обробка виняткової ситуації
			throw new NullPointerException("Помилка! Назва зброї null");
		} else {
			this.name = name;
		}
	}
	
	public final String getName(){
		return name;
	}
	
	public final void setType(String type){
		if (type == null){ // Обробка виняткової ситуації
			throw new NullPointerException("Помилка! Тип зброї null");
		} else {
			this.type = type;
		}
	}
	
	public final String getType(){
		return type;
	}

	public final void setCalibre(String calibre){
		if (calibre == null){ // Обробка виняткової ситуації
			throw new NullPointerException("Помилка! Калібр зброї null");
		} else {
			this.calibre = calibre;
		}
	}
	
	public final String getCalibre(){
		return calibre;
	}
	
	public final void setLength(short length){
		if ((length > 5000) || (length < 0)){ // Обробка виняткової ситуації
			throw new IndexOutOfBoundsException("Помилка! Невірна довжина зброї");
		} else {
			this.length = length;
		}	
	}
	
	public final short getLength(){
		return length;
	}
	
	public final void setMass(float mass){
		if ((mass < 200) && (mass >= 0)){ // Обробка виняткової ситуації
			this.mass = mass;
		} else {
			throw new IndexOutOfBoundsException("Помилка! Неможлива маса зброї");
		}
	}
	
	public final float getMass(){
		return mass;
	}

	public final void setMagazine(byte magazine){
		if (magazine >= 0){ // Обробка виняткової ситуації
			this.magazine = magazine;
		} else {
			throw new IndexOutOfBoundsException("Помилка! Нереальний розмір магазину");
		}
	}
	
	public final byte getMagazine(){
		return magazine;
	}	
	
	public final void setShootingSpeed(short shootingSpeed){
		if ((shootingSpeed > 2500) || (shootingSpeed < 0)){ // Обробка виняткової ситуації
			throw new IndexOutOfBoundsException("Помилка! Неправильна швидкість стрільби зброї");
		} else {
			this.shootingSpeed = shootingSpeed;
		}
	}
	
	public final short getShootingSpeed(){
		return shootingSpeed;
	}		

	public final void setYear(short year){
		// Змінна currentYear зберігає значення поточного року
		short currentYear = (short)Math.round(System.currentTimeMillis()/1000/3600/24/365.25 + 1970);
		if ((year <= currentYear) && (year > 1800)){ // Обробка виняткової ситуації
			this.year = year;
		} else {
			throw new IndexOutOfBoundsException("Помилка! Некоректний рік виготовлення зброї");
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
	
	/* Конструктори */
	public Weapons(){
	// Конструктор за замовчуванням	
		this((short)1000, 5f, (byte)10, (short)600);
		setName("Невідома зброя");		
		setYear((short)2000);
	}
	public Weapons(short wLength, float wMass, byte wMagazine, short wShootingSpeed){
	// Конструктор для основних полів
		setName("Безіменна зброя");
		setType("Не задано тип");
		setCalibre("Невідомий калібр");		
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
	// Конструктор для всіх полів
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

	/* Метод виведення інформації на екран */
	public void onScreen(){
		String temp = "| " + getName() + " | " + getType() + " | " + getCalibre() + " | " + getLength() + " мм | " 
			+ getMass() + " кг | " + getMagazine() + " шт | " + getShootingSpeed()  + " шт/хв | " + getYear() + " рік |";
		System.out.println(temp);
		System.out.println("------------------------------------------------------------------------------");
	}
}

