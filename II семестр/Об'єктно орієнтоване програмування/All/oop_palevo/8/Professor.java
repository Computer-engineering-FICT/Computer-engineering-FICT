import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

/**
 * 
 */

/**
 * Sample class for academic teacher on "associate professor" position.
 * Implements abstract <code>canPromotePosition()</code> method
 * from base class. Implements <code>Scientist</code> interface.
 * @author Glushko Olga
 */
public class Professor extends Academic implements Scientist {

	private final static String RANK = "Professor";
	private final static String DEGREE = "Doctor";
	private String academicDegree;
	private String academicRank;
	private int publicationsNumber;


	/**
	 * 
	 */
	public Professor() {
		academicRank = RANK;
		academicDegree = DEGREE;
	}

	/**
	 * @param surname
	 * @param name
	 */
	public Professor(String surname, String name) {
		super(surname, name);
		academicRank = RANK;
		academicDegree = DEGREE;
	}

	/**
	 * @param surname
	 * @param name
	 * @param facultee
	 * @param cathedra
	 * @param position
	 */
	public Professor(String surname, String name, String facultee,
			String cathedra, String position) {
		super(surname, name, facultee, cathedra, position);
		academicRank = RANK;
		academicDegree = DEGREE;
	}

	/* (non-Javadoc)
	 * @see Academic#canPromotePosition()
	 */
	@Override
	public boolean canPromotePosition() {
		return false; // Maybe there is no scientific promotion for professor 
	}

	/* (non-Javadoc)
	 * @see Scientist#getAcademicDegree()
	 */
	@Override
	public String getAcademicDegree() {
		return academicDegree;
	}

	/* (non-Javadoc)
	 * @see Scientist#getAcademicRank()
	 */
	@Override
	public String getAcademicRank() {
		return academicRank;
	}

	/* (non-Javadoc)
	 * @see Scientist#getPublicationsNumber()
	 */
	@Override
	public int getPublicationsNumber() {
		return publicationsNumber;
	}

	/* (non-Javadoc)
	 * @see Scientist#setAcademicDegree(java.lang.String)
	 */
	@Override
	public void setAcademicDegree(String degree) {
		this.academicDegree = degree;
	}

	/* (non-Javadoc)
	 * @see Scientist#setAcademicRank(java.lang.String)
	 */
	@Override
	public void setAcademicRank(String rank) {
		this.academicRank = rank;
	}

	/* (non-Javadoc)
	 * @see Scientist#setPublicationsNumber(int)
	 */
	@Override
	public void setPublicationsNumber(int num) {
		this.publicationsNumber = num;

	}

	@Override
	public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
		super.readExternal(in);
		academicDegree = in.readUTF();
		academicRank = in.readUTF();
		publicationsNumber = in.readInt();
	}
	
	@Override
	public void writeExternal(ObjectOutput out) throws IOException {
		super.writeExternal(out);
		if (academicDegree != null)
			out.writeUTF(academicDegree);
		else
			out.writeUTF("");
		if (academicDegree != null)
			out.writeUTF(academicRank);
		else
			out.writeUTF("");
		if (academicDegree != null)
		out.writeInt(publicationsNumber);
	}

}
