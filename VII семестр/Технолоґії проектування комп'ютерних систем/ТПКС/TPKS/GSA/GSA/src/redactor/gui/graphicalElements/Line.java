package redactor.gui.graphicalElements;

import redactor.TestMain;

import java.awt.*;

/**
 * Class Line defines line interface.
 */
public abstract class Line extends Entity{



        /**
         * xEnd, yEnd - end of line coordinates
         * start, end - pointers to objects associated with begin and end of line
         */
        protected int xEnd, yEnd;
        protected Entity start, end;
        /**
         * Possible orientations of line
         */
        public static int VERTICAL = 1;
        public static int HORISONTAL = 2;

        /**
         * Line constructor. Begin and end point are params.
         */
        public Line(final int x, final int y, final int xEnd, final int yEnd) {
            super(x, y, 0, null);
            this.xEnd = xEnd;
            this.yEnd = yEnd;
            shape = null;
            start = null;
            end = null;
        }
    


        /**
         * Returns closest point, possible in grid. Line hasn't inner points
         * @see redactor.gui.graphicalElements.Entity#getClosestPoint(java.awt.Point)
         */
        public Point getClosestPoint(final Point point) {
            Point result = new Point();
            if (point.x % TestMain.gridScale < TestMain.gridScale / 2) {
                result.x = point.x - point.x % TestMain.gridScale;
            } else {
                result.x = point.x + TestMain.gridScale - point.x % TestMain.gridScale;
            }
            if (point.y % TestMain.gridScale < TestMain.gridScale / 2) {
                result.y = point.y - point.y % TestMain.gridScale;
            } else {
                result.y = point.y + TestMain.gridScale - point.y % TestMain.gridScale;
            }
            return result;
        }
        /**
         * Method editX edits X-coordinate of begin point
         * @param x X-coordinate
         */
        public abstract void editX(final int x);

        /**
         * Method editXEnd edits X-coordinate of end point
         * @param xEnd X-coordinate
         */
        public abstract void editXEnd(final int xEnd);

        /**
         * Method editY edits Y-coordinate of begin point
         * @param y Y-coordinate
         */
        public abstract void editY(final int y);

        /**
         * Method editYEnd edits Y-coordinate of end point
         * @param yEnd Y-coordinate
         */
        public abstract void editYEnd(final int yEnd);

        /**
         * Method getXEnd returns X-coordinate of end point
         * @return X-coordinate
         */
        public abstract int getXEnd();

        /**
         * Method getYEnd returns Y-coordinate of end point
         * @return Y-coordinate
         */
        public abstract int getYEnd();

        /**
         * Returns orientation of line.
         * Vertical line returns 1
         * Horizontal line returns 2
         * Directed line returns -1
         * @return orientation
         */
        public abstract int getDirection();

        /**
         * Method setDirection sets orientation of line.
         * @param direction orientation
         */
        public abstract void setDirection(final int direction);

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        Line line = (Line) o;

        if (xEnd != line.xEnd) return false;
        if (yEnd != line.yEnd) return false;
        if (end != null ? !end.equals(line.end) : line.end != null) return false;
        if (start != null ? !start.equals(line.start) : line.start != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = name.hashCode();
        result = 31 * result + xEnd;
        result = 31 * result + yEnd;
        result = 31 * result + (start != null ? start.hashCode() : 0);
        result = 31 * result + (end != null ? end.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Line{" +
                "xEnd=" + xEnd +
                ", yEnd=" + yEnd +
                '}';
    }

	@Override
	public void setInCycle(boolean inCycle) {
	}
}


