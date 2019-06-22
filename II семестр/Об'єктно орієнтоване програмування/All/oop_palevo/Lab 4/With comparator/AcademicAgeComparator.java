import java.util.Comparator;

/**
 * Comparator class for Academic objects.
 * Compares two objects by age, surname and name.
 * @author Glushko Olga
 *
 */
public class AcademicAgeComparator implements Comparator<Academic> {

	/* (non-Javadoc)
	 * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
	 */
	@Override
	public int compare(Academic a1, Academic a2) {
		int result = -a1.getBirthdate().compareTo(a2.getBirthdate());
		if (result != 0)
			return result;
		result = a1.getSurname().compareTo(a2.getSurname());
		if (result != 0)
			return result;
		return a1.getName().compareTo(a2.getName());
	}

}
