
import java.util.ArrayList;
public class ExeLab5 {
	public static void main(String[] args) {
		Plane p1 = new Plane();
		Plane p2 = new Plane(123,0,0,0,0,"","");
		ArrayList<Plane> array = new ArrayList<Plane>();
		array.add(p1);
		array.add(p2);
		
		PlaneList list = new PlaneList(array);
		System.out.println(list.getSize());
		list.printAll();
	}
}