package redactor.gui.handlers;

import redactor.Data;
import redactor.TestMain;
import redactor.gui.graphicalElements.Entity;
import redactor.gui.graphicalElements.Line;
import redactor.gui.graphicalElements.LineLabel;

import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionListener;

/**
 * <code>MouseHandler</code> used for processing mouse motion and drag events
 */

public class CanvasMouseMotionHandler implements MouseMotionListener {

    private redactor.gui.Canvas canvas;
    private Line currentLine;


    public CanvasMouseMotionHandler(redactor.gui.Canvas canvas) {
        this.canvas = canvas;
    }

    /**
     * If cursor leaves shape output , sets highlighted item to null and turns off highlighting of output.
     * If cursor in output then highlight it and save current shape as highlighted entity
     *
     * @param event mouse event
     */

    public void handleHighlightOutputEvent(MouseEvent event) {

        int xM = event.getX();
        int yM = event.getY();
        Entity highlightedEntity = canvas.getOutputHighlightedEntity();
        Graphics2D graphics = (Graphics2D) canvas.getGraphics();
        if (highlightedEntity != null) {

            if (highlightedEntity.isOutputHighlighted()&& !highlightedEntity.outputBoundCheck(xM, yM)) {
                highlightedEntity.colorizeOutput(graphics, false);
                canvas.setOutputHighlightedEntity(null);

            } else if (highlightedEntity.isOutput2Highlighted() && !highlightedEntity.output2BoundCheck(xM, yM)) {
                highlightedEntity.colorizeOutput2(graphics, false);
                canvas.setOutputHighlightedEntity(null);
            }

        } else {       //if highlightedEntity == null

            for (Entity entity : canvas.getData().getListOfEntities()) {
                if ((!entity.isOutputUsed() && entity.outputBoundCheck(xM, yM)) ||
                        (!entity.isOutput2used() && entity.output2BoundCheck(xM, yM))) {            //highlight output
                    canvas.setOutputHighlightedEntity(entity);

                    if (entity.outputBoundCheck(xM, yM))
                        entity.colorizeOutput(graphics, true);
                    else entity.colorizeOutput2(graphics, true);

                    break;
                }
            }
        }
    }

    /**
     * If cursor leaves shapes input , sets highlighted item to null and turns off highlighting of input.
     * If cursor in input and it is available then highlight it and save current shape as highlighted entity
     *
     * @param event mouse event
     * @return isInputHighlighted
     */

    public boolean handleHighlightInputEvent(MouseEvent event) {

        int xM = event.getX();
        int yM = event.getY();

        boolean isInputHighlighted = false;

        Graphics2D graphics = (Graphics2D) canvas.getGraphics();
        for (Entity entity : canvas.getData().getListOfEntities()) {
            if ((entity.inputBoundCheck(xM, yM)) && !entity.equals(canvas.getData().getListOfCurrentConnection().get(0)) ){       //highlight input if it is other shape
                // entity.colorizeInput(graphics, true);
                canvas.setInputHighlightedEntity(entity);
                isInputHighlighted = true;
                break;
            } else {
                // entity.colorizeInput(graphics, false);
                isInputHighlighted = false;
                canvas.setInputHighlightedEntity(null);
            }

        }
        return isInputHighlighted;
    }


    /**
     * Finds the closest available point of shape, if cursor in its bounds. Sets lineLabel to this coordinates.
     *
     * @param x         cursor X-coordinate
     * @param y         cursor Y-coordinate
     * @param data      data
     * @param lineLabel lineLabel
     * @return isCursorOnShape
     */

    public boolean setCursorToAvailableShapePoint(int x, int y, Data data, LineLabel lineLabel) {


        boolean cursorOnShape = false;


        for (int i = data.getListOfEntities().size() - 1; i >= 0; i--) {
            if (data.getListOfEntities().get(i).boundCheck(x, y)) {               //if on shape, change lineLabel location to available shape point
                Point point = data.getListOfEntities().get(i).getClosestPoint(new Point(x, y));
                lineLabel.setX(point.x, data.getPage().getWidth());
                lineLabel.setY(point.y, data.getPage().getHeight());
                cursorOnShape = true;
                break;
            }
        }
        return cursorOnShape;
    }

    /**
     * Sets new position to lineLabel
     * @param x
     * @param y
     * @param lineLabel
     * @param data
     */

    public void repaintLineLabel(int x, int y, LineLabel lineLabel, Data data) {

        if (x % TestMain.gridScale < TestMain.gridScale / 2) {
            lineLabel.setX(x - x % TestMain.gridScale, data.getPage().getWidth());
        } else {
            lineLabel.setX(x + TestMain.gridScale - x % TestMain.gridScale, data.getPage().getWidth());
        }
        if (y % TestMain.gridScale < TestMain.gridScale / 2) {
            lineLabel.setY(y - y % TestMain.gridScale, data.getPage().getHeight());
        } else {
            lineLabel.setY(y + TestMain.gridScale - y % TestMain.gridScale, data.getPage().getHeight());
        }

    }


    /**
     * If cursor is on unused output, highlight it.
     *
     */
    public void mouseMoved(final MouseEvent event) {

        Data data = canvas.getData();
        int toolBarState = canvas.getToolBarState();
        LineLabel lineLabel = canvas.getLineLabel();
        boolean cursorOnShape = false;

        int xM = event.getX();
        int yM = event.getY();


        if ((toolBarState == 4) || (toolBarState == 5)) { //Line
            cursorOnShape = setCursorToAvailableShapePoint(xM, yM, data, lineLabel);

            if (!cursorOnShape)
                repaintLineLabel(xM, yM, lineLabel, data);
        }

        if (toolBarState == 1)       //cursor
            handleHighlightOutputEvent(event);

        canvas.repaint();
    }


    /**
     * Drags chosen object to new position and repaints draw panel.
     * Paints new line if line-tool selected.
     *
     * @see java.awt.event.MouseMotionListener#mouseDragged(java.awt.event.MouseEvent)
     */
    public void mouseDragged(final MouseEvent event) {

        Data data = canvas.getData();


        if (event.getModifiers() == event.BUTTON1_MASK) {

            Entity chosenEntity = canvas.getChosenEntity();
            if (chosenEntity != null && !("undirectedLine".equals(chosenEntity.getName())))
                dragShape(event, chosenEntity);


            currentLine = canvas.getCurrentLine();
            if (currentLine != null) {
                if (canvas.getToolBarState() == 4) {     //Undirected Line

                    Point currentPoint = canvas.getSelectedOutputPoint();
                    int dx = -currentPoint.x;
                    int dy = -currentPoint.y;
                    dx = dx + event.getX();
                    dy = dy + event.getY();
                    if (currentLine.getDirection() == 0)
                        setLineDirection(dx, dy, currentLine);

                    LineLabel lineLabel = canvas.getLineLabel();
                    Point newEndOfLine = editEndOfLine(dx, dy, currentLine, currentPoint, lineLabel, data);


                    canvas.setSelectedOutputPoint(newEndOfLine);

                    handleHighlightInputEvent(event);
                }
                canvas.repaint();
            }

        }


    }

    /**
     * Drags chosen shape to new positions and repaints draw panel
     *
     * @param event        mouseDraggedEvent
     * @param chosenEntity selected item
     */

    public void dragShape(final MouseEvent event, Entity chosenEntity) {
        Point currentPoint = canvas.getMousePressedPoint();

        int dx = -currentPoint.x;
        int dy = -currentPoint.y;
        dx = dx + event.getX();
        dy = dy + event.getY();


        if (Math.abs(dx) >= TestMain.gridScale / 2) {
            if (dx < 0) {
                dx -= TestMain.gridScale;
                currentPoint.x += dx / TestMain.gridScale * TestMain.gridScale;
            } else {
                dx += TestMain.gridScale;
                currentPoint.x += dx / TestMain.gridScale * TestMain.gridScale;
            }
            chosenEntity.setX(chosenEntity.getX() + dx / TestMain.gridScale * TestMain.gridScale);
        }
        if (Math.abs(dy) >= TestMain.gridScale / 2) {
            if (dy <= 0) {
                dy -= TestMain.gridScale;
                currentPoint.y += dy / TestMain.gridScale * TestMain.gridScale;
            } else {
                dy += TestMain.gridScale;
                currentPoint.y += dy / TestMain.gridScale * TestMain.gridScale;
            }
            chosenEntity.setY(chosenEntity.getY() + dy / TestMain.gridScale * TestMain.gridScale);
        }

        Data data = canvas.getData();

        java.util.List<java.util.List<Entity>> affectedLinks = data.findThisItemInCommited(chosenEntity);
        if (!affectedLinks.isEmpty()) {
            for (java.util.List<Entity> link : affectedLinks) {
                data.removeConnection(link);
            }
        }


        canvas.repaint();


    }

    public void setLineDirection(int dx, int dy, Line currentLine) {

        if ((Math.abs(dx) >= TestMain.gridScale / 2) || (Math.abs(dy) >= TestMain.gridScale / 2)) {
            if (Math.abs(dx) > Math.abs(dy)) {
                currentLine.setDirection(Line.HORISONTAL);
            } else {
                currentLine.setDirection(Line.VERTICAL);
            }
        }

    }

    /**
     * Edit end of current line.
     * Changes coordinates of current point.
     * Sets lineLabel to new position
     *
     * @param dx           displacement of X
     * @param dy           displacement of Y
     * @param currentLine
     * @param currentPoint
     * @param lineLabel
     * @param data
     * @return Point - end of current line
     */

    public Point editEndOfLine(int dx, int dy, Line currentLine, Point currentPoint, LineLabel lineLabel, Data data) {
        if (Math.abs(dx) >= TestMain.gridScale / 2) {
            if (dx < 0) {
                dx -= TestMain.gridScale;
                currentPoint.x += dx / TestMain.gridScale * TestMain.gridScale;
            } else {
                dx += TestMain.gridScale;
                currentPoint.x += dx / TestMain.gridScale * TestMain.gridScale;
            }
            currentLine.editXEnd(currentLine.getXEnd() + dx / TestMain.gridScale * TestMain.gridScale);
            lineLabel.setX(currentLine.getXEnd(), data.getPage().getWidth());
            lineLabel.setY(currentLine.getYEnd(), data.getPage().getHeight());
        }
        if (Math.abs(dy) >= TestMain.gridScale / 2) {
            if (dy <= 0) {
                dy -= TestMain.gridScale;
                currentPoint.y += dy / TestMain.gridScale * TestMain.gridScale;
            } else {
                dy += TestMain.gridScale;
                currentPoint.y += dy / TestMain.gridScale * TestMain.gridScale;
            }
            currentLine.editYEnd(currentLine.getYEnd() + dy / TestMain.gridScale * TestMain.gridScale);
            lineLabel.setY(currentLine.getYEnd(), data.getPage().getHeight());
            lineLabel.setX(currentLine.getXEnd(), data.getPage().getWidth());
        }

        return new Point(currentLine.getXEnd(), currentLine.getYEnd());
    }

}
