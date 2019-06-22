package lab5;

/**
 * Created by Max-Burbil on 05.04.2017.
 */
import java.util.Scanner;
public class Lab5  {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        String text = "Beautiful is better than ugly.\n" +
                "Explicit is better than implicit." + '\n'+
                "Simple is better than complex." + '\n'+
                "Complex is better than complicated." + '\n'+
                "Flat is better than nested." + '\n'+
                "Sparse is better than dense." + '\n'+
                "Readability counts."+ '\n' ;

        Text str = new Text(text);
        str.ObjSplit();
        System.out.print(text);
        try {
            System.out.print("Введите длину слова: ");
            int a = scan.nextInt();
            scan.nextLine();
            System.out.print("Введите текст-замену: ");
            String s = scan.nextLine();
            System.out.print("\n");
            str.myTask(a,s);

        }
        catch (java.util.InputMismatchException e){
            System.out.println("Введите целое число!");
        }


    }

}


