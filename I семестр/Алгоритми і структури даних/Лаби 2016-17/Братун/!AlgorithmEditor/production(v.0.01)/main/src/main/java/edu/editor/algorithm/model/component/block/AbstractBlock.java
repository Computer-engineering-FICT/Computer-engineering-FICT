package edu.editor.algorithm.model.component.block;

import java.awt.Graphics2D;
import java.io.Serializable;
import java.util.ArrayList;

import edu.editor.algorithm.model.component.AbstractComponent;
import edu.editor.algorithm.parser.operand.Operand;
import edu.editor.algorithm.view.panel.AlgorithmPanel;


public abstract class AbstractBlock extends AbstractComponent implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 3313441407055363217L;

	// Properties name
	
	// Block properties name
	private final String CENTER_X = "CENTER_X";
	private final String CENTER_Y = "CENTER_Y";
	private final String WIDTH = "WIDTH";
	private final String HEIGHT = "HEIGHT";
	
	
	// Value
	private final String VALUE = "VALUE";
	
	//parsed value
	private final String PARSED_VALUE = "PARSED_VALUE";
		
	// Line properties name
	private final String INPUT_CONNECTION = "INPUT_CONNECTION";
	private final String OUTPUT_CONNECTION = "OUTPUT_CONNECTION";
	
	// Constructors
	public AbstractBlock(final int x, final int y) {
		setSelected(true);
		
		blockProperties.put(CENTER_X, new Integer((x / AlgorithmPanel.widthCell) * AlgorithmPanel.widthCell));
		blockProperties.put(CENTER_Y, new Integer((y / AlgorithmPanel.heightCell) * AlgorithmPanel.heightCell));
		blockProperties.put(WIDTH, new Integer(8*AlgorithmPanel.widthCell));
		blockProperties.put(HEIGHT, new Integer(4*AlgorithmPanel.heightCell));
	}
	
	public AbstractBlock(final int x, final int y, final String value) {
		this(x,y);
		blockProperties.put(VALUE, value);
	}
	
	// Block properties
	/**
	 * Method return x-center of current component.
	 * @return x-center of current component.
	 */	
	public final int getCenterX() {
		return (Integer)blockProperties.get(CENTER_X);
	}
	/**
	 * Method set x-center of current component.
	 * @param x - new x-center of current component.
	 */
	public final void setCenterX(final int x) {
		blockProperties.put(CENTER_X, new Integer(x));
	}
	/**
	 * Method return y-center of current component.
	 * @return y-center of current component.
	 */
	public final int getCenterY() {
		return (Integer)blockProperties.get(CENTER_Y);
	}
	/**
	 * Method set y-center of current component.
	 * @param y - new y-center of current component.
	 */
	public final void setCenterY(final int y) {
		blockProperties.put(CENTER_Y, new Integer(y));
	}
	/**
	 * Method return width of current component.
	 * @return width of current component.
	 */
	public final int getWidth() {
		return (Integer)blockProperties.get(WIDTH);
	}
	/**
	 * Method set width of current component.
	 * @param width - new width of current component.
	 */
	public final void setWidth(final int width) {
		blockProperties.put(WIDTH, new Integer(width));
	}
	/**
	 * Method return height of current component.
	 * @return height of current component.
	 */
	public final int getHeight() {
		return (Integer)blockProperties.get(HEIGHT);
	}
	/**
	 * Method set height of current component.
	 * @param height - new height of current component.
	 */
	public final void setHeight(final int height) {
		blockProperties.put(HEIGHT, new Integer(height));
	}
	/**
	 * Method set center point of current component.
	 * @param x - new x-center of current component.
	 * @param y - new y-center of current component.
	 */
	public final void setCenter(final int x, final int y) {
		setCenterX(x);
		setCenterY(y);
	}
	
	public final int getPoint1X() {
		return (getCenterX() - getWidth()/2) / AlgorithmPanel.widthCell * AlgorithmPanel.widthCell;
	}
	
	public final void setPoint1X(final int x) {
		int width = getPoint2X() - x;
		if (width >= AlgorithmPanel.heightCell * 3) {
			setCenterX((getPoint2X() + x)/2);
			setWidth(width);
		}
	}
	
	public final int getPoint1Y() {
		return (getCenterY() - getHeight()/2) / AlgorithmPanel.heightCell * AlgorithmPanel.heightCell;
	}
	
	public final void setPoint1Y(final int y) {
		int height = getPoint2Y() - y;
		if (height >= AlgorithmPanel.heightCell * 3) {
			setCenterY(Math.round((getPoint2Y() + y)/2.0f));
			setHeight(height);
		}
	}
	
	public final int getPoint2X() {
//		return (getCenterX() + getWidth()/2) / AlgorithmPanel.widthCell * AlgorithmPanel.widthCell;
		if (getCenterX() + getWidth()/2 != (getCenterX() + getWidth()/2) / AlgorithmPanel.widthCell * AlgorithmPanel.widthCell) {
			return ((getCenterX() + getWidth()/2) / AlgorithmPanel.widthCell + 1) * AlgorithmPanel.widthCell;
		}
		return getCenterX() + getWidth()/2;
	}
	
	public final void setPoint2X(final int x) {
		int width = x - getPoint1X();
		if (width >= AlgorithmPanel.heightCell * 3) {
			setCenterX((getPoint1X() + x)/2);
			setWidth(width);
		}
	}
	
	public final int getPoint2Y() {
		if (getCenterY() + getHeight()/2 != (getCenterY() + getHeight()/2) / AlgorithmPanel.heightCell * AlgorithmPanel.heightCell) {
			return (getCenterY() + getHeight()/2 + 1) / AlgorithmPanel.heightCell * AlgorithmPanel.heightCell;
		}
		return getCenterY() + getHeight()/2;
	}
	
	public final void setPoint2Y(final int y) {
		int height = y - getPoint1Y();
		if (height >= AlgorithmPanel.heightCell * 3) {
			setCenterY((getPoint1Y() + y)/2);
			setHeight(height);
		}
	}
	
	public final String getValue() {
		return (String)blockProperties.get(VALUE);
	}
	
	public final void setValue(final String value) {
		blockProperties.put(VALUE, value);
	}
	
	public final Operand getParsedValue(){
		return (Operand) blockProperties.get(PARSED_VALUE);
	}
	
	public final void setParsedValue(final Operand op){
		blockProperties.put(PARSED_VALUE, op);
	}
	
	public final Connection getInputConnection() {
		return (Connection)blockProperties.get(INPUT_CONNECTION);
	}
	
	public final void setInputConnection(Connection inputConnection) {
		if (inputConnection != null) {
			blockProperties.put(INPUT_CONNECTION, inputConnection);
		} else {
			blockProperties.remove(INPUT_CONNECTION);
		}
	}
	
	public final Connection getOutputConnection() {
		return (Connection)blockProperties.get(OUTPUT_CONNECTION);
	}
	
	public final void setInputConnections(ArrayList<Connection> inputConnections) {
		if (inputConnections != null) {
			blockProperties.put(INPUT_CONNECTION, inputConnections);
		} else {
			blockProperties.remove(INPUT_CONNECTION);
		}
	}
	
	@SuppressWarnings("unchecked")
	public ArrayList<Connection> getOutputConnections() {
		return (ArrayList<Connection>)blockProperties.get(OUTPUT_CONNECTION);
	}
		
	public final void setOutputConnection(Connection outputConnection) {
		if (outputConnection != null) {
			blockProperties.put(OUTPUT_CONNECTION, outputConnection);
		} else {
			blockProperties.remove(OUTPUT_CONNECTION);
		}
	}
	
	// Util methods 
	public final void moveTo(int x, int y) {
		setCenter(x, y);
	}
	
	public final void moveByOffSet(int x, int y) {
		setCenter(getCenterX() + x, getCenterY() + y);
	}
	
	public final int getResizePoint(int x, int y) {
		if (Math.abs(x-getPoint1X()) <= AlgorithmPanel.widthCell / 3 && Math.abs(y-getPoint1Y()) <= AlgorithmPanel.heightCell / 3) {
			return 1;
		} else {
			if (Math.abs(x-getCenterX()) <= AlgorithmPanel.widthCell / 3 && Math.abs(y-getPoint1Y()) <= AlgorithmPanel.heightCell / 3) {
				return 2;
			} else {
				if (Math.abs(x-getPoint2X()) <= AlgorithmPanel.widthCell / 3 && Math.abs(y-getPoint1Y()) <= AlgorithmPanel.heightCell / 3) {
					return 3;
				} else {
					if (Math.abs(x-getPoint1X()) <= AlgorithmPanel.widthCell / 3 && Math.abs(y-getCenterY()) <= AlgorithmPanel.heightCell / 3) {
						return 4;
					} else {
						if (Math.abs(x-getPoint2X()) <= AlgorithmPanel.widthCell / 3 && Math.abs(y-getCenterY()) <= AlgorithmPanel.heightCell / 3) {
							return 5;
						} else {
							if (Math.abs(x-getPoint1X()) <= AlgorithmPanel.widthCell / 3 && Math.abs(y-getPoint2Y()) <= AlgorithmPanel.heightCell / 3) {
								return 6;
							} else {
								if (Math.abs(x-getCenterX()) <= AlgorithmPanel.widthCell / 3 && Math.abs(y-getPoint2Y()) <= AlgorithmPanel.heightCell / 3) {
									return 7;
								} else {
									if (Math.abs(x-getPoint2X()) <= AlgorithmPanel.widthCell / 3 && Math.abs(y-getPoint2Y()) <= AlgorithmPanel.heightCell / 3) {
										return 8;
									}
								}
							}
						}
					}
				}
			}
		}
		return 0;
	}
	
	public void drawValue(Graphics2D g2d) {
		if (getValue() != null) {
			int x = (int)g2d.getFont().getStringBounds(getValue(), g2d.getFontRenderContext()).getWidth();
			int y = (int)g2d.getFont().getStringBounds(getValue(), g2d.getFontRenderContext()).getHeight();
			/*if (this instanceof ClassBlock) {
				g2d.drawString(getValue(), getCenterX() - x/2, 
						getPoint1Y() + getHeight()/6 + y*//**4/5*//*/2);
			} else {
				g2d.drawString(getValue(), getCenterX() - x/2, getCenterY() + y/2);
			}*/
			g2d.drawString(getValue(), getCenterX() - x/2, getCenterY() + y/2);
		}
	}
	
	@Override
	public boolean contains(int x, int y) {
		if (x >= getPoint1X() - AlgorithmPanel.widthCell / 2 && 
				x <= getPoint2X() + AlgorithmPanel.widthCell / 2 && 
				y >= getPoint1Y() - AlgorithmPanel.heightCell / 2 &&
				y <= getPoint2Y() + AlgorithmPanel.heightCell / 2) {
			return true;
		}
		return false;
	}
	
	@Override
	public boolean isSelected(int x1, int y1, int x2, int y2) {
		if ((x1 <= getPoint1X() && x2 >= getPoint2X()) || (x2 <= getPoint1X() && x1 >= getPoint2X())) {
			if ((y1 <= getPoint1Y() && y2 >= getPoint2Y()) || (y2 <= getPoint1Y() && y1 >= getPoint2Y())){
				return true;
			}
		}
		return false;
	}
	
	public abstract void draw(Graphics2D g2d);
	
	public boolean contains(int x, int y, int tolerance){
		if (x >= getPoint1X() - tolerance && 
				x <= getPoint2X() + tolerance && 
				y >= getPoint1Y() - tolerance &&
				y <= getPoint2Y() + tolerance) {
			return true;
		}
		return false;
	}

	public void addInputConnection(Connection line) {
		@SuppressWarnings("unchecked")
		ArrayList<Connection> connections = (ArrayList<Connection>)blockProperties.get(INPUT_CONNECTION);
		if (connections == null) {
			connections = new ArrayList<Connection>();
		}
		connections.add(line);
	}
	
}
