/**
 * 
 */
package lab1.mura;

import java.awt.Color;
import java.awt.Graphics;
import java.util.ArrayList;
import java.util.Iterator;

import javax.swing.JLabel;

import lab1.ServiceClass;

/**
 * Вершина графа Мура
 * 
 * @author Dmytro Pogrebnjuk
 * 
 */
public class Mura extends JLabel {
	private static final long serialVersionUID = 1L;
	private int _name;
	private ArrayList<String> _operation;
	private ArrayList<ForGraphMura> _connection;
	private boolean isDraw = false;
	private String _code;

	/**
	 * @param name
	 *            ім"я вершини.
	 */
	public Mura(int name) {
		_name = name;
		_connection = new ArrayList<ForGraphMura>();
		_operation = new ArrayList<String>();
		setText(String.valueOf(name));
		_code = null;
	}

	public void addConnection(ForGraphMura e) {
		_connection.add(e);
	}

	/**
	 * @return the _connection
	 */
	public ArrayList<ForGraphMura> getAllConnection() {
		return _connection;
	}

	public ForGraphMura getConnection(int index) {
		return _connection.get(index);
	}

	/**
	 * @return the _name
	 */
	public int get_name() {
		return _name;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuffer res = new StringBuffer();
		// operation string
		StringBuffer op = new StringBuffer();
		Iterator<String> itOp = _operation.iterator();
		while (itOp.hasNext()) {
			op.append(itOp.next().toString());
		}
		Iterator<ForGraphMura> it = _connection.iterator();
		while (it.hasNext()) {
			res.append("z");
			res.append(_name);
			res.append("(" + op.toString() + ")");
			res.append("[" + _code + "]");			

			res.append(it.next().toString());
			res.append("\n");
		}
		return res.toString();

	}

	public void addOperation(String nameOp) {
		_operation.add(nameOp);
		StringBuffer res = new StringBuffer();
		for (int i = 0; i < _operation.size(); i++) {
			res.append("y" + _operation.get(i));
		}
		setText(String.valueOf(_name) + "\n (" + res.toString() + ")" + 
				"[" + _code +"]");
	}

	/**
	 * @return the isDraw
	 */
	public boolean isDraw() {
		return isDraw;
	}

	/**
	 * @param isDraw
	 *            the isDraw to set
	 */
	public void setDraw(boolean isDraw) {
		this.isDraw = isDraw;
	}

	/**
	 * @return the _operation
	 */
	public ArrayList<String> get_operation() {
		return _operation;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.swing.JComponent#paint(java.awt.Graphics)
	 */
	@Override
	public void paint(Graphics g) {
		MuraManager.get_instance().addMura(this);
		for (int i = 0; i < _connection.size(); i++) {
			ServiceClass.addArrow(getLocation(), _connection.get(i)
					.get_toBlock().getLocation(), _connection.get(i)
					.get_condition());
		}
		Color c = Color.GREEN;
		c.brighter();
		g.setColor(c);
		g.fillRect(0, 0, getWidth(), getHeight());
		super.paint(g);
	}
	/**
	 * @return отримати код елмента(з сусіднього кодування)
	 */
	public String get_code() {
		return _code;
	}
	
	/**
	 * @param code встановити код для елемента(в сусідньому кодуванні)
	 */
	public void set_code(String code) {
		_code = code;
	}
}
