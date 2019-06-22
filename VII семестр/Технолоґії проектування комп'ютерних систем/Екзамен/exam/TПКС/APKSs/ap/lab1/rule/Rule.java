package lab1.rule;

import java.util.HashMap;

import lab1.Main;
import lab1.command.ReactAndState;
import lab1.command.Reaction;
import lab1.command.ReactionManager;

/**
 * Клас - правило, здійснює перетворення подання правила користувачем через
 * таблицю строк-токенів, до карти-правил, прийнятих в системі.
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class Rule {
	/*
	 * Мапа таблиці правилa
	 */
	private HashMap<String, ReactAndState[]> _mapOfRule;
	private RulesManager rulMan = RulesManager.getInstance();
	private String _name;
	// позиція поточного розбору правила(пошук пробілів)
	private int _curPos = 0;

	/**
	 * Конструктор правила.
	 * 
	 * @param nameOfRule
	 *            назва правила
	 * @param table
	 *            таблиця правила, подана користувачем.
	 */
	public Rule(String nameOfRule, String[][] table) {
		_mapOfRule = new HashMap<String, ReactAndState[]>();
		_name = nameOfRule;
		// обробляємо кожен рядок таблиці правил
		for (int row = 0; row < table.length; row++) {
			/*
			 * і конкретно кожне поточне правило, яке в свою чергу може бут и
			 * реченням (напр "I love Ukraine" буде розібране по пробілам, як
			 * можливість реакції на 3 токена "I", "love", "Ukraine")
			 */
			ReactAndState[] reactArr = new ReactAndState[table[0].length];
			// -------------обробка реакцій і помилок в рядку-------------------
			for (int j = 1; j < table[row].length; j++) {
				String text = table[row][j];
				int length = text.length();
				if (text.startsWith("Error") || text.startsWith("error")) {
					// початок імені помилки
					int indexOfSpace = text.indexOf(' ');
					// ім"я помилки
					String name = text.substring(indexOfSpace + 1, length);
					// пошук реакції по імені.
					Reaction react = ReactionManager.getInstance().getReaction(
							name);
					// додавання в список реакцій
					reactArr[j] = new ReactAndState(react);
				} else {
					if (text.startsWith("Rule") || text.startsWith("rule")) {
						// сворення і прикріплення посилання на інше правило
						String ruleName = text.substring(
								findNextSpace(text) + 1, length);
						Reaction react = ReactionManager.getInstance()
								.getReaction(ruleName);
						
						reactArr[j] = new ReactAndState(react);

					} else {
						// прикріплення норм силки
						int indexOfSpace = text.indexOf(' ');
						String name = text.substring(indexOfSpace + 1, length);
						// номер наступного стану
						int num = Integer.valueOf(text.substring(0,
								indexOfSpace));
						// пошук реакції по імені.
						Reaction react = ReactionManager.getInstance()
								.getReaction(name);
						// додавання в список реакцій
						reactArr[j] = new ReactAndState(react, num);

					}
				}
			}
			// ----------------обробка лексем---------------------------------
			
			int lengthRow = table[row][0].length();
			StringBuffer tokenBuf = new StringBuffer();
			for (int i = 0; i <= lengthRow; i++) {
				if (i == lengthRow || table[row][0].charAt(i) == ' ') {
					// закінчився токен
					String token = tokenBuf.toString();
					// прив"язка токена до всіх правил за які він відповідає
					_mapOfRule.put(token, reactArr);
					tokenBuf.delete(0, tokenBuf.length());
				} else {
					// токен продовжується
					tokenBuf.append(table[row][0].charAt(i));
				}
			}
		}
	}

	/**
	 * @return ім"я правила
	 */
	public String get_name() {
		return _name;
	}

	public Reaction getReaction(String text) {
		int curState = rulMan.get_curState();
		ReactAndState[] react;
		if (!_mapOfRule.containsKey(text)) {
			react = _mapOfRule.get(Main.defaultS);
		} else {
			react = _mapOfRule.get(text);
		}
		ReactAndState reactAndState = react[curState];
		Reaction temp = reactAndState.get_reaction();
		rulMan.set_curState(react[rulMan.get_curState()].get_nextState());
		return temp;
	}

	private int findNextSpace(String text) {
		for (int i = _curPos; i < text.length(); i++) {
			if (text.charAt(i) == ' ') {
				_curPos = i;
				return i;
			}
		}
		return -1;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return _name;
	}
}
