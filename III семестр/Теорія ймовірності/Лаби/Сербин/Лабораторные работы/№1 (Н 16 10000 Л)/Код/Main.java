package labs.lab1_r;

public class Main {
    //Змінна довжини вибірки, порядку регістру
    final static int CHOICE_LENGTH = 10000, REGISTER_LENGTH = 16;
    //Віконний тест
    public static String result1=new String();
    public static String choice2=new String();


    public static void main(String[] args){
        /*for(int i=0;i<10000;i++){
            if(i!=9999) {
                choice2 += 0;
            }else {
                choice2+=1;
            }
        }*/
        String choice = Generator.generate(REGISTER_LENGTH, CHOICE_LENGTH);
        System.out.println("test no.1:\n" +(double)Test1.test(choice)/CHOICE_LENGTH);
        System.out.println("test no.2:\n" +(double)Test2.test(choice)/CHOICE_LENGTH);
        System.out.println("test no.3:");
        for(int i : Test3.test(choice)){
            System.out.println((double)i/(CHOICE_LENGTH-3));
        }

        System.out.println("test no.4:\n" + Berlecamp_Test.test(choice));
        System.out.println("period of repetition:\n" + Period_Test.period(result1));


    }

}
