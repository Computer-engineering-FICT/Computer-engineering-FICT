package kurs.element;

import java.util.ArrayList;
import java.util.Collections;


public class Vershina {
	private int _num;
	private int _weight;
	private ArrayList<Connect> _links;
	//зворотні зв"язки(зв"язок вгору)
	private ArrayList<Connect> _uplinks;
	private int _level;
	private int _top_level;
	private Vershina _prevCritPath;
	private boolean _complete;
	
	public Vershina(int num, int weight) {
		_num = num;
		_weight = weight;
		_links = new ArrayList<Connect>();
		_uplinks = new ArrayList<Connect>();
		_complete = false;
	}
	
	public Vershina() {
	}
	
	public void set_complete(boolean complete) {
		_complete = complete;
	}
	
	public boolean is_complete() {
		return _complete;
	}
	
	public ArrayList<Connect> get_uplinks() {
		return _uplinks;
	}
	

	public void sortUplinks(){
		Collections.sort(_uplinks, new ConnectComp());
	}
	

	private void addUpLink(Connect e){
		_uplinks.add(e);
	}
	

	public void addLink(Connect e){
		_links.add(e);
		//додати цілі посилання на основу
		e.get_target().addUpLink(new Connect(this, e.get_weight()));
	}
	

	public int get_num() {
		return _num;
	}
	

	public void set_level(int level) {
		_level = level;
	}
	

	public int get_level() {
		return _level;
	}
	

	public ArrayList<Connect> get_links() {
		return _links;
	}
	
	public void set_top_level(int topLevel) {
		_top_level = topLevel;
	}
	
	public int get_top_level() {
		return _top_level;
	}
	
	public int get_weight() {
		return _weight;
	}
	
	public void set_prevCritPath(Vershina prevCritPath) {
		_prevCritPath = prevCritPath;
	}
	
	public Vershina get_prevCritPath() {
		return _prevCritPath;
	}
	
	@Override
	public String toString() {
		return "№"+_num + "["+_weight+"]";
	}
	
}
