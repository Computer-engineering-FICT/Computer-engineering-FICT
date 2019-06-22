package Minimization;

public class Code {      
    public static int setBit(int body, int num) {
        return  body | (1<<num);        
    }
    
    public static int invertBit(int body, int num) {
        return body ^ (1<<num);
    }
          
    public static String toString(int body, int length) {
        String str = "";
        str = Integer.toBinaryString(body);
        if (str.length() > length) {
            int t = str.length() - length;
            str = str.substring(t);
        }
        if (str.length() < length) {
            int t = length - str.length();
            for (int i = 0; i < t; i++) {
                str = "0" + str;
            }
        }
        return str;
    }    
    
    public static boolean isNonConflictPair(Integer i1, Integer i2, int len) {
        int t = i1 ^ i2;
                       
        for (int i = 0; (i < len)  && ((t & 1) == 0); i++) {
            t >>= 1;
        }
        
        return (t == 1);
    }

    
    public static int log2plus(double num) {
    	if (num == 1) return 1;
   		double x = Math.log(num)/Math.log(2);
   		if (x > (int) x) {
   			return (int) x + 1;
   		} else {
   			return (int) x;
   		}
    }
    
    public static int getBit(int num, int place) {
    	return (num >> place - 1) & 1;
    }    
}

