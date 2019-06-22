package redactor.gui.graphicalElements;

import redactor.TestMain;

import java.awt.*;
import java.awt.geom.Line2D;

/**
 *
 *
 */
public class DirectedLine extends Line {
    private int dx, dy;

    public DirectedLine(final int x, final int y, final int xEnd, final int yEnd) {
        super(x, y, xEnd, yEnd);
        name = "directed line";
        dy = yEnd - y;
        dx = xEnd - x;

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
        g2.draw(new Line2D.Double(x, y, xEnd, yEnd));
        double xNew = x - xEnd;
        double yNew = y - yEnd;
        double xbuf = xNew * Math.sqrt(3) / 2 - yNew / 2;
        double ybuf = xNew / 2 + yNew * Math.sqrt(3) / 2;
        double k = Math.sqrt(xbuf * xbuf + ybuf * ybuf) / TestMain.drawScale;
        if (k == 0) {
            k = 1;
        }
        Color backupColor = g2.getColor();
        g2.setColor(borderColor);
        g2.draw(new Line2D.Double(xEnd, yEnd, Math.round(xbuf / k + xEnd), Math.round(ybuf / k + yEnd)));
        xbuf = xNew * Math.sqrt(3) / 2 + yNew / 2;
        ybuf = -xNew / 2 + yNew * Math.sqrt(3) / 2;
        g2.draw(new Line2D.Double(xEnd, yEnd, Math.round(xbuf / k + xEnd), Math.round(ybuf / k + yEnd)));
        g2.setColor(backupColor);
    }


    public String convert() {
        String result = "";
        result += name + " ";
        result += Integer.toString(x) + " ";
        result += Integer.toString(y) + " ";
        result += Integer.toString(getXEnd()) + " ";
        result += Integer.toString(getYEnd());
        return result;
    }


    public void setX(final int x) {
        this.x = x;
        this.xEnd = this.x + this.dx;
    }


    public void setY(final int y) {
        this.y = y;
        this.yEnd = this.y + this.dy;
    }


    public void editX(final int x) {
        this.xEnd = this.x + this.dx;
        this.x = x;
        dx = this.xEnd - this.x;
    }


    public void editXEnd(final int xEnd) {
        this.xEnd = xEnd;
        dx = this.xEnd - this.x;
    }


    public void editY(final int y) {
        this.yEnd = this.y + this.dy;
        this.y = y;
        dy = this.yEnd - this.y;
    }


    public void editYEnd(final int yEnd) {
        this.yEnd = yEnd;
        dy = this.yEnd - this.y;
    }


    public int getXEnd() {
        return xEnd;
    }


    public int getYEnd() {
        return yEnd;
    }


    public int getDirection() {
        return -1;
    }


    public void setDirection(final int direction) {
    }


    public boolean boundCheck(final int x, final int y) {
        double a = (double) (this.yEnd - this.y);
        double b = -(double) (this.xEnd - this.x);
        double c = -(double) this.x * (this.yEnd - this.y) + (double) this.y * (this.xEnd - this.x);
        double l = Math.abs(a * x + b * y + c) / Math.sqrt(a * a + b * b);
        if (l < TestMain.gridScale / 2) {
            int high = this.xEnd;
            int low = this.x;
            if (this.x > this.xEnd) {
                high = this.x;
                low = this.xEnd;
            }
            if ((x < high + TestMain.gridScale / 2) && (x > low - TestMain.gridScale / 2)) {
                high = this.yEnd;
                low = this.y;
                if (this.y > this.yEnd) {
                    high = this.y;
                    low = this.yEnd;
                }
                if ((y < high + TestMain.gridScale / 2) && (y > low - TestMain.gridScale / 2)) {
                    return true;
                }
            }
        }
        return false;
    }


}


