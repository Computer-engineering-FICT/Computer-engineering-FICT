package kpi.os.cours.forms;

public class Interval {
	private int begin, end;
	private IntervalType type;
	private String label;
	
	public Interval(int begin, int end, IntervalType type, String label) {
		this.begin 	= begin;
		this.end 	= end;
		this.type 	= type;
		this.label = label;
	}

	public int getBegin() {
		return begin;
	}

	public int getEnd() {
		return end;
	}

	public IntervalType getType() {
		return type;
	}
	
	public String getLabel() {
		return label;
	}
}
