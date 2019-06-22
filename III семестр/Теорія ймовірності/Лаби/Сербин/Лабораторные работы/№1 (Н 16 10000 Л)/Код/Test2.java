package labs.lab1_r;

/**
 * Created by Alexander Serbin on 11/22/2015.
 */
public class Test2 {
    public static int test(String choice){
        int result = 0;
        for(int i = 0;i<choice.length()-1;i++){
            result += (Integer.parseInt(String.valueOf(choice.charAt(i)))+Integer.parseInt(String.valueOf(choice.charAt(i+1))))%2;
        }
        return result;
    }
}
