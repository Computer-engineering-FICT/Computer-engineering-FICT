package com.lab111.Lab3var9a;

/**
 * PictureProxy - ����� Proxy ��� ��������� ����������� � ���������
 * @author A
 * @version 3.9.1
 */
public class PictureProxy implements IF {
	/**
	* pic - �������, ������ ������ Picture  */
	private Picture pic;
	/**
	*	����������� �������� x, � �������� ���� ������ */
	private static final int X1 = 1;
	/**
	 * ����������� �������� x, � �������� ���� ������ */
	private static final int X2 = 100; 
	/**
	 * ����������� �������� �, � �������� ���� ������ */
	private static final int Y1 = 1;
	/**
	 * ����������� �������� �, � �������� ���� ������ */
	private static final int Y2 = 100;
	/**
	 * ������ ����������� */
	public PictureProxy(){
		pic = new Picture();
	}
	/**
	 * �����������, �������� ���������� ������ � ������
	 * {@link Picture}; ��������� ������ ������
	 * @param h - ������ �����������
	 * @param w - ������ �����������
	*/
	public PictureProxy(int h, int w){
		pic = new Picture(h, w);
	}
	/**
	 * 
	 * @param � ���������� x
	 * @param � ���������� y
	 * @return true, ���� ���� ������, � false � ��������� ������
	 */
    private boolean haveAccess(int �, int �) {
    	return !(� < X1 || � > X2 || � < Y1 || � > Y2);
    }	
    /**
     * ������ ���� � ����� x,y �� color, ���� � ���� ����� ���� ������
     * @return ��������� ��������: TRUE, ���� ���� ���������, � FALSE � ��������� ������
     * @see com.lab111.Lab3var9a.IF#setColor(int, int, int)
     */
    public boolean setColor(int �, int �, int color) {
		if (haveAccess(�,�)) 
			return pic.setColor(�,�,color);
		else
			return false;
	}

    /**
    * getColor - ������� �� ����� ���� �����
    * @return ���������� ����, ���� � ����� ���� ������, ����� -1
    * @see com.lab111.Lab3var9a.IF#getColor(int, int)
    */
	public int getColor(int �, int �) {
		if (haveAccess(�,�))
			System.out.println("���� ����� � ������������ ("+�+", "+�+") � "+pic.getColor(�,�)); 
		else
			System.out.println("���� ������� �� ����� � ������������ ("+�+", "+�+")");
		return (haveAccess(�,�) ? pic.getColor(�,�) : -1);
		
	}
}
