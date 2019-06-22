package kurs.res;

import kurs.Ruler;
import kurs.element.Vershina;

public class Resource {
	private boolean _free;
	private Vershina _node;
	private int _time;


	public Resource() {
		_free = true;
	}

	public boolean is_free() {
		return _free;
	}


	public void addNode(Vershina node) {
		if (!is_free()) {
			try {
				throw new Exception("Processor can't accept Node" + node);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		_free = false;
		_node = node;
		_time = node.get_weight();
	}


	public void execute() {
		_time--;
		if (_time == 0){
			_free = true;
			_node.set_complete(true);
			Ruler.get_instance().addToCompleted(_node);
		}
		
	}
	
	@Override
	public String toString() {
		if (_free) {
			return "-";
		} 
		return String.valueOf(_node.get_num());
	}
}
