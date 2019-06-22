/*
C2  = 6116 % 2 = 0 => О1 +
C3  = 6116 % 3 = 2 => С = 2
C5  = 6116 % 5 = 1 => О2 /
C7  = 6116 % 7 = 5 => float i,j
 */
public class lab1{

    public static void main(String[] args) {

        Read obj = new Read();
        System.out.print("enter a: ");
        float a = obj.readFloat();
        System.out.print("enter b: ");
        float b = obj.readFloat();
        System.out.print("enter n: ");
        float n = obj.readFloat();
        System.out.print("enter m: ");
        float m = obj.readFloat();
        //float iInc = obj.readFloat("iInc");
        //float jInc = obj.readFloat("jInc");

        float i = a;
        float j;
        float p = 0;

        while (i <= n) {
            j = b;
            while (j <= m) {
                if (j != 0 && i+2 != 0) {
                    float tmp = (i / j) / (i + 2);
                    p += tmp;
                } else {
                    System.out.println("denominator is zero, summand ignored (i=" + i + ", j=" + j + ")");
                }
                j++;
                //j += jInc;
            }
            i++;
            //i += iInc;
        }

    System.out.println("result: " + p);

    }
}
