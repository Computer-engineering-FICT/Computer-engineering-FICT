package lab1;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import lab1.rule.RulesManager;

/**
 * Клас - парсер
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class Parser {
	private String _curToken;
	private int _index;
	private boolean _endOfParsing = false;
	private static Parser _instance;

	private Parser() {}
	
	/**
	 * @return the _instance
	 */
	public static Parser getInstance() {
		if (_instance == null){
			_instance = new Parser();
		}
		return _instance;
	}
	
	/**
	 * Почати обробку файлу парсером.
	 * 
	 * @param path
	 *            шлях до файлу, який потрібно обробляти.
	 * @throws Exception
	 *             помилка при недопустимому символі у вхідному потоці даних
	 */
	public void start(String path) throws Exception {
		BufferedReader in;
		try {
			in = new BufferedReader(new InputStreamReader(new FileInputStream(
					path)));
			RulesManager.getInstance().set_curState(1);
			while (!_endOfParsing && in.ready()) {
				String str = in.readLine();
				while (!_endOfParsing && _index < str.length()) {
					String c = String.valueOf(str.charAt(_index));
					_curToken = c;
					if (c.equals(" ")) {
						// перетворити пробіл на службовий пробіл
						c = Main.space;
					}
					RulesManager.getInstance().get_curRule().getReaction(c)
							.execute();
					_index++;
				}
				if (!_endOfParsing && in.ready())
					// перетворити кінець лінії на службовий символ кінця лінії
					RulesManager.getInstance().get_curRule().getReaction(
							Main.endOfLine).execute();
			}
			// перетворити кінець файлу на службовий символ кінця файлу
			if (!_endOfParsing)
				RulesManager.getInstance().get_curRule().getReaction(
						Main.endOfFile).execute();
		} catch (IOException e) {}
	}

	/**
	 * Задати зміщення для зчитування символу.
	 * 
	 * @param shiftNum
	 *            кількість позицій, на скільки потрібно зміститися.
	 */
	public void shiftCurIndefOfCharacter(int shiftNum) {
		_index += shiftNum;
	}

	/**
	 * @return лексема, яка поточно обробляється.
	 */
	public String get_curToken() {
		return _curToken;
	}

	/**
	 * @param endOfParsing
	 *            the _endOfParsing to set
	 */
	public void set_endOfParsing(boolean endOfParsing) {
		_endOfParsing = endOfParsing;
	}

	/**
	 * @return the _index
	 */
	public int get_index() {
		return _index;
	}
}
