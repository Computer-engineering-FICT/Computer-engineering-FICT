package lab1;

import java.util.ArrayList;

import lab1.Main.TypeOfBlock;
import lab1.mura.ForGraphMura;

/**
 * Блок, який використовується при будівництві алгоритму.
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class Block {
	/**
	 * Породжуючі стані в схемі Мура
	 */
	private ArrayList<ForGraphMura> _childMura;
	/**
	 * баланс переходів та приходів цього переходу
	 */
	protected int _balance;

	/**
	 * тип блоку.
	 */
	protected TypeOfBlock _type;
	/**
	 * ім"я блоку.
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
	 * @return баланс даного переходу
	 */
	public int getBalance() {
		return _balance;
	}

	/**
	 * інкрементувати баланс переходу
	 */
	public void incBalance() {
		_balance++;
	}

	/**
	 * декрементувати баланс переходу
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
