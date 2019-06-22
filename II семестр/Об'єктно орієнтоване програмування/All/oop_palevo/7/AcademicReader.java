import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 * Base class for various readers for classes derived from <code>Academic</code>
 * abstract class.
 * @author Glushko Olga
 */
public abstract class AcademicReader {

	protected InputStream inputStream;
	protected BufferedReader reader;
	protected DateFormat dateFormat;

	/**
	 * Initializes reader unattached to any I/O stream.
	 */
	public AcademicReader() {
		dateFormat = new SimpleDateFormat("dd.MM.yyyy");
	}
	
	/**
	 * Initializes reader that is attached to given <code>InputStream</code>
	 * @param in an <code>InputStream</code> to attach to
	 */
	public AcademicReader(InputStream in) {
		this();
		inputStream = in;
		reader = new BufferedReader(new InputStreamReader(in));
	}

	/**
	 * 
	 * @return an <code>Academic</code> object read from input stream
	 * @throws IOException
	 */
	public abstract Academic readAcademic() throws IOException; 


	/**
	 * Attaches a reader to given input stream.
	 * @param in the <code>InputStream</code> to attach to
	 */
	public void setInputStream(InputStream in) {
		this.inputStream = in;
		reader = new BufferedReader(new InputStreamReader(in));
	}

}
