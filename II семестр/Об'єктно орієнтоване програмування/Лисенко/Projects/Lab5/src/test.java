public class test {
    public static void main(String[] args) {
        String a = "A, b... Cc b!! ";
        Text b = new Text(a);
        for (Sentence i: b.getSentences()) {


            System.out.println(i.getSentence());
        }
        System.out.println(b.getTxt());
    }
}
