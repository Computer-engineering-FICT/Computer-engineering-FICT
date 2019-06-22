package lab1;

import java.util.ArrayList;

import lab1.Main.TypeOfBlock;
import lab1.mura.ForGraphMura;

/**
 * ����, ���� ��������������� ��� ��������� ���������.
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class Block {
	/**
	 * ���������� ���� � ���� ����
	 */
	private ArrayList<ForGraphMura> _childMura;
	/**
	 * ������ �������� �� ������� ����� ��������
	 */
	protected int _balance;

	/**
	 * ��� �����.
	 */
	protected TypeOfBlock _type;
	/**
	 * ��"� �����.
	 */
	protected String _name;

	public Block(TypeOfBlock type, String name) {
		_type = type;
		_name = name;
		_balance = 0;
	}

	/**
	 * @return the _name
	 */
	public String get_name() {
		return _name;
	}

	/**
	 * @return the _type
	 */
	public TypeOfBlock get_type() {
		return _type;
	}

	/**
	 * @return ������ ������ ��������
	 */
	public int getBalance() {
		return _balance;
	}

	/**
	 * �������������� ������ ��������
	 */
	public void incBalance() {
		_balance++;
	}

	/**
	 * �������������� ������ ��������
	 */
	public void decBalance() {
		_balance--;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return _type.toString() + " " + _name;
	}

	public void addToMura(ForGraphMura e) {
		_childMura.add(e);
	}

	/**
	 * @return the _childMura
	 */
	public ArrayList<ForGraphMura> get_childMura() {
		return _childMura;
	}
}
