package edu.editor.algorithm.model.component.block;

import java.awt.*;

import edu.editor.algorithm.view.panel.AlgorithmPanel;

public class ClassBlock extends AbstractBlock {
	/**
	 *
	 */
	private static final long serialVersionUID = -2181119171192057762L;
	
	// Fields
	private final String FIELDS = "FIELDS";
	
	// Methods
	private final String METHODS = "METHODS";
	
	// Type Class
	protected String typeClassString = "<class>";
	
	public final String getFields() {
		return (String)blockProperties.get(FIELDS);
	}
	
	public final void setFields(final String value) {
		blockProperties.put(FIELDS, value);
	}
	
	public final String getMethods() {
		return (String)blockProperties.get(METHODS);
	}
	
	public final void setMethods(final String value) {
		blockProperties.put(METHODS, value);
	}

	public ClassBlock(int x, int y) {
        this(x, y, "<class_name>");
	}

	public ClassBlock(int x, int y, String value) {
		super(x, y, value);
		setHeight(getHeight()*3);
		setFields("");
		setMethods("");
	}

	@Override
	public void draw(Graphics2D g2d) {
		g2d.clearRect(getPoint1X(), getPoint1Y(), getWidth(), getHeight());
		g2d.drawRect(getPoint1X(), getPoint1Y(), getWidth(), getHeight());
		g2d.drawLine(getPoint1X(), getPoint1Y()+getHeight()/3, getPoint2X(), getPoint1Y()+getHeight()/3);
		g2d.drawLine(getPoint1X(), getPoint1Y()+getHeight()*2/3, getPoint2X(), getPoint1Y()+getHeight()*2/3);
		drawValue(g2d);
		/*if (getOutputConnection()==null || getInputConnection()==null ){
			 g2d.setColor(Color.RED);
			 g2d.drawRect(getPoint1X()-5, (getPoint1Y() + getCenterY())/2-5, getWidth()+10, getHeight()/2+10);
		}*/
	}
	
	public void drawValue(Graphics2D g2d) {
		if (getValue() != null) {
			int x = (int)g2d.getFont().getStringBounds(typeClassString, g2d.getFontRenderContext()).getWidth();
			int y = (int)g2d.getFont().getStringBounds(typeClassString, g2d.getFontRenderContext()).getHeight();
			g2d.setColor(Color.BLUE);
			g2d.setFont(g2d.getFont().deriveFont(Font.ITALIC));
			g2d.drawString(typeClassString, getCenterX() - x/2,
                    getPoint1Y() - getHeight()/12 + y/**4/5*//2);
			g2d.setFont(g2d.getFont().deriveFont(Font.PLAIN));
			g2d.setColor(Color.BLACK);
			x = (int)g2d.getFont().getStringBounds(getValue(), g2d.getFontRenderContext()).getWidth();
			y = (int)g2d.getFont().getStringBounds(getValue(), g2d.getFontRenderContext()).getHeight();
			g2d.drawString(getValue(), getCenterX() - x/2, 
					getPoint1Y() + getHeight()/6 + y/**4/5*//2);
			g2d.drawString(getFields(), getPoint1X() + (int) (AlgorithmPanel.heightCell / (double)12 * 5),/*+ y*/ 
					getPoint1Y() + getHeight()/2 + y/2);
			String[] methodStrings = getMethods().split("\\n");
			for (int i = 0; i < methodStrings.length; i++) {
				g2d.drawString(methodStrings[i], getPoint1X() + (int) (AlgorithmPanel.heightCell / (double)12 * 5) /*+ y*/, 
						getPoint1Y() + getHeight()*2/3 + (i+1)*y);
			}
			
		}
	}
}
