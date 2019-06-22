package lab1.command;

/**
 * Клас інкапсулює реакцію і номер наступного стану.
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class ReactAndState {
	private Reaction _reaction;
	private int _nextState;

	public ReactAndState(Reaction reaction, int nextState) {
		_nextState = nextState;
		_reaction = reaction;
	}
	
	public ReactAndState(int nextState) {
		_nextState = nextState;
		_reaction = null;
	}
	
	public ReactAndState(Reaction reaction) {
		_nextState = -1;
		_reaction = reaction;
	}
	
	public int get_nextState() {
		return _nextState;
	}

	public Reaction get_reaction() {
		return _reaction;
	}
}
