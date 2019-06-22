/**
 * @author Vova
 *клас для пунктуації
 *зберігаємо пунктуацію не в одному елементі char а в масиві, бо може бути що попадеться три крапки, а це один елемент пунктуації
 */
public class Punkt {
	private char[] punctuation;

	public Punkt(String s) {
		s.trim();
		punctuation = s.toCharArray();
		for (char c : punctuation) {
			//так само як і в літері, друкуємо пунктуацію
			System.out.print(c);
		}
	}
}
