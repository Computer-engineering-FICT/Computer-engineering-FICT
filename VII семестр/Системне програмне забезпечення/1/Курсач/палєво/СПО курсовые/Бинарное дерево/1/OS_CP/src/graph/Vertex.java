package graph;

import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.Serializable;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 26.12.10
 * Time: 18:25
 * To change this template use File | Settings | File Templates.
 */
class Vertex implements Serializable {

    private static Color VERTEX_COLOR = Color.CYAN;
    private static Color TEXT_COLOR = Color.BLACK;
    private static int VERTEX_DIAMETER = 50;
    private static Font TEXT_FONT = new Font("Monospaced", Font.PLAIN, 14);

    private String name;
    private int weight;
    private Point2D leftUpperCorner;

    private ArrayList<Vertex> nextVertexes;

    public Vertex(String name, int weight, Point2D leftUpperCorner) {
        this.name = name;
        this.weight = weight;
        this.leftUpperCorner = leftUpperCorner;
        nextVertexes = new ArrayList<Vertex>();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public Point2D getLeftUpperCorner() {
        return leftUpperCorner;
    }

    public void setLeftUpperCorner(Point2D leftUpperCorner) {
        this.leftUpperCorner = leftUpperCorner;
    }

    public ArrayList<Vertex> getNextVertexes() {
        return nextVertexes;
    }

    public static int getVERTEX_DIAMETER() {
        return VERTEX_DIAMETER;
    }

    public void addNextVertex(Vertex v) throws ConnectionAlreadyExistException {
        if (nextVertexes.contains(v)) {
            throw new ConnectionAlreadyExistException();
        }
        nextVertexes.add(v);
    }

    public void removeNextVertex(Vertex v) throws ConnectionDoesntExistException {
        if (!nextVertexes.contains(v)) {
            throw new ConnectionDoesntExistException();
        }
        nextVertexes.remove(v);
    }

    public boolean contains(Point p) {
        if ((p.getX() >= leftUpperCorner.getX()) && (p.getX() <= leftUpperCorner.getX() + VERTEX_DIAMETER) &&
                (p.getY() >= leftUpperCorner.getY()) && (p.getY() <= leftUpperCorner.getY() + VERTEX_DIAMETER)) {
            return true;
        }
        else {
            return false;
        }
    }

    public Point getCenter() {
        return new Point((int) (leftUpperCorner.getX() + (VERTEX_DIAMETER / 2)),
                (int) (leftUpperCorner.getY() + (VERTEX_DIAMETER / 2)));
    }

    public void draw(Graphics2D g2) {
        g2.setColor(VERTEX_COLOR);
        g2.fillOval((int) leftUpperCorner.getX(), (int) leftUpperCorner.getY(), VERTEX_DIAMETER, VERTEX_DIAMETER);
        g2.setColor(TEXT_COLOR);
        g2.setFont(TEXT_FONT);
        FontRenderContext context = g2.getFontRenderContext();
        String weightString = String.valueOf(weight);
        Rectangle2D bounds = TEXT_FONT.getStringBounds(weightString, context);
        int x = ((int) leftUpperCorner.getX() + VERTEX_DIAMETER / 2 - (int) bounds.getWidth() / 2);
        int y = ((int) leftUpperCorner.getY() + VERTEX_DIAMETER / 2 + (int) bounds.getHeight() / 4);
        g2.drawString(weightString, x ,y);
        bounds = TEXT_FONT.getStringBounds(name, context);
        x = ((int) leftUpperCorner.getX() + VERTEX_DIAMETER / 2 - (int) bounds.getWidth() / 2);
        y = (int) leftUpperCorner.getY() - 5;
        g2.drawString(name, x, y);
    }

}
