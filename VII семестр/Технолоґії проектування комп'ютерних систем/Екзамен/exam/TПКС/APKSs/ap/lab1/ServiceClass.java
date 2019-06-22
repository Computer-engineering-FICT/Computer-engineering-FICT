package lab1;

import java.awt.Point;
import java.util.ArrayList;
import java.util.Iterator;

import lab1.Main.TypeOfBlock;
import lab1.mura.Mura;
import lab1.ui.TwoPoints;

public class ServiceClass {
	private static TypeOfBlock _curBlock;
	private static StringBuffer _nameOfSomeElement = new StringBuffer();
	private static ArrayList<Block> _arr = new ArrayList<Block>();
	private static Mura firstMura;
	private static ArrayList<TwoPoints> _arrows = new ArrayList<TwoPoints>();

	public static void addToName(String text) {
		_nameOfSomeElement.append(text);
	}

	public static String get_name() {
		return _nameOfSomeElement.toString();
	}

	public static void clearName() {
		_nameOfSomeElement.delete(0, _nameOfSomeElement.length());
	}
	
	/**
	 * @param firstMura the firstMura to set
	 */
	public static void setFirstMura(Mura firstMura) {
		System.out.println(firstMura);
		ServiceClass.firstMura = firstMura;
	}
	
	/**
	 * @return the firstMura
	 */
	public static Mura getFirstMura() {
		return firstMura;
	}

	/**
	 * @param curBlock
	 *            the _curBlock to set
	 */
	public static void set_curBlock(TypeOfBlock curBlock) {
		_curBlock = curBlock;
	}

	/**
	 * @return the _curBlock
	 */
	public static TypeOfBlock get_curBlock() {
		return _curBlock;
	}

	/**
	 * Додати блок до списку
	 * 
	 * @param typeOfBlock
	 *            тип блоку.
	 * @param name
	 *            ім"я блоку.
	 */
	public static void addBlock(TypeOfBlock typeOfBlock, String name) {
		_arr.add(new Block(typeOfBlock, name));
	}

	/**
	 * Додати блок до списку.
	 * 
	 * @param block
	 *            блок для додання.
	 */
	public static void addBlock(Block block) {
		_arr.add(block);
	}

	/**
	 * Пошук переходу по імені
	 * 
	 * @param name
	 *            ім"я для пошуку
	 * @param isFirstDown
	 *            чи пропускати першу зустрічА
	 * @return об"єкт класу, якщо такий є в списку і <b>null</b>, якщо такого
	 *         немає
	 */
	public static Block findGoto(String name, boolean isFirstDown) {
		Block res = null;
		Iterator<Block> it = _arr.iterator();
		while (it.hasNext()) {
			Block temp = it.next();
			if ((temp.get_type() == TypeOfBlock.up || temp.get_type() == TypeOfBlock.down)
					&& temp.get_name().equals(name))
				if (isFirstDown)
					isFirstDown = false;
				else
					return temp;
		}
		return res;
	}

	/**
	 * @return the _arr
	 */
	public static ArrayList<Block> getArr() {
		return _arr;
	}

	/**
	 * 
	 */
	public static void addArrow(Point begin, Point end, String text) {
		_arrows.add(new TwoPoints(begin, end, text));		
	}
	
	/**
	 * @return the _arrows
	 */
	public static ArrayList<TwoPoints> get_arrows() {
		return _arrows;
	}
	

}
