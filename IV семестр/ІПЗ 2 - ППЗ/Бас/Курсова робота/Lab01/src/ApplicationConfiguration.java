import java.util.List;

public class ApplicationConfiguration implements IConfiguration {

	public IConfiguration AppConfig;

	private static Configuration configuration;
	private static ApplicationConfiguration appConfig;

	private ApplicationConfiguration() {
		configuration = new Configuration();
	}

	public static ApplicationConfiguration getInstance() {
		if (appConfig == null)
			appConfig = new ApplicationConfiguration();
		return appConfig;
	}

	@Override
	public void setValue(String key, String value) {
		configuration.setValue(key, value);
	}

	@Override
	public String getValue(String key) {
		return configuration.getValue(key);
	}

	public String out() {
		return configuration.output();
	}

	@Override
	public List<String> getAllKey() {
		return configuration.getAllKey();
	}

}
