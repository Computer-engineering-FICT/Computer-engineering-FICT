abstract public class Reader {
	public IConfiguration configuration;

	abstract public void load(String path);

	public void setConfiguration(IConfiguration configuration) {
		this.configuration = configuration;
	}

}
