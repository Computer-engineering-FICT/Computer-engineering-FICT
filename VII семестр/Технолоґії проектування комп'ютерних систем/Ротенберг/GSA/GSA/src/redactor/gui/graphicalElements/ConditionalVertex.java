package redactor.gui.graphicalElements;

import redactor.TestMain;

import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.util.ArrayList;

/**
 * Extends Entity.
 * Has one input and two outputs with changeable values.
 */
public class ConditionalVertex extends Entity {
    private String initialValue;
    private int leftOutputValue;
    private int rightOutputValue;

    /**
     * Constructor of this primtive. Sets default values to outputs.
     *
     * @param x      Coordinate X
     * @param y      Coordinate Y
     * @param number number
     */
    public ConditionalVertex(final int x, final int y, final int number) {
        super(x, y, number, "Condition");
        initialValue = "";
        shape = null;
        leftOutputValue = 0;
        rightOutputValue = 1;
    }

    public int getLeftOutputValue() {
        return leftOutputValue;
    }

    public void setLeftOutputValue(int leftOutputValue) {
        this.leftOutputValue = leftOutputValue;
    }

    public int getRightOutputValue() {
        return rightOutputValue;
    }

    public void setRightOutputValue(int rightOutputValue) {
        this.rightOutputValue = rightOutputValue;
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
        Color color = (highlight) ? outConnectorHighlightColor : Color.WHITE;
        colorizeShape(g2, outputShape2, color);
        output2Highlighted = highlight;
    }


    /**
     * Paints primitive on drawing area
     *
     * @param g2 drawing area
     * @see redactor.gui.graphicalElements.Entity#draw(java.awt.Graphics2D)
     */
    public void draw(final Graphics2D g2) {

        int scale = TestMain.drawScale;
        int[] xCoord = {x, x + 6 * scale, x + 12 * scale, x + 6 * scale};
        int[] yCoord = {y + 3 * scale, y, y + 3 * scale, y + 6 * scale};

        shape = new Polygon(xCoord, yCoord, 4);

        inputShape = new Ellipse2D.Double(x + 5.5 * scale, y - 0.5 * scale, scale, scale);
        outputShape = new Ellipse2D.Double(x - 0.5 * scale, y + 2.5 * scale, scale, scale);
        outputShape2 = new Ellipse2D.Double(x + 11.5 * scale, y + 2.5 * scale, scale, scale);

        inputCenter = new Point(x + 6 * scale, y);
        outputCenter = new Point(x, y + 3 * scale);
        output2Center = new Point(x + 12 * scale, y + 3 * scale);

        Color backupColor = g2.getColor();
        g2.setColor(fillColor);
        g2.fill(shape);


        g2.setColor(borderColor);
        g2.draw(shape);
        g2.draw(inputShape);
        g2.draw(outputShape);
        g2.draw(outputShape2);

        colorizeShape(g2, inputShape, inputHighlighed ? inConnectorHighlightColor : Color.WHITE);
        colorizeShape(g2, outputShape, outputHighlighted ? outConnectorHighlightColor : Color.WHITE);
        colorizeShape(g2, outputShape2, output2Highlighted ? outConnectorHighlightColor : Color.WHITE);

        g2.drawString(String.valueOf(initialValue), x + 15 * scale / 4, y + 10 * scale / 3);
        g2.drawString("C" + number, x + 9 * scale, y + 6 * scale + 2);
        g2.drawString("" + leftOutputValue, x, y + 2 * scale);
        g2.drawString("" + rightOutputValue, x + 12 * scale, y + 2 * scale);

	    if (isInCycle()) {
		    g2.setColor(cycleMarkColor);
		    // TODO draw ellipse cycle marker
	    }

        g2.setColor(backupColor);
    }

    public String conditionToString() {
        String result = "";
        result += name + " ";
        result += Integer.toString(number) + " ";
        result += Integer.toString(x) + " ";
        result += Integer.toString(y) + " ";
        result += "<" + initialValue + "> ";
        result += leftOutputValue + " ";
        result += rightOutputValue + " ";
        return result;
    }

    /**
     * @see Entity#convert()
     */
    public String convert() {
        String result = "";
        result += conditionToString();
        if (outputLink != null)
            result += convertLinkToString(outputLink);
        else result += "null ";

        if (output2Link != null)
            result += convertLinkToString(output2Link);
        else result += "null ";

        return result;
    }

	@Override
	public boolean hasErrors() {
		return initialValue == null || initialValue.isEmpty()
				|| inputLinks.isEmpty() || outputLink == null || output2Link == null;
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
			sb.append("Output " + leftOutputValue + " not used");
		}
		if (output2Link == null) {
			if (sb.length() > 0)
				sb.append("; ");
			sb.append("Output " + rightOutputValue + " not used");
		}
		return sb.toString();
	}

	/**
     * @see redactor.gui.graphicalElements.Entity#getPointsList()
     */
    public ArrayList<Point> getPointsList() {
        ArrayList<Point> pointsList = new ArrayList<Point>();

        int scale = TestMain.drawScale;

        pointsList.add(new Point(x, y + 2 * scale));
        pointsList.add(new Point(x + 4 * scale, y));
        pointsList.add(new Point(x + 8 * scale, y + 2 * scale));
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


}
