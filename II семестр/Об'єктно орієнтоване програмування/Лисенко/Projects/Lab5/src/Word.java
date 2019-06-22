/*public class Word extends PartOfSentence {

	private Letter[] letters;

	public Word(String a) {
		setWord(a);
	}

	public String getWord() {
		String a = "";
		for(Letter i: this.letters) {
			a+=i.getLetter();
		}
		return a;
	}

	public void setWord(String a) {
		this.letters = new Letter[a.length()];
		for (int i = 0; i < a.length(); i++) {
			this.letters[i] = new Letter(a.charAt(i));
		}
		this.setStr(a);
	}

	public void setSentences(Letter[] a){
		this.letters = a.clone();
	}

	public Letter[] getSentences (){
		return this.letters.clone();
	}

}
*/