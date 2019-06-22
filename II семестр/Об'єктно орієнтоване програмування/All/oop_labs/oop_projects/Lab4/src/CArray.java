import java.util.Arrays;

public class CArray{
	public static void main(String[] args) {
		byte[][] array = {{6, 2, 3, 0, 6}, {8, 4, 3, 7, 5}, {7, 5, 9, 5, 1}, {2, 1, 7, 8, 4}};	//����� �����
		int row = 1, col = 5;	//������ ����� � ��������, ��� ���� ����������� �������� ����������
		
		//������� �������� ����� ��� ����������, ��� �� �������� ����� ���
		byte[][] copiedArray1 = new byte[array.length][array[0].length];
		byte[][] copiedArray2 = new byte[array.length][array[0].length];
		copiedArray1 = copyArray(array, copiedArray1);
		copiedArray2 = copyArray(array, copiedArray2);
		
		System.out.println("�����:");	//����� �����
		showArray(array);

		boolean b1 = sortRow(copiedArray1, row);
		if (b1 == true){
			System.out.println("³����������� ����� �� " + (row + 1) + " ������:");
			showArray(copiedArray1);
		}
		else{
			System.out.println("���������� ���������. ������ ����� �� ����");
		}
		
		boolean b2 = sortColumn(copiedArray2, col);
		if (b2 == true){
			System.out.println("³����������� ����� �� " + (col + 1) + " ����������:");
			showArray(copiedArray2);
		}
		else{
			System.out.println("���������� ���������. ������ ��������� �� ����");
		}	
		
		Double d1 = new Double(CArray.averageRow(array, row));
		if (d1.isNaN() == false){
			System.out.println("������ �������� " + (row + 1) + " �����: " + CArray.averageRow(array, row));
		}
		else{
			System.out.println("³�������� ���������� ���������. ������ ����� �� ����");
		}
		
		Double d2 = new Double(CArray.averageRow(array, col));
		if (d2.isNaN() == false){
			System.out.println("������ �������� " + (col + 1) + " ���������: " + CArray.averageColumn(array, col));
		}
		else{
			System.out.println("³�������� ���������� ���������. ������ ��������� �� ����");
		}	
	}

	
	public static double averageRow(byte[][] array, int row){	//������� ������ ����������� ��������� �����
		int s = 0;
		double aver = 0.0;
		if ((row >= 0) && (row < array.length)){
			for(int j = 0; j < array[row].length; j++){
				s += array[row][j];
			}
			aver = (double)s/array[row].length;
			return aver;
		}
		else{
			return Double.NaN;
		}
	}

	public static double averageColumn(byte[][] array, int col){	//������� ������ ����������� ��������� ���������
		int s = 0;
		double aver = 0;
		if ((col >= 0) && (col < array[0].length)){
			for(int i = 0; i < array.length; i++){
				s += array[i][col];
			}
			aver = (double)s/array.length; 
			return aver;
		}
		else{
			return Double.NaN;
		}
	}

	public static boolean sortRow(byte[][] array, int row){	//����� ���������� �� �����
		if ((row >= 0) && (row < array.length) ){
			Arrays.sort(array[row]);
			return true;
		}
		return false;
	}

	public static boolean sortColumn(byte[][] array, int col){	//����� ���������� �� ���������
		byte[] mas = new byte[array.length];	//��������� ����� ����������� �����
		if ((col >= 0) && (col < array[0].length) ){
			for(int i = 0; i < array.length; i++){
				mas[i] = array[i][col];
			}
			Arrays.sort(mas);	//������� ����������� �����
			for(int i = 0; i < array.length; i++){	//���������� ������������ �������� � �������� �����
				array[i][col] = mas[i];
			}
			return true;
		}
		return false;
	}

	public static void showArray(byte[][] array){	//����� ��� ����� �� ����� ������
		for(int i = 0; i < array.length; i++){
			for(int j = 0; j < array[i].length; j++){
				System.out.printf("  " + array[i][j]);
			}
			System.out.println();
		}
	}
	
	public static byte[][] copyArray(byte[][] array, byte[][] copiedArray){	//����� ��������� ������
		for(int i = 0; i < array.length; i++){
			for(int j = 0; j < array[i].length; j++){
				copiedArray[i][j] = array[i][j];
			}
		}
		return copiedArray;
	}
}
