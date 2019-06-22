public class Text {
    Sentence[] sentences;

    public Text(String s) {
        String[] split = s.split("((?<=[;,:\"?.!]))");   /*|(?=[;,:"?.!]))*/
        sentences = new Sentence[split.length];
        for (int i = 0; i < split.length; i++) {
            sentences[i] = new Sentence(split[i]);
        }
    }
    public Text clear_from_spaces() {
        String operating_text = this.str();
        for (int i = 0; i < operating_text.length(); i++) {
            if (operating_text.charAt(i) == ' ') {

                if (i+1<operating_text.length()) {
                    int j = 1;
                    while (operating_text.charAt(i + j) == ' ') {
                        operating_text = operating_text.substring(0, i + j) + "" + operating_text.substring(i + j + 1, operating_text.length());

                    }
                }
            }
        }
        return new Text(operating_text);
    }
    public String str() {
        String result = "";
        for (int i = 0; i < sentences.length; i++) {
            result += sentences[i].str();
        }
        return result;
    }
    public void print() {
        System.out.println(this.str());
    }
}