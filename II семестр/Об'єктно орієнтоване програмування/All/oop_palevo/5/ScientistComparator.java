import java.util.Comparator;

/**
 * Sample comparator class for implementors of Scientist interface.
 * Compares two implementors on rank, degree and publications number.
 * @author Hlushko Olga
 */

public class ScientistComparator implements Comparator<Scientist> {

	/* (non-Javadoc)
	 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
	 */
	@Override
	public int compare(Scientist o1, Scientist o2) {
		int result = o1.getAcademicRank().compareTo(o2.getAcademicRank());
		if (result != 0)
			return result;
		result = o1.getAcademicDegree().compareTo(o2.getAcademicDegree());
		if (result != 0)
			return result;
		return o1.getPublicationsNumber() - o2.getPublicationsNumber() ;
	}

}
