import java.util.Random;

public class Lfsr {

    private boolean[] srcArr;
    private byte[] polinomical;

    Lfsr(byte[] arr){
        srcArr= new boolean[arr[0]];
        polinomical= arr;

        //create start random info
        Random r= new Random();
        for (int i=0;i<srcArr.length;i++){
            int tmp= r.nextInt();
            if (tmp%2==0) srcArr[i]= true;
        }
    }

    byte shift (){
        //save first
        boolean first= srcArr[0];

        //xor with other cells, that in polynom
        for (int i=1;i<polinomical.length;i++){
            srcArr[srcArr.length-polinomical[i]]^=first;
        }

        //shift and first goes last
        shiftLeft(srcArr);
        srcArr[srcArr.length-1]= first;

        if (first) return 1;
        else  return 0;
    }

    private void shiftLeft(boolean[] srcArr){
        int size= srcArr.length;
        boolean[] tmpArr= srcArr;
        for (int i=0;i<size-1;i++){
            srcArr[i]= tmpArr[i+1];
        }
    }

}
