package lab1.rule;

import java.util.HashMap;

import lab1.Main;
import lab1.command.ReactAndState;
import lab1.command.Reaction;
import lab1.command.ReactionManager;

/**
 * ���� - �������, ������� ������������ ������� ������� ������������ �����
 * ������� �����-������, �� �����-������, ��������� � ������.
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class Rule {
	/*
	 * ���� ������� ������a
	 */
	private HashMap<String, ReactAndState[]> _mapOfRule;
	private RulesManager rulMan = RulesManager.getInstance();
	private String _name;
	// ������� ��������� ������� �������(����� ������)
	private int _curPos = 0;

	/**
	 * ����������� �������.
	 * 
	 * @param nameOfRule
	 *            ����� �������
	 * @param table
	 *            ������� �������, ������ ������������.
	 */
	public Rule(String nameOfRule, String[][] table) {
		_mapOfRule = new HashMap<String, ReactAndState[]>();
		_name = nameOfRule;
		// ���������� ����� ����� ������� ������
		for (int row = 0; row < table.length; row++) {
			/*
			 * � ��������� ����� ������� �������, ��� � ���� ����� ���� ��� �
			 * �������� (���� "I love Ukraine" ���� �������� �� �������, ��
			 * ��������� ������� �� 3 ������ "I", "love", "Ukraine")
			 */
			ReactAndState[] reactArr = new ReactAndState[table[0].length];
			// -------------������� ������� � ������� � �����-------------------
			for (int j = 1; j < table[row].length; j++) {
				String text = table[row][j];
				int length = text.length();
				if (text.startsWith("Error") || text.startsWith("error")) {
					// ������� ���� �������
					int indexOfSpace = text.indexOf(' ');
					// ��"� �������
					String name = text.substring(indexOfSpace + 1, length);
					// ����� ������� �� ����.
					Reaction react = ReactionManager.getInstance().getReaction(
							name);
					// ��������� � ������ �������
					reactArr[j] = new ReactAndState(react);
				} else {
					if (text.startsWith("Rule") || text.startsWith("rule")) {
						// �������� � ����������� ��������� �� ���� �������
						String ruleName = text.substring(
								findNextSpace(text) + 1, length);
						Reaction react = ReactionManager.getInstance()
								.getReaction(ruleName);
						
						reactArr[j] = new ReactAndState(react);

					} else {
						// ����������� ���� �����
						int indexOfSpace = text.indexOf(' ');
						String name = text.substring(indexOfSpace + 1, length);
						// ����� ���������� �����
						int num = Integer.valueOf(text.substring(0,
								indexOfSpace));
						// ����� ������� �� ����.
						Reaction react = ReactionManager.getInstance()
								.getReaction(name);
						// ��������� � ������ �������
						reactArr[j] = new ReactAndState(react, num);

					}
				}
			}
			// ----------------������� ������---------------------------------
			
			int lengthRow = table[row][0].length();
			StringBuffer tokenBuf = new StringBuffer();
			for (int i = 0; i <= lengthRow; i++) {
				if (i == lengthRow || table[row][0].charAt(i) == ' ') {
					// ��������� �����
					String token = tokenBuf.toString();
					// ����"���� ������ �� ��� ������ �� �� �� �������
					_mapOfRule.put(token, reactArr);
					tokenBuf.delete(0, tokenBuf.length());
				} else {
					// ����� ������������
					tokenBuf.append(table[row][0].charAt(i));
				}
			}
		}
	}

	/**
	 * @return ��"� �������
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
