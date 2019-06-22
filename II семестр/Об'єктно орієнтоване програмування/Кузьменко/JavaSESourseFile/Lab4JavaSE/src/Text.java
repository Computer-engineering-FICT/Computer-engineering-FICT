class Text {
	private Sentence[] data;
	
	Text(String text) {
		char sumbol;
		int k = 0;
		int i;
		int j = 0;
		// виконуЇмо зам≥ну посл≥довност≥ табул€ц≥й одним проб≥лом
		text = tab(text);
		// знаходимо к≥льк≥сть речень у текст≥
		for (j = 0; j < text.length(); j++) {
			sumbol = text.charAt(j);
			if (sumbol == '.') {
				if ((j > 1)
						&& (j < text.length() - 1)
						&& ((text.charAt(j + 1) == '.') && (text.charAt(j + 2) == '.'))) {
					k++;
					j++;
					j++;
				} else {

					k++;
				}
			} else if ((sumbol == '?') | (sumbol == '!')) {

				k++;
			}
		}
		/*
		 * створюЇмо масив об'Їкт≥в класу Sentence розм≥ром k
		 */
		Sentence[] sentenses = new Sentence[k];
		i = 0;
		int l = -1;
		/*
		 * записуЇмо кожне реченн€ у елемент масиву sentenses
		 */
		for (j = 0; j < text.length(); j++) {
			sumbol = text.charAt(j);

			if (sumbol == '.') {
				if ((j > 1)
						&& (j < text.length() - 1)
						&& ((text.charAt(j + 1) == '.') && (text.charAt(j + 2) == '.'))) {
					l++;
					sentenses[l] = new Sentence(text.substring(i, j + 3));
					i = j + 3;
					j++;
					j++;
				} else {
					l++;
					sentenses[l] = new Sentence(text.substring(i, j + 1));
					i = j + 2;
				}
			} else if ((sumbol == '?') | (sumbol == '!')) {
				l++;
				sentenses[l] = new Sentence(text.substring(i, j + 1));
				i = j + 2;

			}

		}
		data = sentenses;
	}

	// метод зам≥нюЇ посл≥довн≥сть табул€ц≥й одним проб≥лом
	private String tab(String str) {
		StringBuffer x = new StringBuffer(str);
		for (int i = 0; i < x.length(); i++) {

			if (x.charAt(i) == ' ') {
				do
					if (x.charAt(i + 1) == ' ')
						x.deleteCharAt(i);
				while ((x.charAt(i + 1) == ' '));
				if (x.charAt(i + 1) == ' ')
					x.deleteCharAt(i);
				else if (x.charAt(i + 1) == '.')
					x.deleteCharAt(i);
				else if (x.charAt(i + 1) == '!')
					x.deleteCharAt(i);
				else if (x.charAt(i + 1) == '?')
					x.deleteCharAt(i);

			}

		}

		str = new String(x);
		return str;
	}

	// метод повертаЇ реченн€ по його номеру i
	public String getSentences(int i) {
		return data[i].GetSen();
	}

	// метод повертаЇ к≥льк≥сть речень
	public int sentenceNumber() {
		return data.length;
	}

	

}