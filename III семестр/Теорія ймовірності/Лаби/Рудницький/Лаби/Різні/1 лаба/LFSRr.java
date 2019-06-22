import java.util.*;

public class LFSRr {
	protected int bit_rate;
	protected boolean[] way;
	protected ArrayList<Integer> list;
	protected ArrayList<Integer> next_list;

	public LFSRr(String start_list, String way) {
		list = new ArrayList<Integer>();
		bit_rate = start_list.length();
		this.way = new boolean[bit_rate];
		for (int i = 0; i < start_list.length(); i++)
			list.add(new Integer(start_list.substring(i, i + 1)));
		next_list = new ArrayList<Integer>(list);
		if (way.length() == this.bit_rate)
			designWay(way);
		else
			System.out.println("Error in way code");
	}

	public LFSRr designWay(String way) {
		for (int i = 0; i < way.length(); i++)
			if (way.charAt(i) == '1')
				this.way[i] = true;
		return this;
	}

	public int move() {
		int rez = list.get(0);
		this.next_list.set(this.bit_rate - 1, this.list.get(0));
		for (int i = this.bit_rate - 1; i > 0; i--)
			if (this.way[i] == true)
				this.next_list.set(i - 1, this.list.get(0) ^ this.list.get(i));
			else
				this.next_list.set(i - 1, this.list.get(i));
		this.list = new ArrayList(this.next_list);
		return rez;
	}

	public String toString() {
		return list.toString();
	}

	/*
	 * public static void main(String[] args) { LFSRr l = new LFSRr("1010",
	 * "0110"); l.move(); l.move(); l.move(); // l.move(); // int i = 1; //
	 * list.add(i); // boolean b = (boolean)i; System.out.println(l);
	 * System.out.println(Math.log(16)/Math.log(2)); }
	 */

}
