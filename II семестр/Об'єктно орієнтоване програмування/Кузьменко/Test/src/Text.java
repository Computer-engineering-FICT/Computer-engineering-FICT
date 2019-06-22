/**
 * Клас текст. Мстить у собі масив об'єктів класу Sentenses.
 * Виконує поділ тексту на речення.
 * @author Vova
 *
 */
public class Text {
	/**
	 * речення тексту
	 */
	private Sentenses[] sentenses;

	/**
	 * конструктор класу. Отримує на вхід текст.
	 * @param text
	 */
	public Text(String text) {
		/**
		 * ініціалізує масив речень. для знаходження кількості речень викликається метод getNumberPunctuation(text) 
		 */
		sentenses = new Sentenses [getNumberPunctuation(text)];
		int start=0;
		int k =0;
		/**
		 * створення об'єктів класу речення.
		 */
		for (int i = 0; i < text.length(); i++) {
			char buf = text.charAt(i);
			if (buf=='.'||buf=='!'||buf=='?'){
				if (i+2<text.length()&&text.charAt(i+1)=='.'&&text.charAt(i+2)=='.'){
				//тут створюється речення, яке закінчується на три крапки
				sentenses [k] = new Sentenses(text.substring(start, i+3));	
				i=i+3;
				start = i;
				k++;
				}else{
					//тут також створюється речення, але яке закінчується на крапку, бо знак оклику чи питання
					sentenses [k] = new Sentenses(text.substring(start, i+1));
					start = i+1;
					
					k++;
				}
			}
			
		}
	}
	
	/**
	 * метод рахує кількість речень у тексті
	 * @param str текст
	 * @return кілкьість речень
	 */
	public static int getNumberPunctuation(String str) {
		int count = 0;
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) == '.' || str.charAt(i) == '!'
					|| str.charAt(i) == '?') {
				if ((i + 2) < str.length() && str.charAt(i + 1) == '.'
						&& str.charAt(i + 2) == '.') {
					count++;
					i = i + 2;
				} else {
					count++;

				}
			}

		}
		return count;
	}
}
