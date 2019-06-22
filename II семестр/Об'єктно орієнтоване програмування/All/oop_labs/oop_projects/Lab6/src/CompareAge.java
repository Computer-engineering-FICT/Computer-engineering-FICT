import java.util.Comparator;

public class CompareAge implements Comparator <Sportsmen> {
		public int compare(Sportsmen o1, Sportsmen o2) {
			if (o1.getAge() < o2.getAge())
				return -1;
			if (o1.getAge() > o2.getAge()) 
				return 1;
			return 0;
		}
}