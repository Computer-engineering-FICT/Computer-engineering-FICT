package cm_lab3;

import java.util.ArrayList;
import java.util.Iterator;

import cm_lab3.Event;

public class EventList implements Iterable<Event> {
	private ArrayList<Event> list = new ArrayList<Event>();
	void add(Event e) {
		list.add(e);
	}

	void remove(Event e) {
		list.remove(e);
	}

	
	Event get (int index ){
		return list.get(index);
	}

	@Override
	public Iterator<Event> iterator() {
		
		return list.iterator();
	}
}
