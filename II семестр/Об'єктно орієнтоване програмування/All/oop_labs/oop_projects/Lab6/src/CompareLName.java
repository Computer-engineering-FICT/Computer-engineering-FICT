import java.util.Comparator;

public class CompareLName implements Comparator <Sportsmen> {
		public int compare(Sportsmen o1, Sportsmen o2){
			return o1.getLName().compareTo(o2.getLName());
		}
}