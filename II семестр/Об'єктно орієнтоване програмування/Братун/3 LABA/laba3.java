/**
 * Created by Андрей on 25.02.2017.
 */
public class laba3 {
    public static void main(String[] args) {
        String Str = "Один Два Три Черыте Пять";
        String Str2 = "СТОМИЛИАРДОВ";
        String result = "";
        int raz = 4;


        String[] words = Str.split(" ");
        for (int i = 0; i < words.length; i++){
            if (words[i].length() == raz) {
                words[i] = Str2;

            }
        }
        for (int j =0; j < words.length; j++){
            result += words[j] + " ";
        }


      System.out.println(result);

    }
}
