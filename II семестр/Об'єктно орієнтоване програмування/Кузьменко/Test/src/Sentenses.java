/**
 * @author Vova
 * клас речення. Відповідає, та реалізує поділ речення на слова та пунктуацію
 */
public class Sentenses {
	/**
	 * масив слів у реченні
	 */
	private Word[] words ;
	/**
	 * масив пунктуації
	 */
	private Punkt[] punkts ;
	/**
	 * конструктор
	 * @param sentens речення яке треба розбити
	 */
	public Sentenses(String sentens) {
		sentens = sentens.trim();
		//інціалізуємо слова. 
		// метод getNumberWord(sentens) повертає кількість слів
		words = new Word[getNumberWord(sentens)];
		//ініціалізуємо пунктуацію 
		//getNumberPunctuation(sentens) метод повертає кількість знаків пунктуації 
		punkts = new Punkt[getNumberPunctuation(sentens)];	
		int k = 0;
		int r = 0;
		/**
		 * ідея реалізації полягає у тому що ми речення розбиваємо по пробілах на масив слів
		 * деякі з цих слів будуть містити у собі пунктуацію, що буде знаходитись в самому кінці слова
		 * тому в циклі проходимо по словах і дивимось чи в них в кінці нема пунктуації
		 * якщо є, то створюємо слово а поітм пунктуацію (в тексті йде слово а потім пунктуація а не наоборот)
		 * якщо нема в кінці пунктуації, то просто створюємо слово
		 */
		String[] wordAndSumbols = sentens.split(" ");
		/**
		 * починаємо створеювати слова та пунктуацію
		 */
		for (String word : wordAndSumbols) {
			
			if (word.charAt(word.length() - 1) == '!'
					|| word.charAt(word.length() - 1) == ','
					|| word.charAt(word.length() - 1) == '?'
					|| word.charAt(word.length() - 1) == '-'
					|| word.charAt(word.length() - 1) == '.') {
				if (word.length()>2&&word.charAt(word.length() - 2) == '.'
						&& word.charAt(word.length() - 3) == '.') {
					//виключний випадок коли три крапки
					/**
					 * створюємо слово
					 */
					words[k] = new Word(word.substring(0, word.length() - 3));
					/**
					 * створюємо пунктуацію
					 */
					punkts[r] = new Punkt(word.substring(word.length() - 3));
					//для виведення тексту необхідно після кожного слова ще дописувати пробіл (бо коли ми розбивали на масив слів методом split
					//пробіли до слів не записуються
					System.out.print(" ");
					k++;
					r++;
				}else{
					/**
					 * створюємо слово
					 */
					words[k] = new Word(word.substring(0, word.length() - 1));
					/**
					 * створюємо пунктуацію
					 */
					punkts[r] = new Punkt(word.substring(word.length() - 1));
					System.out.print(" ");
					k++;
					r++;
				}
			} else {
				/**
				 * створюємо слово
				 */
				words[k] = new Word(word);
				System.out.print(" ");
				k++;

			}
			;
		}
	}

	public static int getNumberWord(String str) {
		return str.split(" ").length;
	}

	public static int getNumberPunctuation(String str) {
		int count = 0;
		for (int i = 0; i < str.length(); i++) {
			if (str.charAt(i) == '.' || str.charAt(i) == '!'
					|| str.charAt(i) == '?' || str.charAt(i) == ','
					|| str.charAt(i) == '-') {
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
