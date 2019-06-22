import java.io.IOException;
import java.io.PrintStream;

/**
 * @author Glushko Olga
 *
 */
public class Laba7 {

	/**
	 * Prints some properties of Academic object
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
	 * @param args
	 */
	public static void main(String[] args) {
		AcademicReader reader = new InteractiveAcademicReader(System.in, System.out);
		Academic a;
		AcademicArrayQueue queue = new AcademicArrayQueue();
		int c;
		do {
			try { // to keep a style, also catch an IOException here
				a = reader.readAcademic();
				queue.add(a);
				System.out.print("Got an object. Read another one? ");
				c = System.in.read();
				System.out.println();
			} catch (IOException e) {
				System.out.println("An I/O exception occured, exiting.");
				return;
			}
		} while (c == 'y');

		// Reading finished, print collected objects...
		System.out.format("Ok, we've got %d objects:\n", queue.size());
		while (!queue.isEmpty()) {
			a = queue.poll();
			printAcademic(a, System.out);
		}
	}

}
