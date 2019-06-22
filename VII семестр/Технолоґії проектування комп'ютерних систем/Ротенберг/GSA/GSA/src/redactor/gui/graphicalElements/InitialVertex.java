package redactor.gui.graphicalElements;

import redactor.TestMain;

import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.awt.geom.RoundRectangle2D;
import java.util.ArrayList;

/**
 * Extends Entity.
 * Has one output and hasn't inputs.
 * Its initial value is permanent.
 */
public class InitialVertex extends Entity {
    private String initialValue;

    /**
     * Constructor of this primtive
     *
     * @param x Coordinate X
     * @param y Coordinate Y
     */
    public InitialVertex(final int x, final int y) {
        super(x, y, 0, "Begin");
        initialValue = "Begin";
        shape = null;
        outputShape = null;
    }

    @Override
    public void colorizeInput(Graphics2D g2, boolean highlight) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void colorizeOutput(Graphics2D g2, boolean highlight) {
        Color color = (highlight) ? outConnectorHighlightColor : Color.WHITE;
        colorizeShape(g2, outputShape, color);
        outputHighlighted = highlight;
    }

    @Override
    public void colorizeOutput2(Graphics2D g2, boolean highlight) {
        //To change body of implemented methods use File | Settings | File Templates.
    }


    /**
     * Paints primitive on drawing area
     *
     * @param g2 drawing area
     * @see redactor.gui.graphicalElements.Entity#draw(java.awt.Graphics2D)
     */
    public void draw(final Graphics2D g2) {

        int scale = TestMain.drawScale;
        shape = new RoundRectangle2D.Double(x, y, 8 * scale, 4 * scale, scale, scale);
        outputShape = new Ellipse2D.Double(x + 3.5 * scale, y + 3.5 * scale, scale, scale);
        outputCenter = new Point(x + 4 * scale, y + 4 * scale);

        Color color = g2.getColor();
        g2.setColor(fillColor);
        g2.fill(shape);

        g2.setColor(borderColor);
        g2.draw(shape);
        g2.draw(outputShape);

        g2.drawString(String.valueOf(initialValue), x + 7 * TestMain.drawScale / 4, y + 8 * TestMain.drawScale / 3);

        colorizeOutput(g2, outputHighlighted);

        g2.setColor(color);
    }

    /**
     * @see Entity#convert()
     */
    public String convert() {
        String result = "";
        result += "Begin ";
        result += "0 ";
        result += Integer.toString(x) + " ";
        result += Integer.toString(y) + " ";
        result += "init ";
        if (outputLink != null)
            result += convertLinkToString(outputLink);
        else result += "null  ";
        return result;
    }

    /**
     * @see redactor.gui.graphicalElements.Entity#getPointsList()
     */
    public ArrayList<Point> getPointsList() {
        ArrayList<Point> pointsList = new ArrayList<Point>();

        int scale = TestMain.drawScale;

        pointsList.add(new Point(x + 4 * scale, y + 4 * scale));


        return pointsList;
    }

	@Override
	public boolean hasErrors() {
		return outputLink == null;
	}

	@Override
	public String getErrors() {
		return (outputLink) == null ? getName() + " not connected": "";
	}
}
