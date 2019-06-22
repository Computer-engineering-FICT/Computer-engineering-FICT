
public class Sentence
{
    public Sentence(String sentence)
    {
        String[] strings = sentence.trim().split(" ");
        SentenceMember[] sentenceMembers = new SentenceMember[strings.length];

        for (int i = 0; i < strings.length; i++)
            sentenceMembers[i] = new SentenceMember(strings[i]);

        this.sentenceMembers = sentenceMembers;
    }


    public String toString() {
        String s = new String();

        for (SentenceMember sm:sentenceMembers)
            s += sm.toString();

        return s;
    }

    public SentenceMember[] getSentenceMembers() {
        return sentenceMembers;
    }

    public void setSentenceMembers(SentenceMember[] sentenceMembers) {
        this.sentenceMembers = sentenceMembers;
    }

    private SentenceMember[] sentenceMembers;
}