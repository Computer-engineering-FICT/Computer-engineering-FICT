package redactor.gui.graphicalElements;

import redactor.TestMain;

import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Rectangle2D;
import java.util.ArrayList;




/**
 * Defines operator primitive.
 *
 */
public class OperationalVertex extends Entity {

    private String initialValue;

    /**
     * Constructor of this primtive
     *
     * @param x      Coordinate X
     * @param y      Coordinate Y
     * @param number number
     */
    public OperationalVertex(final int x, final int y, final int number) {
        super(x, y, number, "OperationalVertex");
        initialValue = "";
        shape = null;
    }

    /**
     * Paints primitive on drawing area
     *
     * @param g2 drawing area
     * @see redactor.gui.graphicalElements.Entity#draw(java.awt.Graphics2D)
     */
    public void draw(final Graphics2D g2) {
        int scale = TestMain.drawScale;
        shape = new Rectangle2D.Double(x, y, 8 * scale, 4 * scale);
        inputShape = new Ellipse2D.Double(x + 3.5 * scale, y - 0.5 * scale, scale, scale);
        outputShape = new Ellipse2D.Double(x + 3.5 * scale, y + 3.5 * scale, scale, scale);
        inputCenter = new Point(x + 4 * scale, y);
        outputCenter = new Point(x + 4 * scale, y + 4 * scale);

        Color backupColor = g2.getColor();
        g2.setColor(fillColor);
        g2.fill(shape);


        g2.setColor(borderColor);
        g2.draw(shape);
        g2.draw(inputShape);
        g2.draw(outputShape);

        g2.drawString(String.valueOf(initialValue), x + 7 * scale / 4, y + 8 * scale / 3);
        g2.drawString("P" + number, x + 7 * scale, y + 5 * scale + 2);

        colorizeShape(g2, inputShape, inputHighlighed ? inConnectorHighlightColor : Color.WHITE);
        colorizeShape(g2, outputShape, outputHighlighted ? outConnectorHighlightColor : Color.WHITE);

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
        Color color = (highlight) ? outConnectorHighlightColor : Color.WHITE;
        colorizeShape(g2, outputShape, color);
        outputHighlighted = highlight;
    }

    @Override
    public void colorizeOutput2(Graphics2D g2, boolean highlight) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public String operationToString() {
        String result = "";
        result += name + " ";
        result += Integer.toString(number) + " ";
        result += Integer.toString(x) + " ";
        result += Integer.toString(y) + " ";
        result += "<" + initialValue + "> ";
        return result;
    }


    /**
     * @see Entity#convert()
     */
    public String convert() {
        String result = "";
        result += operationToString();
        if (outputLink != null)
            result += convertLinkToString(outputLink);
        else result += "null ";


        return result;
    }

    /**
     * @see redactor.gui.graphicalElements.Entity#getPointsList()
     */
    public ArrayList<Point> getPointsList() {
        ArrayList<Point> pointsList = new ArrayList<Point>();

        int scale = TestMain.drawScale;

        pointsList.add(new Point(x + 4 * scale, y));
        pointsList.add(new Point(x + 4 * scale, y + 4 * scale));


        return pointsList;
    }

    /**
     * Sets operation names (Y1,Y2...)
     *
     * @see redactor.gui.graphicalElements.Entity#setInitialValue(String)
     */
    public void setInitialValue(String initialValue) {
        this.initialValue = initialValue;
    }

    /**
     * @see Entity#getInitialValue()
     */
    public String getInitialValue() {
        return initialValue;
    }

	@Override
	public boolean hasErrors() {
		return initialValue == null || initialValue.isEmpty()
				|| inputLinks.isEmpty() || outputLink == null;  //To change body of implemented methods use File | Settings | File Templates.
	}

	@Override
	public String getErrors() {
		StringBuilder sb = new StringBuilder();
		if (initialValue == null || initialValue.isEmpty()) {
			sb.append("Value not set");
		}
		if (inputLinks.isEmpty()) {
			if (sb.length() > 0)
				sb.append("; ");
			sb.append("Vertex is unreachable");
		}
		if (outputLink == null) {
			if (sb.length() > 0)
				sb.append("; ");
			sb.append("Output not used");
		}
		return sb.toString();
	}
}
