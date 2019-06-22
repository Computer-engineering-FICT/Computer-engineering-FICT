package ua.kpi.io33.zakolenko.lab7;

/**
 * This class describe data about object Cell.
 * 
 * @author Roman Zakolenko.
 * @version 1,6 20 May 2014.
 */
public class Cell {
	/**
	 * The field "data" contains data about object of class Munitions.
	 */
	private Munitions data;
	/**
	 * The field "previous" contains link on the previous cell.
	 */
	private Cell previous;
	/**
	 * The field "next" contains link on the next cell.
	 */
	private Cell next;

	/**
	 * Empty constructor.
	 */
	public Cell() {
	}

	/**
	 * @param obj
	 *            contains data about object of class Munitions.
	 */
	public Cell(Munitions obj) {
		setData(obj);
	}

	/**
	 * @param prev
	 *            assigned with the field "previous".
	 * @param next
	 *            assigned with the field "next".
	 * @param obj
	 *            assigned with the field "data".
	 */
	public Cell(Cell prev, Cell next, Munitions obj) {
		setData(obj);
		setNext(next);
		setPrevious(prev);
	}

	/**
	 * @return link on the object of class Munitions.
	 */
	public Munitions getData() {
		return data;
	}

	/**
	 * @param data
	 *            assigned with the field "data".
	 */
	public void setData(Munitions data) {
		this.data = data;
	}

	/**
	 * @return link on the previous cell.
	 */
	public Cell getPrevious() {
		return previous;
	}

	/**
	 * Sets the value of field "previous" null.
	 */
	public void setPrevious() {
		this.previous = null;
	}

	/**
	 * @param c
	 *            assigned with field "previous".
	 */
	public void setPrevious(Cell c) {
		this.previous = c;
	}

	/**
	 * @param data
	 *            contains data about object of class Munitions.
	 */
	public void setPrevious(Munitions data) {
		this.previous = new Cell(data);
		this.previous.next = this;

	}

	/**
	 * @return link on the next cell.
	 */
	public Cell getNext() {
		return next;
	}

	/**
	 * Sets the value of field "next" null.
	 */
	public void setNext() {
		this.next = null;
	}

	/**
	 * @param c
	 *            assigned with the field "next".
	 */
	public void setNext(Cell c) {
		this.next = c;
	}

	/**
	 * @param data
	 *            contains data about object of class Munitions.
	 */
	public void setNext(Munitions data) {
		this.next = new Cell(data);
		this.next.previous = this;
	}

}
