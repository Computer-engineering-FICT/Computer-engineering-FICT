
package DMlab5;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class DMlaba5 {
	

	

		static Scanner in = new Scanner(System.in);
		static DopClass a = new DopClass();
		public static boolean ERROR = false;
		
		public static void Input(DopClass a){
			int w;
			byte b;
			try{
			System.out.println("Виберіть спосіб введення даних:");
			System.out.println("1 - Клавіатура");
			System.out.println("2 - Файл");
			w=in.nextInt();
			}catch(Exception e){System.out.println("Невірний символ, потрібно вводити число"); ERROR=true; return;}
			
			switch(w){
			case 1:{
				try{
				System.out.print("Введіть розмірність матриці:");
				a.setN(in.nextInt());
				}catch(Exception e){System.out.println("Невірний символ, потрібно вводити число"); ERROR=true; return;}
				System.out.println("Введіть елементи матриці (0 або 1)");
				for (int i=0; i<a.getN(); i++) {
					for (int j=0; j<a.getN(); j++) {
						try{
						b=in.nextByte();
						if (b==0 || b==1) {
						 a.setA(i,j,b);
						}
						else {System.out.println("Невірне число");j--;}
						}catch(Exception e){System.out.println("Невірний символ"); ERROR=true; return;}
					}
				}
				break;}
			
			case 2:{
				System.out.println("Введіть шлях до файлу:");
				String put = in.nextLine();
				put = in.nextLine();
				try{
				Scanner pp = new Scanner(new File(put));
					try {
					a.setN(Integer.parseInt(pp.nextLine()));
					for (int i = 0; i <a.getN(); i++) {
						for (int j = 0; j <a.getN(); j++)
							a.setA(i, j, pp.nextInt());
						if (pp.hasNextLine())pp.nextLine();
						else pp.close();
						}
					} catch(Exception e){System.out.println("Неправильний елемент"); pp.close(); ERROR=true; return;}
				}catch(FileNotFoundException e){System.out.println("Неправильний шлях"); ERROR=true; return;}
				break;}
				
			default:{System.out.println("Неправильний ідентифікатор операції"); ERROR=true; return;}
			}
			
			System.out.println("Матриця:");
			System.out.print("   ");
			for (int m=0; m<a.getN(); m++) {
				System.out.print("x" +(m+1) +" ");
			}
			for (int i=0; i<a.getN(); i++) {
				System.out.println();
				System.out.print("x" +(i+1) +" ");
				for (int j=0; j<a.getN(); j++) {
				System.out.print(a.printA(i, j) +"  ");	
				}
			}
			System.out.println();
		}
		
		
		public static void main(String[] args) {
			Input(a);
			a.setSNum();
			a.Sort();
			a.SetColor();
		}
	}

