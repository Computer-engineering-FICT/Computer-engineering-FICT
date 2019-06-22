public class Text {
	private Sentence[] sentences;

	public Text(String s) {
		String s1 = s.replaceAll("\\s+", " ");
		setTxt(s1);
	}

	public String getTxt() {
		String a="";
		for (Sentence i: this.sentences) {
			a+=i.getSentence()+" ";
		}
		return a.substring(0, a.length()-1);
	}

	public void setTxt(String a) {
		String[] ma = a.split("(?<=([.!?])) ");
		this.sentences = new Sentence[ma.length];
		for (int i = 0; i < ma.length; i++) {
			this.sentences[i] = new Sentence(ma[i]);
		}
	}

	public void setSentences(Sentence[] a){
		this.sentences = a.clone();
	}

	public Sentence[] getSentences (){
		return this.sentences.clone();
	}
}
