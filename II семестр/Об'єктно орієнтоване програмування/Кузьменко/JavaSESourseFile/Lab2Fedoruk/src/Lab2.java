public class Lab2 {
/**
 * ����������� ������ �2
 * @author Vova
 * ��������������� ����-�������� Character
 * ��������� ��� ����� ����� ��������� ���:
 * http://docs.oracle.com/javase/7/docs/api/java/lang/Character.html
 */
	public static void main(String[] args) {
		/**
		 * ����� ���
		 */
		char[][] masA = { { 'q', 'a', 'z', 'c' }, { 'q', 'e', 'f', 'b', 'r' },
				{ 'e', 'z', 't' } };
		char[][] masB = { { 'b', 'h', 'z', 't' }, { 'i', 'n', 'm', 'y', 'r' },
				{ 'v', 'z', 'l' } };
		
		/**
		 * �������� �� ������ �������.
		 * ���������� ������ ����� ��� �� ����� �������
		 * @param <flag> ������, ���� ������� ������ ����� ������� 
		 * masA �� ������� ������ ������ ����� ������� �� flag = false
		 */
		boolean flag = true;
		if (masA.length == masB.length) {
			int i=0;
			while (i < masB.length) {
				if (masB[i].length != masA[i].length) {
					flag = false;
				}
				i++;
			}
			
		}else flag = false;
		/**
		 * ���� flag=true �������� ���
		 */
		if (flag){
			/**
			 * ��������� ������� C
			 * �������� ���'��� ��� �����
			 */
			char [] [] masC = new char [masA.length][];
			/**
			 * �������� ���*��� � ������� ����� ��� �������� ����� ����� �������� �� ������ �������-�������.
			 */
			for (int i = 0; i < masC.length; i++) {
				masC[i] = new char [masB[i].length];
			}
			
			for (int i = 0; i < masC.length; i++) {
				for (int j = 0; j < masC[i].length; j++) {
					/**
					 * ���������� �� ��������� ���� ������� �������� �� Unicode
					 */
					if (Character.isDefined((Character.getNumericValue(masA[i][j])+Character.getNumericValue(masB[i][j])))){
						/**
						 * ��������� ���������. �������� ���������� ��� ����� � ��� int. ���� ������, 
						 * � ��������� ��������� �� ���� char
						 */
						masC[i][j] =(char) (Character.getNumericValue(masA[i][j])+Character.getNumericValue(masB[i][j]));
					}else
					System.out.println("����..������ �� ���������� �� Unicode");
				}
			}
			System.out.println("���������� ��������� �������");
			for (int i = 0; i < masC.length; i++) {
				for (int j = 0; j < masC[i].length; j++) {
					System.out.print(masC[i][j]+"|");
				}
				System.out.println();
			}
			
			/**
			 * ���������� ���� ������������ ������� � ������ ������� masC
			 * @param sum - ��� ������ ������������ ����
			 * @param max - ����� ��� ������ ������������� ��������
			 */
			char sum = '\u0000';
			char max = sum;
			for (int i = 0; i < masC.length; i++) {
				max = '\u0000';
				for (int j = 0; j < masC[i].length; j++) {
					if (masC[i][j]>max)
						max = masC[i][j]; 
				}
				/**
				 * ����� ���������� �� ������
				 */
				if (Character.isDefined((Character.getNumericValue(sum)+Character.getNumericValue(max)))){
					sum =(char) (Character.getNumericValue(max)+Character.getNumericValue(sum));	
				}
				
			}
			System.out.println("���������. ���� ��������� �������� ������� ����� �������:"+sum);
		}
		else System.out.println("����..����� ����� ���");
	}

}
