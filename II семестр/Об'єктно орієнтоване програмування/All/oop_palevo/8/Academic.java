import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.Calendar;

/**
 * Sample class that describes an university teacher.
 * Derived from <code>Person</code> class.
 * Contains 5 properties in addition to base class (7 total).
 * Contains 3 constructors. Has getters and setters for all properties.
 * Implements <code>Comparable&lt;Academic&gt;</code> interface.
 * Implements java.io.Externalizable interface used for custom serialization.
 * @author Glushko Olga
 */
public abstract class Academic extends Person implements Comparable<Academic>, Externalizable {
	private String facultee;
	private String cathedra;
	private String position;
	private int experience;
	private int workbooksNumber;

	/**
	 * A simplest constructor without parameters
	 */
	public Academic() {
		experience = 0;
	}
	
	/**
	 * Simple constructor with 2 parameters.
	 * Leaves other fields blank.
	 * @param surname value for <code>surname</code> property
	 * @param name value for <code>name</code> property
	 */
	public Academic(String surname, String name) {
		super(surname, name);
		experience = 0;
	}
	
	/**
	 * Constructor that initializes most of object's properties. Passes some properties to constructor of parent class.
	 * @param surname value for <code>surname</code> property
	 * @param name value for <code>name</code> property
	 * @param facultee value for <code>facultee</code> property
	 * @param cathedra value for <code>cathedra</code> property
	 * @param position value for <code>position</code> property
	 */
	public Academic(String surname, String name, String facultee, String cathedra, String position) {
		super(surname, name);
		this.facultee = facultee;
		this.cathedra = cathedra;
		this.position = position;
	}

	/**
	 * @return the experience
	 */
	public int getExperience() {
		return experience;
	}

	/**
	 * @param experience the experience to set
	 */
	public void setExperience(int experience) {
		this.experience = experience;
	}

	/**
	 * @return value of <code>facultee</code> property
	 */
	public String getFacultee() {
		return facultee;
	}

	/**
	 * @param facultee facultee name to set
	 */
	public void setFacultee(String facultee) {
		this.facultee = facultee;
	}

	/**
	 * @return the cathedra name
	 */
	public String getCathedra() {
		return cathedra;
	}

	/**
	 * @param cathedra cathedra name to set
	 */
	public void setCathedra(String cathedra) {
		this.cathedra = cathedra;
	}

	/**
	 * Return the position of employee (assistant, senior assistant, etc). 
	 * @return the position
	 */
	public String getPosition() {
		return position;
	}

	/**
	 * @param position the position to set
	 */
	public void setPosition(String position) {
		this.position = position;
	}
	

	/**
	 * @return the number of academic's published workbooks
	 */
	public int getWorkbooksNumber() {
		return workbooksNumber;
	}

	/**
	 * Sets the number of academic's published workbooks. 
	 * @param workbooksNumber the number of published workbooks to set
	 */
	public void setWorkbooksNumber(int workbooksNumber) {
		this.workbooksNumber = workbooksNumber;
	}

	/**
	 * Checks if an academic is ready to promotion to higher position.
	 * Since it depends on scientific and methodical publications, it will be defined in
	 * derived classes which also implements a <code>Scientist</code> interface.
	 * @return true if an academic is ready to promotion to higher position, false if not
	 */
	public abstract boolean canPromotePosition();

	/**
	 * Compares two objects using "natural" order.
	 * Natural order means comparison by facultee, cathedra, surname, name
	 * and birthdate.<br>
	 * This method belongs to implementation of <code>Comparable&lt;Academic&gt;</code> interface
	 * @param academic another academic to compare to
	 * @return 0 if this object equals to, 1 if greater than, and -1 if less than <code>academic</code> object supplied as parameter 
	 */
	public int compareTo(Academic academic) {
		int result;
		result = facultee.compareTo(academic.getFacultee());
		if (result != 0)
			return result;
		result = cathedra.compareTo(academic.getCathedra());
		if (result != 0)
			return result;
		result = surname.compareTo(academic.getSurname()); // surname is protected in base class, so we can access it directly
		if (result != 0)
			return result;
		result = name.compareTo(academic.getName());
		if (result != 0)
			return result;
		return getBirthdate().compareTo(academic.getBirthdate()); // call getBirthdate() since birthdate is a private field of base class
	}

	@Override
	public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
		surname = in.readUTF();
		name = in.readUTF();
		facultee = in.readUTF();
		cathedra = in.readUTF();
		position = in.readUTF();
		experience = in.readInt();
		workbooksNumber = in.readInt();
		int date = in.readInt(); // date serialized as single integer, see writeExternal()
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, date & 0x1F); // day in lower 5 bits
		cal.set(Calendar.MONTH, (date >> 5) & 0x0F); // month in middle 4 bits
		cal.set(Calendar.YEAR, date >> 9); // year in higher bits
		setBirthdate(cal.getTime());
	}

	@Override
	public void writeExternal(ObjectOutput out) throws IOException {
		out.writeUTF(surname);
		out.writeUTF(name);
		out.writeUTF(facultee);
		out.writeUTF(cathedra);
		out.writeUTF(position);
		out.writeInt(experience);
		out.writeInt(workbooksNumber);
		/* Date serialized as single integer:
		 * since day isn't greater than 31, it can be stored in 5 (lower) bits
		 * next 4 bits is enough for month
		 * and remaining can store year. 
		 * */
		Calendar cal = Calendar.getInstance();
		cal.setTime(getBirthdate());
		int date = cal.get(Calendar.DAY_OF_MONTH); 
		date += cal.get(Calendar.MONTH) << 5;
		date += cal.get(Calendar.YEAR) << 9;
		out.writeInt(date);
	}

}
