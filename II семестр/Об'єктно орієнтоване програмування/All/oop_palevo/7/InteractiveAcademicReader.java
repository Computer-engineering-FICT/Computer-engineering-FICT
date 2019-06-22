import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.text.ParseException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


/**
 * Class for reading properties of object derived from <code>Academic</code> class,
 * creating that object and filling it's properties.
 * Demonstrates exception throwing and handling.
 * @author Glushko Olga
 */
public class InteractiveAcademicReader extends AcademicReader {
	private static final Set<String> invalidNames = new HashSet<String>();
	private static final Set<String> validPositions = new HashSet<String>();
	private static String[] invalids = { "", "", "", "" };
	private static String[] positions = { "Ассистент", "Доцент", "Профессор" };
	private PrintStream promptWriter;
	

	/**
	 * Constructor. Nothing to say.
	 * @param in input stream to read from
	 * @param out output stream for prompts and error messages
	 */
	InteractiveAcademicReader(InputStream in, PrintStream out) {
		super(in);
		promptWriter = out;
		int i;
		for (i=0; i<invalids.length; i++) // Initialize set of invalid names
			invalidNames.add(invalids[i]);
		for (i=0; i<positions.length; i++) // Initialize set of valid positions
			validPositions.add(positions[i]);
	}

	/**
	 * Reads the string from input stream. Prompts again in case of empty
	 * value.
	 * @param prompt prompt to issue to user
	 * @return the string value read from input stream
	 * @throws IOException 
	 */
	private String readMandatoryString(String prompt) throws IOException {
		String value = null;
		do {
			if (value != null) // 
				promptWriter.println("Value can't be an empty string. Try again.");
			promptWriter.print(prompt);
			promptWriter.print(": ");
			value = reader.readLine();
		} while (value.isEmpty());
		return value;
	}

	/**
	 * Reads the string from input stream and checks for it's validity.
	 * This check is based on presence (or absense) in the dictionary of
	 * valid (or invalid)values passed in <code>checkValues</code> parameter.
	 * Should it be present or not is defined by <code>valid</code> parameter.
	 * @param prompt prompt to issue to user
	 * @param checkValues set of values to check on
	 * @param valid defines validity of values in the set 
	 * @return the string value read from input stream
	 * @throws IOException 
	 * @throws InvalidPropertyValueException in case of non-empty but invalid value
	 */
	private String readMandatoryString(String prompt, Set<String> checkValues, boolean valid) throws IOException, InvalidPropertyValueException {
		String value = readMandatoryString(prompt);
		if (checkValues.contains(value) != valid)
			throw new InvalidPropertyValueException(value);
		return value;
	}

	/**
	 * Reads date value from input stream and parses it using
	 * <code>DateFormat</code> instance. Handles <code>ParseException</code>
	 * internally.
	 * @param prompt prompt to issue to user
	 * @return date entered by user
	 * @throws IOException
	 */
	private Date readDate(String prompt) throws IOException {
		while (true) {
			try {
				String value = readMandatoryString(prompt);
				return dateFormat.parse(value);
			} catch (ParseException e) {
				promptWriter.println("Invalid date. Supply a valid date in 'dd.MM.yyyy' format");
			}
		}
	}

	/* (non-Javadoc)
	 * @see AcademicReader#readAcademic()
	 */
	@Override
	public Academic readAcademic() throws IOException {
		Academic a;
		String surname = null, name = null, position = null;
		/* Read mandatory properties. Really only 'position' property is
		 * absolutely mandatory since it defines the real (concrete) class
		 * of created object. 
		 * */
		while(surname == null) {
			try {
				surname = readMandatoryString("Surname", invalidNames, false);
			} catch (InvalidPropertyValueException e) {
				promptWriter.print("Exception: invalid surname value:");
				promptWriter.println(e.getValue());
			}
		}
		while(name == null) {
			try {
				name = readMandatoryString("Name", invalidNames, false);
			} catch (InvalidPropertyValueException e) {
				promptWriter.print("Exception: invalid name value:");
				promptWriter.println(e.getValue());
			}
		}
		while (position == null) {
			try {
				position = readMandatoryString("Position", validPositions, true);
			} catch (InvalidPropertyValueException e) {
				promptWriter.print("Exception: invalid position value:");
				promptWriter.println(e.getValue());
			}
		}
		if ("Доцент".equals(position))
			a = new Docent(surname, name);
		else if ("Профессор".equals(position))
			a = new Professor(surname, name);
		else
			a = new Assistant(surname, name);
		a.setPosition(position);
		a.setFacultee(readMandatoryString("Facultee"));
		a.setCathedra(readMandatoryString("Cathedra"));
		a.setBirthdate(readDate("Date of birth (format is 'dd.MM.yyyy')"));
		return a;
	}

}
