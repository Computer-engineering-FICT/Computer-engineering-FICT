package graph;

import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 26.12.10
 * Time: 18:52
 * To change this template use File | Settings | File Templates.
 */
class Line implements Serializable {

    private static Color LINE_COLOR = Color.BLACK;
    private static Color TEXT_COLOR = Color.RED;
    private static Font TEXT_FONT = new Font("Monospaced", Font.PLAIN, 14);
    private static int ARROW_LENGTH = 20;
    private static double ARROW_ANGLE = 0.5;

    private Point2D p1;
    private Point2D p2;
    private int weight;

    public Line(Point2D p1, Point2D p2, int weight) {
        this.p1 = p1;
        this.p2 = p2;
        this.weight = weight;
    }

    public Point2D getP1() {
        return p1;
    }

    public void setP1(Point2D p1) {
        this.p1 = p1;
    }

    public Point2D getP2() {
        return p2;
    }

    public void setP2(Point2D p2) {
        this.p2 = p2;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public void draw(Graphics2D g2) {
        g2.setColor(LINE_COLOR);
        g2.drawLine((int) p1.getX(), (int) p1.getY(), (int) p2.getX(), (int) p2.getY());
        int length = (int) Math.sqrt(Math.pow(p2.getX() - p1.getX(), 2) + Math.pow(p2.getY() - p1.getY(), 2));
        int lambda = (int) (length / (Vertex.getVERTEX_DIAMETER() / 2));
        int arrowX = (int) ((p1.getX() + lambda * p2.getX()) / (1 + lambda));
        int arrowY = (int) ((p1.getY() + lambda * p2.getY()) / (1 + lambda));
        double temp = Math.atan2(p1.getX() - arrowX, p1.getY() - arrowY);
        g2.drawLine(arrowX, arrowY,
                (int) (arrowX + ARROW_LENGTH * Math.sin(temp + ARROW_ANGLE)),
                (int) (arrowY + ARROW_LENGTH * Math.cos(temp + ARROW_ANGLE)));
        g2.drawLine(arrowX, arrowY,
                (int) (arrowX + ARROW_LENGTH * Math.sin(temp - ARROW_ANGLE)),
                (int) (arrowY + ARROW_LENGTH * Math.cos(temp - ARROW_ANGLE)));
        if (weight != -1) {
            g2.setColor(TEXT_COLOR);
            g2.setFont(TEXT_FONT);
            FontRenderContext context = g2.getFontRenderContext();
            String weightString = String.valueOf(weight);
            int centerX = (int) ((p1.getX() + p2.getX()) / 2);
            int centerY = (int) ((p1.getY() + p2.getY()) / 2);
            Rectangle2D bounds = TEXT_FONT.getStringBounds(weightString, context);
            int x = centerX - (int) bounds.getWidth() / 2;
            int y = centerY + (int) bounds.getHeight() / 2;
            g2.drawString(weightString, x, y);
        }
    }

}
