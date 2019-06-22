/**
 * Compares two academics by their position, surname and name.
 * Implements <code>Comparator&lt;Academic&gt;</code> interface.
 * @author Hlushko Olga
 */
public class PositionAcademicComparator implements Comparator<Academic> {

	@Override
	public int compare(Academic a1, Academic a2) {
		int result = a1.getPosition().compareTo(a2.getPosition());
		if (result != 0)
			return result;
		return new AlphabeticalPersonComparator().compare(a1, a2);
	}
}
