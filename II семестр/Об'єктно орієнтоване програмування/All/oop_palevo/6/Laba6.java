import java.io.PrintStream;
import java.util.Calendar;

/**
 * @author Glushko Olga
 *
 */
public class Laba6 {

	/**
	 * Prints some propertief of Academic object
	 * @param a an Academic object to print
	 * @param out a a stream for output
	 */
	public static void printAcademic(Academic a, PrintStream out) {
		out.print(a.getSurname());
		out.print("\t");
		out.print(a.getName());
		out.print("\t");
		out.print(a.getFacultee());
		out.print("\t");
		out.print(a.getCathedra());
		out.print("\t");
		out.println(a.getPosition());
	}

	/**
	 * Creates sample array of Academic-derived objects
	 * @return that array
	 */
	public static Academic[] initSampleObjects() {
		Calendar cal = Calendar.getInstance();
		Academic academics[] = new Academic[4];

		Docent docent = new Docent("surname0", "name0", "facultee0", "cathedra0", "position0", "Candidate of science");
		cal.set(1974, 10, 16);
		docent.setBirthdate(cal.getTime());
		docent.setExperience(8);
		docent.setWorkbooksNumber(5);
		docent.setPublicationsNumber(1);
		academics[0] = docent;

		Assistant assistant = new Assistant("surname1", "name1", "facultee1", "cathedra1", "position1", "None");
		cal.set(1980, 5, 28);
		assistant.setBirthdate(cal.getTime());
		assistant.setExperience(4);
		academics[1] = assistant;

		docent = new Docent("surname2", "name2", "facultee1", "cathedra1", "position2", "Doctor");
		cal.set(1971, 3, 10);
		docent.setBirthdate(cal.getTime());
		docent.setExperience(11);
		docent.setWorkbooksNumber(7);
		docent.setPublicationsNumber(3);
		academics[2] = docent;

		Professor professor = new Professor("surname3", "name3", "facultee3", "cathedra3", "position3");
		cal.set(1965, 9, 22);
		professor.setBirthdate(cal.getTime());
		professor.setExperience(14);
		professor.setWorkbooksNumber(10);
		professor.setPublicationsNumber(3);
		academics[3] = professor;
		return academics;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Academic sampleObjects[] = initSampleObjects();
		AcademicArrayQueue queue = new AcademicArrayQueue();
		Academic a;
		// queue 11 objects in random order
		int i, ix;
		for (i=0; i<11; i++) {
			ix = (int) Math.round(Math.floor(Math.random()*sampleObjects.length));
			queue.add(sampleObjects[ix]);
		}
		/* demo queuing: take 2 from queue, place back another one
		 * until queue becomes empty
		 */
		for (i=0; !queue.isEmpty(); i++) {
			if (i % 3 == 2) {
				ix = (int) Math.round(Math.floor(Math.random()*sampleObjects.length));
				// sample check for object's presence in queue
				if (queue.contains(sampleObjects[ix]))
					System.out.println("Object already exist in queue");
				queue.add(sampleObjects[ix]);
			}
			else {
				a = queue.remove();
				printAcademic(a, System.out);
			}
		}
	}

}
