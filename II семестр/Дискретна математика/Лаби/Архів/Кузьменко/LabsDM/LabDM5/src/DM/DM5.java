package DM;
import java.util.Scanner;


public class DM5 {
	public DM5(){
		Scanner sc = new Scanner(System.in);
		System.out.println("�������� � ��������� - 1");
		System.out.println("�������� � ����� - 2");
		boolean q = true;
		int matr[][];
		do {
			int h = sc.nextInt();
			switch (h) {
			case 2:
				SumFile s = new SumFile("C:\\Users\\Lenovo\\Desktop\\matrDM5.txt");
				matr = s.getSum();
				q = false;
				break;
			case 1:
				System.out.println("������ ������� ������ �����");
				int size = sc.nextInt();
				matr = new int[size][size];
				System.out
						.println("������ ������� ������� �������� ���������");
				for (int i = 0; i < matr.length; i++) {
					for (int j = 0; j < matr[0].length; j++) {
						matr[i][j] = sc.nextInt();
					}
				}
				q = false;
				break;
			default:
				matr = null;
				q = true;
				System.out.println("input again");
				break;
			}
		} while (q);
		for (int i = 0; i < matr.length; i++) {
			for (int j = 0; j < matr.length; j++) {
				System.out.print(matr[i][j]+" ");
			}
			System.out.println();
		}
		System.out.println();
		int [] v = new int [matr.length];
		v[0]=1;
		while (hasVerch(v)) 
		{
			int min = 100;
			int end = -1;
			int start = -1;
			for (int i = 0; i < v.length; i++) 
			{
				if (v[i]==1)
				{
					for (int j = 0; j < matr.length; j++) 
					{
						
						if (matr[j][i]<min && matr[j][i]!=0 && v[j]==0){							
							min = matr[j][i];
							start = i;
							end = j;
						}
					}
				}
			}
		
			v[end]=1;
			System.out.println("("+ (start+1) + ":"+ (end+1) + ")");
			
		}
		
		
	
	}
	private boolean hasVerch(int [] v){
		boolean q = false;
		for (int is : v) {
			if (is==0) q = true;
		}
		return q;
	}
	
}
