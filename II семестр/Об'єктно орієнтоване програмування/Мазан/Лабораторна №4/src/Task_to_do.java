import java.util.Scanner;
public class Task_to_do {
    private int word_length;
    private Sentence [] array_of_question_sentences;
    private String []result_words;

    private void scan() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("\nВведіть довжину слів, які треба вивести із питальних речень: ");
        try {
            word_length = scanner.nextInt();
        } catch (Exception exception) {
            System.out.println("\nВиникла помилка: " + exception);
        }
    }


    private void array_of_question_sentences(Text t) {
        int asks_count = 0;
        for (int i = 0; i < t.sentences.length; i++) {
            if (t.sentences[i].sentence_members[t.sentences[i].sentence_members.length - 1].str().equals("?")) {
                asks_count += 1;
            }
        }
        array_of_question_sentences = new Sentence[asks_count];
        int k = 0;
        for (int i = 0; i < t.sentences.length; i++) {
            if (t.sentences[i].sentence_members[t.sentences[i].sentence_members.length-1].str().contains("?")) {
                array_of_question_sentences[k] = t.sentences[i];
                k+=1;
            }
        }
    }


    private void array_of_necessary_words() {
        int k =0;
        int counter = 0;
        for (int i = 0; i < array_of_question_sentences.length; i++) {
                for (int j = 0; j < array_of_question_sentences[i].sentence_members.length; j++) {
                    if ((array_of_question_sentences[i].sentence_members[j] instanceof Word)) {
                        counter += 1;
                    }
                }
        }

        result_words = new String[counter];
        for (int i = 0; i < array_of_question_sentences.length; i++) {
            for (int j = 0; j < array_of_question_sentences[i].length(); j++) {
                outerloop:
                if ((array_of_question_sentences[i].sentence_members[j] instanceof Word) && (array_of_question_sentences[i].sentence_members[j].length() == word_length)) {
                    for (int f = 0; f < k; f++) {
                        if (result_words[f].equals(array_of_question_sentences[i].sentence_members[j].str())) {
                            break outerloop;
                        }
                    }
                    result_words[k] = array_of_question_sentences[i].sentence_members[j].str();
                    k+=1;
                }
            }
        }
    }


    public void result(Text text) {
        this.scan();
        this.array_of_question_sentences(text);
        this.array_of_necessary_words();
        System.out.println("\nСлова заданої довжини: ");
        for (int i = 0; i < result_words.length; i++) {
            if (result_words[i] == null) {
                continue;
            }
            System.out.println(result_words[i]);
        }
    }


}
