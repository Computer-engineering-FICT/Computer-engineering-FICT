package lab1.rule;

import java.util.HashMap;

/**
 * Клас зберігає всі правила, які діють у системі, та реакції на них.
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
	 * Об"єкт менеджера правил.
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
	 * Додати правило до списку.
	 * 
	 * @param rule
	 *            правило для додання.
	 */
	public void addRule(Rule rule) {
		_mapOfRules.put(rule.get_name().toLowerCase(), rule);
	}

	/**
	 * Додати правило до списку.
	 * 
	 * @param rule
	 *            правило для додання.
	 * @param isStart
	 *            чи стартове правило, з якого почнеться розбір
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
