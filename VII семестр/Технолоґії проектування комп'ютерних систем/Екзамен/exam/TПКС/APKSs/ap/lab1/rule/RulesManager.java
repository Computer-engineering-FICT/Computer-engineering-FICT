package lab1.rule;

import java.util.HashMap;

/**
 * ���� ������ �� �������, �� ���� � ������, �� ������� �� ���.
 * (<b>Singleton</b>)
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class RulesManager {
	private HashMap<String, Rule> _mapOfRules;

	private int _curState;
	private Rule _curRule;

	private static RulesManager instance;

	private RulesManager() {
		_mapOfRules = new HashMap<String, Rule>();
	}

	/**
	 * ��"��� ��������� ������.
	 * 
	 * @return
	 */
	public static RulesManager getInstance() {
		if (instance == null) {
			instance = new RulesManager();
		}
		return instance;
	}

	/**
	 * ������ ������� �� ������.
	 * 
	 * @param rule
	 *            ������� ��� �������.
	 */
	public void addRule(Rule rule) {
		_mapOfRules.put(rule.get_name().toLowerCase(), rule);
	}

	/**
	 * ������ ������� �� ������.
	 * 
	 * @param rule
	 *            ������� ��� �������.
	 * @param isStart
	 *            �� �������� �������, � ����� ��������� �����
	 */
	public void addRule(Rule rule, boolean isStart) {
		addRule(rule);
		if (isStart)
			_curRule = rule;
	}

	/**
	 * @return the _curState
	 */
	public int get_curState() {
		return _curState;
	}

	/**
	 * @param curState
	 *            the _curState to set
	 */
	public void set_curState(int curState) {
		_curState = curState;
	}

	/**
	 * @return the _curRule
	 */
	public Rule get_curRule() {
		return _curRule;
	}

	/**
	 * @param curRule
	 *            the _curRule to set
	 */
	public void set_curRule(Rule curRule) {
		_curRule = curRule;
	}

	public Rule getRule(String name) {
		return _mapOfRules.get(name.toLowerCase());
	}

}
