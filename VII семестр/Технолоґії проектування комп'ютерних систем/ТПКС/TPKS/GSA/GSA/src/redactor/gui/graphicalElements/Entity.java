package redactor.gui.graphicalElements;


import java.awt.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Class Entity is an abstract class that implements the primitive.
 * Defines  functions
 * that should be realized in each concrete primitive.
 */

public abstract class Entity {

    protected static final Color inConnectorHighlightColor = new Color(0x87, 0xCE, 0xFA);
    protected static final Color outConnectorHighlightColor = new Color(0x3C, 0xB3, 0x71);

//    protected static final Color selectedBorderColor = new Color(0x44, 0x44, 0xCC);
    protected static final Color selectedFillColor = new Color(0xFF, 0xFF, 0xDD);

    protected static final Color selectedBorderColor = new Color(241,0,0);

	protected static final Color cycleMarkColor = new Color(224,224,0);


    /**
     * х, у - coordinates
     * number - number in order
     * name - primitive name
     * shape - graphic object describes the primitive is drawn on the panel for painting
     */

    protected int x, y, number;
    protected String name;
    //    protected ArrayList<Shape> shape;
    protected Shape shape;
    protected Shape inputShape;
    protected Shape outputShape;
    protected Shape outputShape2;

    protected List<List<Entity>> inputLinks;
    protected List<Entity> outputLink;
    protected List<Entity> output2Link;

    protected boolean inputHighlighed;
    protected boolean outputHighlighted;
    protected boolean output2Highlighted;

    protected Point inputCenter;
    protected Point outputCenter;
    protected Point output2Center;

    protected boolean selected;
    protected Color borderColor;
    protected Color fillColor;

	private boolean inCycle;

    /**
     * @param x      top-left X-coordinate
     * @param y      top-left Y-coordinate
     * @param number number of element
     * @param name   some name
     */

    protected Entity(int x, int y, int number, String name) {
        this.x = x;
        this.y = y;
        this.number = number;
        this.name = name;
        inputLinks = new LinkedList<List<Entity>>();
        fillColor = Color.WHITE;
        borderColor = Color.BLACK;
    }

    public List<List<Entity>> getInputLinks() {
        return inputLinks;
    }

    protected Entity() {
        inputLinks = new LinkedList<List<Entity>>();
    }

    /**
     * Returns central point of output1
     *
     * @return outputCenter
     */

    public Point getOutputCenter() {
        return outputCenter;
    }

    /**
     * Returns central point of output2
     *
     * @return outputCenter2
     */

    public Point getOutput2Center() {
        return output2Center;
    }


    /**
     * Set X coordinate: primitive position on screen
     *
     * @param x X coordinate
     */
    public void setX(final int x) {
        this.x = x;
    }

    /**
     * Get X coordinate of primitive position
     *
     * @return X coordinate
     */
    public int getX() {
        return x;
    }

    /**
     * Set Y coordinate: primitive position on screen
     *
     * @param y Y coordinate
     */
    public void setY(final int y) {
        this.y = y;
    }

    /**
     * Get Y coordinate of primitive position
     *
     * @return Y coordinate
     */
    public int getY() {
        return y;
    }

	/**
	 * Tests at least one entity is connected to this one
	 * @return true if input connections exists
	 */
	public boolean isInputUsed() {
		return !inputLinks.isEmpty();
	}

    /**
     * Tests is output1 in use.
     *
     * @return is output1 in use
     */

    public boolean isOutputUsed() {
        return outputLink != null;
    }

    /**
     * Tests is output2 in use.
     *
     * @return is output2 in use
     */

    public boolean isOutput2used() {
        return output2Link != null;
    }

    /**
     * Sets the serial number of the primitive.
     *
     * @param number number of primitive
     */
    public void setNumber(final int number) {
        this.number = number;
    }

    /**
     * Gets the serial number of the primitive.
     *
     * @return number of primitive
     */
    public int getNumber() {
        return number;
    }

    /**
     * Gets primitive name
     *
     * @return name
     */
    public String getName() {
        return name;
    }


    /**
     * Test: is current point owned by primitive?
     *
     * @param x X coordinate
     * @param y Y coordinate
     * @return own to primitive
     */
    public boolean boundCheck(final int x, final int y) {
        return shape != null && shape.contains(x, y);
    }

    /**
     * Test: is current point owned by primitives input?
     *
     * @param x X coordinate
     * @param y Y coordinate
     * @return own to inputShape
     */

    public boolean inputBoundCheck(final int x, final int y) {
        return inputShape != null && inputShape.contains(x, y);
    }

    /**
     * Test: is current point owned by primitives output?
     *
     * @param x X coordinate
     * @param y Y coordinate
     * @return own to outputShape
     */

    public boolean outputBoundCheck(final int x, final int y) {
        return outputShape != null && outputShape.contains(x, y);
    }

    /**
     * Test: is current point owned by primitives output2?
     *
     * @param x X coordinate
     * @param y Y coordinate
     * @return own to outputShape
     */

    public boolean output2BoundCheck(final int x, final int y) {
        return outputShape2 != null && outputShape2.contains(x, y);
    }


    /**
     * The method is designed for producing an array of points, which can be
     * connected with lines. Used for communication lines building.
     * Must be implemented in each primitive (not line)
     *
     * @return array of points
     */
    public ArrayList<Point> getPointsList() {
        return null;
    }

    /**
     * Sets initial value of state. Empty for other primitives
     * May be implemented in operations
     *
     * @param initialValue initial value
     */
    public void setInitialValue(String initialValue) {
    }

    /**
     * Gets initial value. If initial value isn't defined returns -1.
     *
     * @return initial value
     */
    public String getInitialValue() {
        return null;
    }

    /**
     * The method of painting on panel for drawing.
     *
     * @param g2 object on which  draw a primitive
     */
    public abstract void draw(final Graphics2D g2);

    /**
     * If highlight == true colorize input
     *
     * @param g2
     * @param highlight
     */
    public abstract void colorizeInput(final Graphics2D g2, boolean highlight);

    /**
     * If highlight == true colorize output
     *
     * @param g2
     * @param highlight
     */

    public abstract void colorizeOutput(final Graphics2D g2, boolean highlight);

    /**
     * If highlight == true colorize output2
     *
     * @param g2
     * @param highlight
     */

    public abstract void colorizeOutput2(final Graphics2D g2, boolean highlight);

    /**
     * Utility method for drawing connector shapes
     *
     * @param g2    Graphics to use for drawing
     * @param shape shape to draw
     * @param color color to fill the shape
     */
    protected void colorizeShape(Graphics2D g2, Shape shape, Color color) {
        Color backupColor = g2.getColor();
        g2.setColor(color);
        g2.fill(shape);
        g2.setColor(backupColor);
    }


    /**
     * Method for writing primitive to file
     *
     * @return string that describes written primitive
     */
    public abstract String convert();

    /**
     * Finds the closest point from array of inner points
     *
     * @param point
     * @return the closest point
     */
    public Point getClosestPoint(final Point point) {
        ArrayList<Point> pointList = getPointsList();
        Point result = pointList.get(0);
        int length = (result.x - point.x) * (result.x - point.x) + (result.y - point.y) * (result.y - point.y);
        for (int i = 1; i < pointList.size(); i++) {
            int l = (pointList.get(i).x - point.x) * (pointList.get(i).x - point.x) + (pointList.get(i).y - point.y) * (pointList.get(i).y - point.y);
            if (l < length) {
                result = pointList.get(i);
                length = l;
            }
        }
        return result;
    }

    /**
     * Tests is output highlighted,
     *
     * @return
     */


    public boolean isOutputHighlighted() {
        return outputHighlighted;
    }

    /**
     * Tests is output2 highlighted,
     *
     * @return
     */

    public boolean isOutput2Highlighted() {
        return output2Highlighted;
    }


    public void addInputLink(List<Entity> inputLink) {
        this.inputLinks.add(inputLink);
    }

    public boolean removeInputLink(List<Entity> link) {
        return inputLinks.remove(link);
    }

	public List<List<Entity>> clearInputLinks() {
		List<List<Entity>> links = inputLinks;
		inputLinks = new ArrayList<List<Entity>>();
		return links;
	}

    public List<Entity> getOutputLink() {
        return outputLink;
    }

    public void setOutputLink(List<Entity> outputLink) {
        this.outputLink = outputLink;
    }

    public List<Entity> getOutput2Link() {
        return output2Link;
    }

    public void setOutput2Link(List<Entity> output2Link) {
        this.output2Link = output2Link;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
        if (selected) {
            borderColor = selectedBorderColor;
            fillColor = selectedFillColor;
        }
        else {
            borderColor = Color.BLACK;
            fillColor = Color.WHITE;
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Entity)) return false;

        Entity entity = (Entity) o;

        if (number != entity.number) return false;
        if (name != null ? !name.equals(entity.name) : entity.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = number;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }


    public String convertEntityFields(Entity entity) {
        return new StringBuilder().append(entity.name).append(" ").append(entity.number).append(" ").
                append(entity.x).append(" ").append(entity.y).append(" ").append(entity.getInitialValue()).toString();
    }

    /**
     * Every vertex has its input and output links. This links equal to links in CommittedList.
     * Links are represented by ArrayList, where first element  is "head" of connection, last element - "tail".
     * All other entities are lines that connect linked shapes.
     *
     * @param link list with link
     * @return string representation
     */

    public String convertLinkToString(List<Entity> link) {
        String result = "";
        result += link.get(0).getName() + " ";    //head
        result += link.get(0).getNumber() + " ";

        for (int i = 1; i < link.size() - 1; i++)
            result += link.get(i).convert();    //lines



        result += link.get(link.size() - 1).getName() + " " + link.get(link.size() - 1).getNumber() + " ";       //tail

        return result;
    }

	/**
	 * Checks that entity has value and properly connected
	 * @return true if something is wrong
	 */
	public boolean hasErrors() {
		return false;
	}

	/**
	 * Returns an error message about entity usage
	 * @return error message or empty string if all is correct
	 */
	public String getErrors() {
		return "";
	}

	public final boolean isInCycle() {
		return inCycle;
	}

	public void setInCycle(boolean inCycle) {
		this.inCycle = inCycle;
	}
}


