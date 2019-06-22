import java.util.List;

public interface IConfiguration {

	public void setValue(String key, String Value);

	public String getValue(String key);

	public List<String> getAllKey();

}