package com.lab111.labwork6;
/**
 * ����������� �����
 * @author Nightingale
 *
 */
public class Test6 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MyHandler b[]=new MyHandler[3];
		/**
		 * ������ ������  �����������
		 */
		b[0]=new Button_Leaf();
		b[0].SetHelp("������ ������");
		b[1]=new Button_Leaf();
		/**
		 * ��� ���� ������
		 */
		MyHandler b1[]=new MyHandler[1];
		b1[0]=new Button_Leaf();
		b[2]=new Panel_Component(b1);
		b[2].SetHelp("������1");
		/**
		 * ������ ������� ������
		 */
		Panel_Component p=new Panel_Component(b);
		p.SetHelp(" ������� ������� ������");
		System.out.println("������� �� ������� ������ ");
		p.Focuse();
		System.out.println("������������ ��� ������������� �� ���������� ");
		p.HandleDown();
		System.out.println("�������� ������� ������ �� 2� ������(��� �� ������� ��  ������) ");
		b[2].HandleUp();
		/**
		 * ����� ������� �� ��������� - �� ��������� ����� ������������
		 */
		System.out.println("��� ������ �� ����� ���� ��������� �� ������������ ");
		b[1].TotalFocus();
	}

}
