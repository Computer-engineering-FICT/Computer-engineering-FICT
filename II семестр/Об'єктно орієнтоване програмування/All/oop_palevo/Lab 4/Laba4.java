import java.util.Calendar;
import java.util.Date;

/**
 * 
 */

/**
 * @author Glushko Olga IO-92
 *
 */
public class Laba4 {

	public static String SURNAMES[] = { "Sidorov", "Petrov", "Ivanov", "Flerov" };
	public static String NAMES[] = { "Aadya", "Badya", "Uadya", "Gadya" };
	public static String FACULTEES[] = { "FMM", "FEL", "FL", "FIOT" };
	public static String CATHEDRAS[] = { "LAY", "JGY", "SRY", "VOU" };
	public static int EXPS[] = { 3, 8, 5, 14 };
	public static String POSITIONS[] = { "", "", "", "" };
	public static Date BIRTHDATES[] = { null, null, null, null };

	/**
	 * Sample sort method that uses natural comparison.
	 * @param array an array to sort
	 */
	public static void sort(Academic[] array) {
		int i, sorted, min; // "sorted" is a length of already sorted part of array thus also representing a start index of unsorted part.
		Academic tmp;
		for (sorted=0; sorted < array.length-1; sorted++) { // note that array of only 1 element is always sorted
			min = sorted;
			for (i=sorted+1; i<array.length; i++) { // find index of min item in unsorted part of array 
				if (array[i].compareTo(array[min]) < 0)
					min = i;
			}
			if (min > sorted) { // swap 1st unsorted and min only if they are different 
				tmp = array[sorted];
				array[sorted] = array[min];
				array[min] = tmp;
			}
		}
	}

	/**
	 * Sample sort method that uses comparison by age.
	 * @param array an array to sort
	 */
	public static void sortByAge(Academic[] array) {
		int i, sorted, min; // "sorted" is a length of already sorted part of array thus also representing a start index of unsorted part.
		Academic tmp;
		for (sorted=0; sorted < array.length-1; sorted++) { // note that array of only 1 element is always sorted
			min = sorted;
			for (i=sorted+1; i<array.length; i++) { // find index of min item in unsorted part of array 
				if (array[i].compareByAge(array[min]) < 0)
					min = i;
			}
			if (min > sorted) { // swap 1st unsorted and min only if they are different 
				tmp = array[sorted];
				array[sorted] = array[min];
				array[min] = tmp;
			}
		}
	}

	/**
	 * Sample sort method that uses alphabetical comparison of names.
	 * @param array an array to sort
	 */
	public static void sortAlphabetically(Academic[] array) {
		int i, sorted, min; // "sorted" is a length of already sorted part of array thus also representing a start index of unsorted part.
		Academic tmp;
		for (sorted=0; sorted < array.length-1; sorted++) { // note that array of only 1 element is always sorted
			min = sorted;
			for (i=sorted+1; i<array.length; i++) { // find index of min item in unsorted part of array 
				if (array[i].compareAlphabetically(array[min]) < 0)
					min = i;
			}
			if (min > sorted) { // swap 1st unsorted and min only if they are different 
				tmp = array[sorted];
				array[sorted] = array[min];
				array[min] = tmp;
			}
		}
	}

	/**
	 * Sample sort method that uses comparison by position.
	 * @param array an array to sort
	 */
	public static void sortByPosition(Academic[] array) {
		int i, sorted, min; // "sorted" is a length of already sorted part of array thus also representing a start index of unsorted part.
		Academic tmp;
		for (sorted=0; sorted < array.length-1; sorted++) { // note that array of only 1 element is always sorted
			min = sorted;
			for (i=sorted+1; i<array.length; i++) { // find index of min item in unsorted part of array 
				if (array[i].compareByPosition(array[min]) < 0)
					min = i;
			}
			if (min > sorted) { // swap 1st unsorted and min only if they are different 
				tmp = array[sorted];
				array[sorted] = array[min];
				array[min] = tmp;
			}
		}
	}

	/**
	 * Prints all properties of passed <code>academic</code> object 
	 * @param academic an object to print
	 */
	public static void printAcademic(Academic academic) {
		System.out.print(academic.getSurname());
		System.out.print("\t");
		System.out.print(academic.getName());
		System.out.print("\t");
		System.out.print(academic.getFacultee());
		System.out.print("\t");
		System.out.print(academic.getCathedra());
		System.out.print("\t");
		System.out.print(academic.getPosition());
		System.out.print("\t");
		System.out.print(academic.getExperience());
		System.out.print("\t");
		System.out.print(academic.getBirthdate().toString());
		System.out.println();
	}

	/**
	 * Main program function.
	 * Initializes an array of objects, sorts it by 4 various ordering.
	 * Prints results of each sorting.
	 * @param args not used here
	 */
	public static void main(String[] args) {
		Calendar cal = Calendar.getInstance();
		cal.set(1974, 10, 16);
		BIRTHDATES[0] = cal.getTime();
		cal.set(1971, 3, 10);
		BIRTHDATES[1] = cal.getTime();
		cal.set(1980, 5, 28);
		BIRTHDATES[2] = cal.getTime();
		cal.set(1965, 9, 22);
		BIRTHDATES[3] = cal.getTime();
		
		int i;
		Academic academics[] = new Academic[4];
		for(i=0; i<4; i++) {
			academics[i] = new Academic(SURNAMES[i], NAMES[i], FACULTEES[i], CATHEDRAS[i], POSITIONS[i]);
			academics[i].setExperience(EXPS[i]);
			academics[i].setBirthdate(BIRTHDATES[i]);
		}
		sort(academics);
		System.out.println("Array sorted with natural order:");
		for (i=0; i<4; i++)
			printAcademic(academics[i]);
		System.out.println();
		sortAlphabetically(academics);
		System.out.println("Array sorted alphabetically:");
		for (i=0; i<4; i++)
			printAcademic(academics[i]);
		System.out.println();
		sortByAge(academics);
		System.out.println("Array sorted by age:");
		for (i=0; i<4; i++)
			printAcademic(academics[i]);
		System.out.println();
		sortByPosition(academics);
		System.out.println("Array sorted by position:");
		for (i=0; i<4; i++)
			printAcademic(academics[i]);
		System.out.println();
	}

}
