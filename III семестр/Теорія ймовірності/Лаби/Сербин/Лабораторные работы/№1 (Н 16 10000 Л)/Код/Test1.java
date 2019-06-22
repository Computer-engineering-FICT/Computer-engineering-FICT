package labs.lab1_r;

/**
 * Created by Alexander Serbin on 11/22/2015.
 */
public class Test1 {
    public static int test(String choice){
        int result = 0;
        for(int i = 0;i<choice.length();i++){
            result += Integer.parseInt(String.valueOf(choice.charAt(i)));
        }
        return result;
    }
}
