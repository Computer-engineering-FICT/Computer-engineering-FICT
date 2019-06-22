package kurs.element;

import java.util.Comparator;


public class ConnectComp implements Comparator<Connect> {

	@Override
	public int compare(Connect o1, Connect o2) {
		if (o1.get_target().get_top_level() + o1.get_weight() > o2.get_target()
				.get_top_level()
				+ o2.get_weight()) {
			return 1;
		} else if (o1.get_target().get_top_level() + o1.get_weight() < o2
				.get_target().get_top_level()
				+ o2.get_weight()) {
			return -1;
		}
		return 0;
	}

}
