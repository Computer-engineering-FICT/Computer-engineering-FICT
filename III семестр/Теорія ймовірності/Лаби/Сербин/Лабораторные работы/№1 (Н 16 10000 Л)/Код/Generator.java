package labs.lab1_r;

/**
 * Created by Alexander Serbin on 11/22/2015.
 */
public class Generator {
    public static String generate(int reg, int length){
        String register = new String();
        String result = new String();
        String result1=new String();
        int c1=0;
//        register="100001";
//        register="1100110011001100";
//        register="1000000000010110";
//        register="00001111000011110000";
//          int[]arr={1, 0, 0, 0, 0, 0, 0, 0,0,0,0,1,0,1,1,0};
//        int []arr=  {8,4,3,2};
//        int[]arr={1,0,0,0,1,};
//        int arr[]={1,0,0,1,0,1,1,1,1,1,1,1,1,1,1,0};
        //register  16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0            //polynomial
//        int []arr={1,0,0,0,0,0,0,0,0,0,0,1,0,1,1,0,/*,0,1,0,0,0,0,0,0,0,0,0,1*/};
//        arr={1,0,0,};
        for(int i = 0;i<reg;i++) {
//            arr[i]=(int)(Math.random()*2);
//            register+=arr[i];
            register+=(int)(Math.random()*2);
//////            if (i ==16-1 || i==12-1 || i==3-1) {
//////                register += 1;
//////            } else{
//////                register += 0;
//////             }
        }
        System.out.println("register = " + register);

        int[] set =/*{1,1,0,1,1,0,1,0,};*/ new int[(int)Math.pow(2, reg-1 )];


        int counter3=0;
        int v1=4,v2=2*v1;

        System.out.println("table");                                                    //TABLE
        for(int ii = 0;ii<set.length;ii++){
            set[ii] = (int)(Math.random()*2);
//            if(ii%16==0 ||ii%14==0||ii%13==0||ii%11==0){
//                set[ii]=1;
//            }else{
//                set[ii]=0;
//            }
//            if(counter3%arr.length==0){
//                counter3=0;
//            }
//            if(arr[counter3]==1){
//                set[ii]=0;                      //setting 1
//            }else{
//                set[ii]=1;
//            }
//            set[ii]=arr/*[arr.length-counter3-1];*/[counter3];
//            counter3++;
//            if(ii%150==0){
//                System.out.println();
//            }
//            if(ii%16==0){
//                System.out.print(" ");
//            }
//            System.out.print(set[ii]);

//            if(counter3<v1) {
//                set[ii] = 1;
//            }
//                if(counter3>v1 && counter3<v2) {
//                    set[ii] = 0;
//                }
//            counter3++;
//            if (ii%v2==0){
//                counter3=0;
//            }
//            if(ii%150==0){
//                System.out.println();
//            }
//            System.out.print(set[ii]);

//            System.out.println(set[ii]);
//            set[ii]=register.charAt(ii%16);
//            int q=(int)Math.random()*2;
//            if(q==1){
//                set[ii]=0;
//
//
// }else{
//            if(ii%2/*Math.pow(2,)*/==0) {
//                set[ii] = 0;
//            }else {
//                set[ii]=1;
//            }
//            int counter11=0;
//            if(ii%64!=0) {
//                if(counter11==64){
//                    counter11=0;
//                }
//                if(counter11<32 ) {
//                    set[ii] = 1;
//                    counter11++;
//
//                }else {
//                    set[ii]=0;
//                    counter11++;
//
//                }
        }
//
//        System.out.println("\nSEQUENCE\n");
        for(int i = 0;i<Math.pow(2,reg)*2;i++){


            //Старший біт
            int oldBit = Integer.parseInt(String.valueOf(register.charAt(0)));
            //Сдвиг вліво з додаванням суми бітів по модулю  два
            int numberInSet = Integer.parseInt(register.substring(1, reg),2);
            int newBit = (oldBit + set[numberInSet])%2;
//            if(newBit==1){
//                newBit=0;
//            }else {
//                newBit=1;
//            }
            register = register.substring(1,reg)+newBit;

            if (i<10000) {
                result += oldBit;
            }
            result1+=oldBit;

            if (i%150==0){
                System.out.println();
            }
//            System.out.print(result.charAt(i));
//            System.out.print(oldBit);

                c1+=oldBit;
            System.out.print(oldBit);

        }
        System.out.println();
//        for(int i = 0;i<Math.pow(2,16)*2;i++){
//
//
//            //Старший біт
//            int oldBit = Integer.parseInt(String.valueOf(register.charAt(0)));
//            //Сдвиг вліво з додаванням суми бітів по модулю два
//            int numberInSet = Integer.parseInt(register.substring(1, reg),2);
//            int newBit = (oldBit + set[numberInSet])%2;
//            register = register.substring(1,reg)+newBit;
//            result1 += oldBit;
//
//
//
//        }
//        for(int o=0;o<Math.pow(2,16)*2;o++){
//            result+=0;
//        }
//        System.out.println("c1 = " + c1);
        Period_Test.period(result1);
        Main.result1=result1;
        return result;
    }
}
