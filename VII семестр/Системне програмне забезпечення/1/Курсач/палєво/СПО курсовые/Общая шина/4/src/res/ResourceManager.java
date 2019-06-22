package kurs.res;

import kurs.Main;
import kurs.element.Vershina;


public class ResourceManager {
	private static ResourceManager _instance;
	private Resource[] _proc;


	private ResourceManager() {
		_proc = new Resource[Main.PROC_NUM];
		for (int i = 0; i < _proc.length; i++) {
			_proc[i] = new Resource();
		}
	}

	public static ResourceManager get_instance() {
		if (_instance == null) {
			_instance = new ResourceManager();
		}
		return _instance;
	}


	public void putTaskOnProc(Vershina node) {
		boolean flag = true;
		for (int i = 0; i < _proc.length & flag; i++) {
			if (_proc[i].is_free()) {
				_proc[i].addNode(node);
				flag = false;
			}
		}
	}


	public void execute() {
		for (int i = 0; i < _proc.length; i++) {
			if (!_proc[i].is_free()) {
				_proc[i].execute();
			}
		}
	}


	public boolean isFree() {
		for (int i = 0; i < _proc.length; i++) {
			if (_proc[i].is_free()) {
				return true;
			}
		}
		return false;
	}

	@Override
	public String toString() {
		StringBuffer res = new StringBuffer();
		for (int i = 0; i < _proc.length; i++) {
			res.append(_proc[i] + " ");
		}
		return res.toString();
	}
}
