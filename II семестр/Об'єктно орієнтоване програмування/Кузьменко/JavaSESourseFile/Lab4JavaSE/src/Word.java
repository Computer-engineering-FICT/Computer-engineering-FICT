public class Word {
	private Letter[] data;
	

	public Word(String word_string) {
		Letter[] letters_word = new Letter[word_string.length()];
		for (int i = 0; i < word_string.length(); i++) {
			letters_word[i] = new Letter(word_string.charAt(i));
		}
		data = letters_word;
	}

	// метод повертає слово
	public String getWord() {
		String str=new String();
		String word = new String();
		for (int i = 0; i < data.length; i++) {
			str=String.valueOf(data[i].getLetter());
			word=word.concat(str);
		}
		return word;
	}

	// метод повертає кількість голосних у заданому слові
	public int find() {
		int counter = 0;
		for (int i = 0; i < data.length; i++) {
			if (data[i].isVowelLetter())
				counter++;
		}
		return counter;
	}
}
