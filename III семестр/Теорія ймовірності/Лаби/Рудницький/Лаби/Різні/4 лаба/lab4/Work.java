package src.com.lab4;

import java.util.Arrays;


public class Work {
	public Work(int []R){
		this.R=R;
	}
	
	private int []R;
	
	
	//����� �������
	private int border = 9;
	
	
	
	//�������� ������� �������� �������
	double[] border_array = new double [border];
	
	//�������� ������� �������
	int [] position_array = new int [border];
	
	//��������� ��������� �� ����� ������
	double [] border_position_piece = new double [border+1];
	
	
	public void borders (int [] R){

		//������ ����� ��������� �� ���� � ����� �������
		int count_numb = R.length/border;
		
		//����������, �� ���� ��������� �-��� ������� (100, 200, 300 ...)
		int k=1;
		for (int i=count_numb; i<R.length-1;i=k*count_numb){
			//���� ��� ������� � �������� ���
			if(R[i]!=R[i+1]){
				//�������� � ����� ������ ��������
				position_array[k-1]=i;
				border_array[k-1]=(R[i+1]+R[i])/2;
			//	System.out.println(position_array[k-1]);
			}else{
				//����, ���� ������ ������ ������
				//���� �� 1 �� ������ ������� ������ � ��������� �������
				for (int f=1;f<R.length-i;f++){
					//���� ��� � ���� ��������� �� ����� ������������ - ������ ������ �������� � ����� � ����� 
					if(R[i]!=R[i+f]){
						border_array[k-1]=(R[i]+R[i+f])/2;
						position_array[k-1]=i+f;
						break;
					}
				}
			}
			k++;
		}
		
		//���� ���� ��� � ������� ���� �� 1 �� ����
		//if((R.length-k*count_numb)>=1){
			position_array[position_array.length-1] = R.length-2;
			border_array[border_array.length-1] = (R[R.length-2]+R[R.length-1])/2;
			//System.out.println(Arrays.toString(border_array));
		//}
		
		
		
		System.out.println("��������� �� ����� ������");
		for (int i=0; i<border;i++){
			// ��� ������� �������
			if(i==0){
				double pos1 = R[position_array[i]]-R[0];
				double pos2 = R[R.length-1];				
				border_position_piece[i]=(double)(pos1/pos2);
				System.out.println((double)(pos1/pos2));
			}else{
				//��� ��� �����
				double pos1 = R[position_array[i]]-R[position_array[i-1]];
				double pos2 = R[R.length-1];
				border_position_piece[i]=(double)(pos1/pos2);
				System.out.println((double)(pos1/pos2));
			
			}
				
		}
		
		//������ ����� ���� ������ ����� �� ������� �������
		double sum=0;
		//double pos1 = R[R.length-1]-R[border_array.length-1];
		//double pos2 = R[R.length-1];
		//System.out.println(pos1/pos2);
		//������� �������
		//border_position_piece[border_position_piece.length-1]=pos1/pos2;
		
		for (int i=0;i<border_position_piece.length;i++){
			//System.out.println(border_position_piece[i]);
			sum+=border_position_piece[i];
		}
		
		
		System.out.println("�������� ���������: "+sum);
		
		
		}

	public void chisqure(){
		double sum= 0.0;
		int count_numb = R.length/border;
		for (int i=0;(int) i<border;i++){
			sum+=(Math.pow(count_numb-R.length*border_position_piece[i],2))/(R.length*border_position_piece[i]);
			//System.out.println(sum);
		}
		System.out.println("ճ �������: "+sum);
	}
	
	
	
}
