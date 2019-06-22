public class Sentence {
    public SentenceMember[] sentence_members;

    public Sentence(String s) {
        String[] split = s.split("((?<=[;,: \"?.!()])|(?=[;,: \"?.!()]))");
        sentence_members = new SentenceMember[split.length];
        int j = 0;
        for (int i = 0; i < split.length; i++) {
            if (split[i].isEmpty()) {
                continue;
            }
            if (split[i].contains("[") || split[i].contains("]") || split[i].contains(";")
                    || split[i].contains(",")|| split[i].contains(":")|| split[i].contains("\"")
                    || split[i].contains("?")|| split[i].contains(".")|| split[i].contains("!")
                    || split[i].contains("(")|| split[i].contains(")")) {
                sentence_members[j++] = new Punctuation(split[i]);
            }
            else {
                sentence_members[j++] = new Word(split[i]);
            }
        }

    }
    public String str() {
        String result = "";
        for (int i = 0; i < sentence_members.length; i++) {
            result += sentence_members[i].str();
        }
        return result;
    }
    public int length() {
        return sentence_members.length;
    }
}