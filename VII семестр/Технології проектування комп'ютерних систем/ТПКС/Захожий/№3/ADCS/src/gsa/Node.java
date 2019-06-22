package gsa;

import java.awt.*;
import java.util.LinkedList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 07.09.2010
 * Time: 14:08:19
 * To change this template use File | Settings | File Templates.
 */
abstract class Node {

    protected int x;
    protected int y;
    protected int width;
    protected int height;
    protected Color color;

    public abstract LinkedList<Node> getParents();

    public abstract LinkedList<Node> getChildren();

    public abstract String getText();

    public abstract int[] getSignals();

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }
    
}
