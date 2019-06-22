//import java.util.*;


public class SportsmenList {
	private int size = 0;
	private Sportsmen head, current, prev;
	
	public SportsmenList(){
		head = null;
		head = head.setNext(next);
		setSize(0);
	}
	public SportsmenList(Sportsmen sp){
		this();
		if (sp == null){
			throw new NullPointerException("Помилка! Параметр конструктора null");
		} else {
			first = sp;
			current = first;
			setSize(1);
		}
	}
//	public SportsmenList(ArrayList<Sportsmen> list){
//		add(list);
//		setSize(list.size());
//	}
	
	
	public void add(Sportsmen sp){
		if (first == null){
		first = sp;
		setSize(getSize() + 1);
		}
		else{
			current = first;
			current.setNext(sp);
			current = current.getNext();
			setSize(getSize() + 1);
		}
	}

	public void view(){
		for(int i = 1; i <= getSize(); i++){
			current.printAll();
			if (current.getNext() != null){
				current = current.getNext();
			}
		}
	}
	
	
	public void setSize(int size) {
		this.size = size;
	}

	public int getSize() {
		return size;
	}
}
