public class Lab1 {
	public static void main(String[] args) {
		byte a=1, n=5, b=3, m=8, i, j;
		// ������������ ��������� � �� ���� S
		double S=0;
		int C=2;
		// �������� ������� ���������
		if ((a<=n)&&(b<=m)){	
		    		  for (i=a; i<=n; i++)
		    		  // �������� �� ����� ������ �� 0
		    		  if (i!=C) {
		    			  for (j=b; j<=m; j++)
			    		  S += (double) (i+j)/(i-C);
		    			  System.out.println("S = " + S);
		    		  }
		    		  else {
		    		  System.out.println("ĳ����� �� 0");
		    		  break;	  
		    		  }
			// ��������� ����������
		   }
		else System.out.print("������� � �������� ���������");
		}
}
