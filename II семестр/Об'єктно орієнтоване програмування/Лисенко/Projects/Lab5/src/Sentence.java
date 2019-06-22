public class Sentence {
	private PartOfSentence[] partsOfSentence;

	public Sentence(String a) {
		setSentence(a);
	}

	public String getSentence() {
		String a = "";
		for(int i=0; i<partsOfSentence.length-1; i++){
			if (partsOfSentence[i].getNameOfPart().equals("Word")) {
				a += partsOfSentence[i].getWord();
			} else {
				a += partsOfSentence[i].getPunctuation();
			}
			if (partsOfSentence[i+1].getNameOfPart().equals("Word")){
				a+=" ";
			}
		}
		if (partsOfSentence[partsOfSentence.length-1].getNameOfPart().equals("Word")) {
			a += partsOfSentence[partsOfSentence.length-1].getWord();
		} else {
			a += partsOfSentence[partsOfSentence.length-1].getPunctuation();
		}
		return a;
	}

	public void setSentence(String a) {
		String[] ma = a.split("(?<=([,;:\\-.!?])) ?|(?=[,;:\\-.!?])| ");
		partsOfSentence = new PartOfSentence[ma.length];
		for (int i=0; i<ma.length; i++){
			if (ma[i].equals(",") || ma[i].equals(";") || ma[i].equals(":") || ma[i].equals("-") ||
									 ma[i].equals(".") || ma[i].equals("!") || ma[i].equals("?")){
				partsOfSentence[i] = new PartOfSentence("Punctuation", ma[i]);
			} else {
				partsOfSentence[i] = new PartOfSentence("Word", ma[i]);
			}
		}
	}

	public void setPartsOfSentence(PartOfSentence[] a){
		partsOfSentence = a.clone();
	}

	public PartOfSentence[] getPartsOfSentence (){
		return partsOfSentence.clone();
	}
}
