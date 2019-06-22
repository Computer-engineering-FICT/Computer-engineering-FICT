/**
 * 
 */

/**
 * Sample class for academic teacher on "associate professor" position.
 * Implements abstract <code>canPromotePosition()</code> method
 * from base class. Implements <code>Scientist</code> interface.
 * @author Glushko Olga
 */
public class Docent extends Academic implements Scientist {

	private final static String DOCENT = "Associate professor";
	private String academicDegree;
	private String academicRank;
	private int publicationsNumber;

	/**
	 * 
	 */
	public Docent() {
		this.academicRank = DOCENT;
	}

	/**
	 * @param surname
	 * @param name
	 */
	public Docent(String surname, String name) {
		super(surname, name);
		this.academicRank = DOCENT;
	}

	/**
	 * @param surname
	 * @param name
	 * @param facultee
	 * @param cathedra
	 * @param position
	 */
	public Docent(String surname, String name, String facultee,
			String cathedra, String position) {
		super(surname, name, facultee, cathedra, position);
		this.academicRank = DOCENT;
	}


	public Docent(String surname, String name, String facultee,
			String cathedra, String position, String academicDegree) {
		super(surname, name, facultee, cathedra, position);
		this.academicDegree = academicDegree;
		this.academicRank = DOCENT;
	}
	/* (non-Javadoc)
	 * @see Academic#canPromotePosition()
	 */
	@Override
	public boolean canPromotePosition() {
		return (getWorkbooksNumber() > 3 && publicationsNumber > 1);
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
}
