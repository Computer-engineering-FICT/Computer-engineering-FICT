package redactor.gui.graphicalElements;

import redactor.TestMain;

import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.awt.geom.RoundRectangle2D;
import java.util.ArrayList;

/**
 * Extends Entity.
 * Has one input and hasn't outputs.
 * Its initial value is permanent.
 */
public class FinishVertex extends Entity{
    private String initialValue;

    /**
     * Constructor of this primtive
     * @param x Coordinate X
     * @param y Coordinate Y
     */
    public FinishVertex(final int x, final int y) {
        super(x, y, 0, "End");
        initialValue = "End";
        shape = null;
    }



    /**
     * Paints primitive on drawing area
     * @param g2 drawing area
     * @see Entity#draw(java.awt.Graphics2D)
     */
    public void draw(final Graphics2D g2) {
        int scale = TestMain.drawScale;

        shape = new RoundRectangle2D.Double(x, y, 8 * scale, 4 * scale, scale, scale);
        inputShape = new Ellipse2D.Double(x+3.5*scale, y-0.5*scale,scale,scale );
        inputCenter = new Point(x+4*scale,y);

        Color backupColor = g2.getColor();
        g2.setColor(fillColor);
        g2.fill(shape);


        g2.setColor(borderColor);
        g2.draw(shape);
        g2.draw(inputShape);

        g2.drawString(String.valueOf(initialValue), x + 7 * scale / 4, y + 8 * scale / 3);

        colorizeShape(g2, inputShape, inputHighlighed ? inConnectorHighlightColor : Color.WHITE);

        g2.setColor(backupColor);
    }

    @Override
    public void colorizeInput(Graphics2D g2, boolean highlight) {
        Color color = (highlight) ? inConnectorHighlightColor : Color.WHITE;
        colorizeShape(g2, inputShape, color);
        inputHighlighed = highlight;
    }

    @Override
    public void colorizeOutput(Graphics2D g2, boolean highlight) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void colorizeOutput2(Graphics2D g2, boolean highlight) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    /**
     * @see redactor.gui.graphicalElements.Entity#convert()
     */
    public String convert() {
        String result = "";
        result += "End ";
        result += "0 ";
        result += Integer.toString(x) + " ";
        result += Integer.toString(y) + " ";
        result += "finish";
        return result;
    }
    /**
     * @see Entity#getPointsList()
     */
    public ArrayList<Point> getPointsList() {
        ArrayList<Point> pointsList = new ArrayList<Point>();

        int scale = TestMain.drawScale;

        pointsList.add(new Point(x,y+4*scale));


        return pointsList;
    }

	@Override
	public boolean hasErrors() {
		return inputLinks.isEmpty();
	}

	@Override
	public String getErrors() {
		return inputLinks.isEmpty() ? getName() + " is unreachable" : "";
	}
}
