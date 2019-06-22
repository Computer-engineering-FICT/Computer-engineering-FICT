package redactor.gui.graphicalElements;

import redactor.TestMain;

import java.awt.*;
import java.awt.geom.Line2D;
import java.awt.geom.Rectangle2D;

/**
 * Vertical or horisontal line.
 */
public class UndirectedLine extends Line {


    private int direction;
    private int length;

    public UndirectedLine(final int x, final int y, final int length, final int direction) {
        super(x, y, x, y);
        name = "undirectedLine";
        this.direction = direction;
        this.length = length;
    }

    @Override
    public void colorizeInput(Graphics2D g2, boolean highlight) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void colorizeOutput(Graphics2D g2, boolean highlight) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void colorizeOutput2(Graphics2D g2, boolean highlight) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public void draw(final Graphics2D g2) {
        switch (direction) {
            case 1:  //VERTICAL
                yEnd = y + length;
                xEnd = x;
                if (length >= 0) {
                    shape = new Rectangle2D.Double(x - TestMain.gridScale / 2, y - TestMain.gridScale / 2, TestMain.gridScale, length + TestMain.gridScale);
                } else {
                    shape = new Rectangle2D.Double(x - TestMain.gridScale / 2, y + length - TestMain.gridScale / 2, TestMain.gridScale, -length + TestMain.gridScale);
                }
                break;
            case 2:  //HORISONTAL
                xEnd = x + length;
                yEnd = y;
                if (length >= 0) {
                    shape = new Rectangle2D.Double(x - TestMain.gridScale / 2, y - TestMain.gridScale / 2, length + TestMain.gridScale, TestMain.gridScale);
                } else {
                    shape = new Rectangle2D.Double(x + length - TestMain.gridScale / 2, y - TestMain.gridScale / 2, -length + TestMain.gridScale, TestMain.gridScale);
                }
                break;
            default:
                break;
        }
        Color backupColor = g2.getColor();
        g2.setColor(borderColor);
        g2.draw(new Line2D.Double(x, y, xEnd, yEnd));
        g2.setColor(backupColor);
    }


    public String convert() {
        String result = "";
        result += name + " ";
        result += Integer.toString(x) + " ";
        result += Integer.toString(y) + " ";
        result += Integer.toString(length) + " ";
        result += Integer.toString(direction) + " ";
        return result;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public void editX(final int x) {
        switch (direction) {
            case 1:  //VERTICAL
                this.x = x;
                break;
            case 2:  //HORISONTAL
                this.xEnd = this.x + length;
                this.x = x;
                length = this.xEnd - this.x;
                break;
            default:
                break;
        }
    }


    public void editXEnd(final int xEnd) {
        switch (direction) {
            case 1:  //VERTICAL
                break;
            case 2:  //HORISONTAL
                length = xEnd - this.x;
                this.xEnd = xEnd;
                break;
            default:
                break;
        }
    }


    public void editY(final int y) {
        switch (direction) {
            case 1:  //VERTICAL
                this.yEnd = this.y + length;
                this.y = y;
                length = this.yEnd - this.y;
                break;
            case 2:  //HORISONTAL
                this.y = y;
                break;
            default:
                break;
        }
    }


    public void editYEnd(final int yEnd) {
        switch (direction) {
            case 1:  //VERTICAL
                length = yEnd - this.y;
                this.yEnd = yEnd;
                break;
            case 2:  //HORISONTAL
                break;
            default:
                break;
        }
    }


    public int getXEnd() {
        switch (direction) {
            case 1:  //VERTICAL
                return x;
            case 2:  //HORISONTAL
                return x + length;
            default:
                return x;
        }
    }


    public int getYEnd() {
        switch (direction) {
            case 1:  //VERTICAL
                return y + length;
            case 2:  //HORISONTAL
                return y;
            default:
                return y;
        }
    }


    public int getDirection() {
        return direction;
    }


    public void setDirection(final int direction) {
        this.direction = direction;
    }


}


