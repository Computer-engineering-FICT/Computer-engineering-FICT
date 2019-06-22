package labs.lab1_r;

/**
 * Created by Alexander Serbin on 11/22/2015.
 */

public class Period_Test {
    public static int period(String result){
        int period = 0;
        for(int i = 1;i<result.length()/2;i++){
            String s = result.substring(0, i);
            String ss = result.substring(i,i+s.length());
            if(ss.equals(s) && i>5){
                period = s.length();
                break;
            }
        }
        return period;
    }
}
