
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
			System.out.println("������� ����� �������� �����:");
			System.out.println("1 - ���������");
			System.out.println("2 - ����");
			w=in.nextInt();
			}catch(Exception e){System.out.println("������� ������, ������� ������� �����"); ERROR=true; return;}
			
			switch(w){
			case 1:{
				try{
				System.out.print("������ ��������� �������:");
				a.setN(in.nextInt());
				}catch(Exception e){System.out.println("������� ������, ������� ������� �����"); ERROR=true; return;}
				System.out.println("������ �������� ������� (0 ��� 1)");
				for (int i=0; i<a.getN(); i++) {
					for (int j=0; j<a.getN(); j++) {
						try{
						b=in.nextByte();
						if (b==0 || b==1) {
						 a.setA(i,j,b);
						}
						else {System.out.println("������ �����");j--;}
						}catch(Exception e){System.out.println("������� ������"); ERROR=true; return;}
					}
				}
				break;}
			
			case 2:{
				System.out.println("������ ���� �� �����:");
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
					} catch(Exception e){System.out.println("������������ �������"); pp.close(); ERROR=true; return;}
				}catch(FileNotFoundException e){System.out.println("������������ ����"); ERROR=true; return;}
				break;}
				
			default:{System.out.println("������������ ������������� ��������"); ERROR=true; return;}
			}
			
			System.out.println("�������:");
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

