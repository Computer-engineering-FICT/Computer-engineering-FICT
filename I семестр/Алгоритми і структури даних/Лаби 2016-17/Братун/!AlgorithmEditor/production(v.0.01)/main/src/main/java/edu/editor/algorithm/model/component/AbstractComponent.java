package edu.editor.algorithm.model.component;

import java.awt.Graphics2D;
import java.io.Serializable;
import java.util.Properties;


public abstract class AbstractComponent implements Serializable {
	private static final long serialVersionUID = -2209690521414380586L;
	
	/**
	 * This object include all properties of some component.
	 */
	protected Properties blockProperties = new Properties();
	
	// State properties name
	private final String SELECTED = "SELECTED";
	
	// State properties
	public final boolean isSelected() {
        return (Boolean)blockProperties.get(SELECTED);
    }
	
	public final void setSelected(final boolean selected) {
		blockProperties.put(SELECTED, new Boolean(selected));
	}
	
	public abstract boolean contains(int x, int y);
	public abstract void draw(Graphics2D g2d);
	public abstract boolean isSelected(int x1, int y1, int x2, int y2);
}
