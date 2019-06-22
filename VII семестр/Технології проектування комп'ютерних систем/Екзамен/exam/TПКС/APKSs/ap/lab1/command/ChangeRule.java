package lab1.command;

import lab1.rule.RulesManager;

/**
 * Команда для зміни правила (системний клас).
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class ChangeRule implements Reaction {
	private String _name;
	private String _reaction;
	private String _ruleName;
	private boolean _isReactionFirst;
	private ReactionManager reactManage = ReactionManager.getInstance();
	private RulesManager ruleManage = RulesManager.getInstance();

	/**
	 * @param name
	 *            ім"я зміни правила.
	 * @param reaction
	 *            ім"я реакція під час зміни правила.
	 * @param ruleName
	 *            ім"я правила, на яке потрібно змінити поточне.
	 * @param isFirstReaction
	 *            чи реакція виконується першою.
	 */
	public ChangeRule(String name, String reaction, String ruleName,
			boolean isFirstReaction) {
		_name = name;
		_reaction = reaction;
		_ruleName = ruleName;
		_isReactionFirst = isFirstReaction;
	}

	/**
	 * @param name
	 *            ім"я зміни правила.
	 * @param reaction
	 *            ім"я реакція під час зміни правила.
	 * @param ruleName
	 *            ім"я правила, на яке потрібно змінити поточне.
	 */

	public ChangeRule(String name, String reaction, String ruleName) {
		_reaction = reaction;
		_ruleName = ruleName;
		_isReactionFirst = true;
		_name = name;
	}

	@Override
	public void execute() throws Exception {
		//System.out.println("rule changing");
		if (_isReactionFirst) {
			reactManage.getReaction(_reaction).execute();
			ruleManage.set_curRule(ruleManage.getRule(_ruleName));
		} else {
			ruleManage.set_curRule(ruleManage.getRule(_ruleName));
			reactManage.getReaction(_reaction).execute();
		}
		ruleManage.set_curState(1);
	}

	@Override
	public String getName() {
		return _name;
	}

}
