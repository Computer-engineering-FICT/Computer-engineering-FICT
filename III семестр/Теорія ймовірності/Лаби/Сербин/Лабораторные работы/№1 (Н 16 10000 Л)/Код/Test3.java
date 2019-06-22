package labs.lab1_r;

/**
 * Created by Alexander Serbin on 11/22/2015.
 */
public class Test3 {
    public static int[] test(String result){

        int[] resul = new int[8];
        for(int i = 0;i<result.length()-3;i++){
            resul[Integer.parseInt(result.substring(i, i+3),2)]++;
        }
        return resul;

    }
}
