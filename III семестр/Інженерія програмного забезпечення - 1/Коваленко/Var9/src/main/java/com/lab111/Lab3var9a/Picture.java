package com.lab111.Lab3var9a;

/**
 * �������� ������ - ����� ��������� ������ ������ � ������������
 * @author A
 * @version 3.9.1
 */
public class Picture implements IF{
	/**
	 * w - ������ ����������� */
	private int w;
	/**
	 * h - ������ ����������� */
	private int h;
	/**
	 * canvas - ������� ������ */
	private int canvas[][];
	/**
	 * ������ �����������
	 */
	public Picture() {
		this.h = 1;
		this.w = 1;		
		canvas = new int[h][w];
	}
	/**
	 * ����������� c �����������
	 * w, w2 ������
	 * h, h2 ������
	 */
	public Picture(int h2, int w2) {
		this.h = h2;
		this.w = w2;		
		canvas = new int[h][w];
	}
	/**
	 * getColor - ���������� �������� ����� � ����� � ������������ �,�
	 * x �������� h
	 * y �������� w
	 * canvas ���������� ���� � ����� �,�
	 * @see com.lab111.Lab3var9a.IF#getColor(int, int)
	 */
	@Override
	public int getColor(int �, int �) {
		if (� <= 0 || �	<=	0) return -1;
		if	(� > h || � > w) return -1;
		return canvas[�][�];
	}
/**
 * ������ ���� �� color � ����� �,�
 * x �������� h
 * y �������� w
 * color ����� ���� � ����� �,�
 * ���������� ��������� ��������: TRUE, ���� ������� �������� ����, FALSE � ��������� ������
 * @see com.lab111.Lab3var9a.IF#setColor(int, int, int)
 */
	public boolean setColor(int x, int y, int color) {
		if (x <= 0 || y <= 0) return false;
		if (x > h || y > w) return false;
		canvas[x][y] = color; 
		return true;
	}
}
