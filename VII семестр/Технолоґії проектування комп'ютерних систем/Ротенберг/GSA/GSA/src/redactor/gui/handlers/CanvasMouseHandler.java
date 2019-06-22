package redactor.gui.handlers;

import redactor.Data;
import redactor.TestMain;
import redactor.gui.graphicalElements.Entity;
import redactor.gui.graphicalElements.Line;
import redactor.gui.graphicalElements.LineLabel;

import java.awt.*;
import java.awt.event.InputEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.List;

/**
 * <code>MouseHandler</code>  used for processing mouse clicked events
 */
public class CanvasMouseHandler implements MouseListener {

    private redactor.gui.Canvas canvas;

    public CanvasMouseHandler(redactor.gui.Canvas canvas) {
        this.canvas = canvas;

    }

    /**
     *  Handles release of mouse.
     *  If created line is null-sized, remove it.
     *  If line-tool is active and mouse released on available input, commits connection.
     *
     * @param event mouse event to process
     */

    public void mouseReleased(final MouseEvent event) {
        Data data = canvas.getData();

        int toolBarState = canvas.getToolBarState();
        if ((toolBarState == 4) || (toolBarState == 5)) { //Line-tool selected


            canvas.getLineLabel().setID("start");
            canvas.repaint();
        }
        Line currentLine = canvas.getCurrentLine();
        if (currentLine != null) {        //delete null-size line
            if ((currentLine.getX() == currentLine.getXEnd()) && (currentLine.getY() == currentLine.getYEnd())) {
                canvas.getData().getListOfEntities().remove(currentLine);
                canvas.repaint();
            } else {
                if (canvas.getInputHighlightedEntity() != null) {

                    data.getListOfCurrentConnection().add(canvas.getInputHighlightedEntity());

                    data.commitConnection();
                    canvas.getLineLabel().setVisible(false);


                //    for (int i = 0; i < data.getListOfCommittedConnections().size(); i++)
                //        System.out.println("committed " + data.getListOfCommittedConnections().get(i));

                    canvas.setInputHighlightedEntity(null);
                    canvas.setOutputHighlightedEntity(null);
                    canvas.setToolBarState(1, true);
                    canvas.repaint();
                }

            }
        }
        if (event.getModifiers() == MouseEvent.BUTTON3_MASK ) {
            canvas.enablePopupMenu(canvas.getChosenEntity() != null && canvas.getChosenEntity().boundCheck(event.getX(), event.getY()));
        }
    }



    public void mouseClicked(final MouseEvent event) {
        if (event.isPopupTrigger()) {
            canvas.enablePopupMenu(canvas.getChosenEntity() != null && canvas.getChosenEntity().boundCheck(event.getX(), event.getY()));
        }
    }

    public void mouseEntered(final MouseEvent event) {
        int toolBarState = canvas.getToolBarState();
        if ((toolBarState == 4) || (toolBarState == 5)) { //Line-tool selected
            canvas.getLineLabel().setVisible(true);
        }
    }

    public void mouseExited(final MouseEvent event) {
        int toolBarState = canvas.getToolBarState();
        if ((toolBarState == 4) || (toolBarState == 5)) { //Line-tool selected
            canvas.getLineLabel().setVisible(false);
            canvas.repaint();
        }
    }

    /**
     * By left button press:
     *      If cursor-tool is active:
     *          - if clicked on shape, make it chosen;
     *          - if clicked on free output, set line-tool and create new current connection;
     *
     *       If operation or vertex tool is active:
     *          - create new vertex;
     *
     *       If line-tool is active:
     *          - create new line;
     *
     * By right button press:
     *      If cursor-tool is in bounds of shape show popup-menu;
     *      If line-tool is active clear current connection and set tool to cursor;
     *      If vertex-tool is active set tool to cursor.
     *
     * @param event mouse event
     */

    public void mousePressed(final MouseEvent event) {

        canvas.requestFocusInWindow();

        if (event.getModifiers() == InputEvent.BUTTON1_MASK) {
            Data data = canvas.getData();
            switch (canvas.getToolBarState()) {
                case 1: { //Cursor
                    data.getListOfCurrentConnection().clear();
                    int x = event.getPoint().x;
                    int y = event.getPoint().y;

                    canvas.setMousePressedPoint(event.getPoint());
                    handleOutputClickedEvent(x, y, data);
                    handleChosenEvent(x, y, data);

                    break;
                }

                case 2: { //Operator vertex
                    int x = event.getPoint().x - event.getPoint().x % TestMain.gridScale;
                    int y = event.getPoint().y - event.getPoint().y % TestMain.gridScale;
                    canvas.setMousePressedPoint(new Point(x, y));
                    data.createOperation(x, y, true);
                    break;
                }

                case 3: { //Condition vertex
                    int x = event.getPoint().x - event.getPoint().x % TestMain.gridScale;
                    int y = event.getPoint().y - event.getPoint().y % TestMain.gridScale;
                    canvas.setMousePressedPoint(new Point(x, y));
                    data.createCondition(x, y, true);
                    break;
                }
                case 4: { //UndirectedArc

                    LineLabel lineLabel = canvas.getLineLabel();
                    lineLabel.setID("end");

                    Line currentLine = data.createUndirectedLine(canvas.getSelectedOutputPoint().x, canvas.getSelectedOutputPoint().y);

                    //    Line currentLine = data.createUndirectedLine(highlightedEntity.getOutputCenter().x, highlightedEntity.getOutputCenter().y);

                    //    canvas.setMousePressedPoint(event.getPoint());
                    //    Line currentLine = data.createUndirectedLine(lineLabel.getX(), lineLabel.getY());


                    data.getListOfCurrentConnection().add(currentLine);
                    //    data.getListOfEntities().add(0, currentLine);
                    canvas.setCurrentLine(currentLine);
                    break;
                }

                case 5: { //DirectedArc
                    LineLabel lineLabel = canvas.getLineLabel();
                    lineLabel.setID("end");
                    int x = lineLabel.getX();
                    int y = lineLabel.getY();
                    canvas.setMousePressedPoint(new Point(x, y));
                    Line currentLine = data.createDirectedLine(x, y);
                    data.getListOfEntities().add(0, currentLine);
                    canvas.setCurrentLine(currentLine);
                    break;
                }
            }
        }
        if (event.getModifiers() == InputEvent.BUTTON3_MASK) {

            switch (canvas.getToolBarState()) {
                case 1:
                    if (canvas.getChosenEntity() != null ){
                        if  ("OperationalVertex".equals(canvas.getChosenEntity().getName())) {

                            canvas.setPopupEditOperationEnabled(true);
                            canvas.setPopupEditConditionEnabled(false);

                        }

                        else if   ("Condition".equals(canvas.getChosenEntity().getName())) {
                            canvas.setPopupEditOperationEnabled(false);
                            canvas.setPopupEditConditionEnabled(true);
                        }

                        else{
                            canvas.setPopupEditConditionEnabled(false);
                            canvas.setPopupEditOperationEnabled(false);
                        }

                    }

                    else  {
                        canvas.setPopupEditConditionEnabled(false);
                        canvas.setPopupEditOperationEnabled(false);
                    }
                    canvas.enablePopupMenu(canvas.getChosenEntity() != null && canvas.getChosenEntity().boundCheck(event.getX(), event.getY()));
                    break;

                case 2: case 3: case 4: case 5:

                    Data data = canvas.getData();
                    data.getListOfCurrentConnection().clear();
                    canvas.getLineLabel().setVisible(false);
                    canvas.setChosenEntity(null);
                    canvas.setToolBarState(1, true);
		            break;


            }

        }
        canvas.repaint();
    }

    /**
     * If shape is clicked set it as chosen object (repaint with another color and decorate by little red square on top).
     * @param x mouse click x coordinate
     * @param y mouse click y coordinate
     * @param data an algorithm data
     */

    public void handleChosenEvent(int x, int y, Data data) {

        boolean selected = false;
        for (Entity entity : data.getListOfEntities()) {
            if (entity.boundCheck(x, y)) {
                canvas.setChosenEntity(entity);
                selected = true;
            }
        }
        if (selected)
            return;

        if (data.getListOfCommittedConnections() != null) {
            for (List<Entity> connection : data.getListOfCommittedConnections()) {
                for (Entity entity : connection) {
                    if (entity.boundCheck(x, y)) {
                        canvas.setChosenEntity(entity);
                        System.out.println("chosen " + entity);
                        return;
                    }
                }
            }
        }

        canvas.setChosenEntity(null);
    }

    /**
     * If cursor is on some output, check is this output unused.
     * If it is free, highlight output and set line-tool.
     * @param x mouse click x coordinate
     * @param y mouse click y coordinate
     * @param data an algorithm data
     */

    public void handleOutputClickedEvent(int x, int y, Data data) {
        data.getListOfCurrentConnection().clear();
        Entity highlightedEntity = canvas.getOutputHighlightedEntity();
        if (highlightedEntity != null) {
            if (!highlightedEntity.isOutputUsed() && highlightedEntity.outputBoundCheck(x, y)) {

                canvas.setSelectedOutputPoint(highlightedEntity.getOutputCenter());
                LineLabel label = canvas.getLineLabel();
                label.setX(highlightedEntity.getOutputCenter().x, data.getPage().getWidth());
                label.setY(highlightedEntity.getOutputCenter().y, data.getPage().getWidth());
                canvas.setLineLabel(label);

                data.getListOfCurrentConnection().add(highlightedEntity);

                canvas.setToolBarState(4, false);

            } else if (!highlightedEntity.isOutput2used() && highlightedEntity.output2BoundCheck(x, y)) {

                canvas.setSelectedOutputPoint(highlightedEntity.getOutput2Center());
                LineLabel label = canvas.getLineLabel();
                label.setX(highlightedEntity.getOutput2Center().x, data.getPage().getWidth());
                label.setY(highlightedEntity.getOutput2Center().y, data.getPage().getWidth());
                canvas.setLineLabel(label);

                data.getListOfCurrentConnection().add(highlightedEntity);

                canvas.setToolBarState(4, false);

            }
            canvas.enablePopupMenu(false);

        }

    }
}
