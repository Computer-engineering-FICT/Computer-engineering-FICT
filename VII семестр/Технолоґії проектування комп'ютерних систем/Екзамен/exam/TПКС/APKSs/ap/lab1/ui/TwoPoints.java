/**
 * 
 */
package lab1.ui;

import java.awt.Point;

/**
 * Початок - кінець напрямку
 * @author Dmytro Pogrebnjuk
 *
 */
public class TwoPoints {
	private Point _begin;
	private Point _end;
	private String _text;
	/**
	 * 
	 */
	public TwoPoints(Point begin, Point end, String text) {
		_begin = begin;
		_end = end;
		_text = text;
	}
	/**
	 * @return the _begin
	 */
	public Point get_begin() {
		return _begin;
	}
	/**
	 * @param begin the _begin to set
	 */
	public void set_begin(Point begin) {
		_begin = begin;
	}
	/**
	 * @return the _end
	 */
	public Point get_end() {
		return _end;
	}
	/**
	 * @param end the _end to set
	 */
	public void set_end(Point end) {
		_end = end;
	}
	/**
	 * @return the _text
	 */
	public String get_text() {
		return _text;
	}
	/**
	 * @param text the _text to set
	 */
	public void set_text(String text) {
		_text = text;
	}
	
	
}
