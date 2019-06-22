import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Map.Entry;
import java.util.Comparator;

public class Configuration implements IConfiguration {
	private HashMap<String, String> map;

	public Configuration() {
		map = new HashMap<String, String>();
	}

	public void setValue(String key, String value) {
		map.put(key, value);
	}

	public String getValue(String key) {
		return map.get(key);
	}

	public String output() {
		String out = "";
		Set<Entry<String, String>> setMap = this.map.entrySet();
		for (@SuppressWarnings("rawtypes")
		Iterator iterator = setMap.iterator(); iterator.hasNext();) {
			@SuppressWarnings("unchecked")
			Entry<String, String> entry = (Entry<String, String>) iterator
					.next();
			out = out + entry.getKey() + " = " + entry.getValue() + '\n';
		}
		return out;
	}

	@Override
	public List<String> getAllKey() {
		Set<Entry<String, String>> setMap = this.map.entrySet();
		ArrayList<String> allKey = new ArrayList<String>();
		for (@SuppressWarnings("rawtypes")
		Iterator iterator = setMap.iterator(); iterator.hasNext();) {
			@SuppressWarnings("unchecked")
			Entry<String, String> entry = (Entry<String, String>) iterator
					.next();
			if (!entry.getKey().equals(""))
				allKey.add(entry.getKey());
		}
		CompareKey comparator = new CompareKey();
		Collections.sort(allKey, comparator);
		return allKey;
	}
}

class CompareKey implements Comparator {

	@Override
	public int compare(Object o1, Object o2) {
		String key1 = (String) o1;
		String key2 = (String) o2;
		return key1.compareTo(key2);
	}

}