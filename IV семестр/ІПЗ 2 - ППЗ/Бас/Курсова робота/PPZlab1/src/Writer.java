import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;

public abstract class Writer {

	public IConfiguration configuration;

	abstract public void save(String path) throws IOException, ParserConfigurationException;

	public void setConfiguration(IConfiguration configuration) {
		this.configuration = configuration;
	}

}