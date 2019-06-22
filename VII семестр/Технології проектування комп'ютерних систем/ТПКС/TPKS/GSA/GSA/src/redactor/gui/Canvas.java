package redactor.gui;

import redactor.Data;
import redactor.Mediator;
import redactor.Message;
import redactor.gui.handlers.CanvasMouseHandler;
import redactor.gui.handlers.CanvasMouseMotionHandler;
import redactor.gui.graphicalElements.Entity;
import redactor.gui.graphicalElements.Line;
import redactor.gui.graphicalElements.LineLabel;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.List;

/**
 * In this class mouse button pressed events are processed.
 * Defines interaction with lines.
 */
public class Canvas extends JPanel {


    private Data data;
    private Entity chosenEntity;
    private Entity outputHighlightedEntity;
    private Entity inputHighlightedEntity;
    private boolean inputHighlighted;
    private Line currentLine;
    private LineLabel lineLabel;
    private Mediator mediator;

    private Point mousePressedPoint;
    private Point selectedOutputPoint;


    private int toolBarState;

    private JPopupMenu popupMenu;
    private JMenuItem editOperation, editCondition;


    public Canvas(final Mediator mediator, final Data data) {
        toolBarState = 1;
        this.mediator = mediator;
        this.data = data;
        chosenEntity = null;
        lineLabel = new LineLabel("start");
        addMouseListener(new CanvasMouseHandler(this));
        addMouseMotionListener(new CanvasMouseMotionHandler(this));
        addKeyListener(new KeyHandler());
        setFocusable(true);

        outputHighlightedEntity = null;

        popupMenu = new JPopupMenu();

        Action action = new AbstractAction("Edit operation vertex") {
            public void actionPerformed(final ActionEvent event) {
                Message message = new Message(Message.newOperationDialog);
                mediator.update(message);
            }
        };
        editOperation = new JMenuItem(action);
        popupMenu.add(editOperation);
        editOperation.setEnabled(false);

        action = new AbstractAction("Edit condition vertex") {
            public void actionPerformed(final ActionEvent event) {
                Message message = new Message(Message.newConditionDialog);
                mediator.update(message);
            }
        };
        editCondition = new JMenuItem(action);
        popupMenu.add(editCondition);
        editCondition.setEnabled(false);

        this.setComponentPopupMenu(popupMenu);
    }



    public Entity getInputHighlightedEntity() {
        return inputHighlightedEntity;
    }

    public void setInputHighlightedEntity(Entity inputHighlightedEntity) {
        if (this.inputHighlightedEntity != null) {
            this.inputHighlightedEntity.colorizeInput((Graphics2D)getGraphics(), false);
        }
        this.inputHighlightedEntity = inputHighlightedEntity;
        if (inputHighlightedEntity != null) {
            inputHighlightedEntity.colorizeInput((Graphics2D)getGraphics(), true);
        }
    }

    public Point getSelectedOutputPoint() {
        return selectedOutputPoint;
    }

    public void setSelectedOutputPoint(Point selectedOutputPoint) {
        this.selectedOutputPoint = selectedOutputPoint;
    }

    public Entity getChosenEntity() {
        return chosenEntity;
    }

	/**
	 * Sets current toolbar state (mouse mode: cursor/operations/conditions)
	 * @param toolBarState new toolbar state
	 * @param notify true if such updateJustLoadedData originated by anything but toolbar
	 *                  and toolbar itself should be updated
	 */
    public void setToolBarState(final int toolBarState, boolean notify) {
        this.toolBarState = toolBarState;
        if (toolBarState != 1) {
            enablePopupMenu(false);
        }
	    if (notify) {
		    Message setToolbarMsg = new Message(Message.setToolbarState);
		    setToolbarMsg.setToolBarState(toolBarState);
		    mediator.update(setToolbarMsg);
	    }
    }

    public void setPopupEditOperationEnabled(boolean enabled) {
        editOperation.setEnabled(enabled);
    //    popupMenu.setVisible(true);
            }

    public void setPopupEditConditionEnabled(boolean enabled){
        editCondition.setEnabled(enabled);
    }


    private class KeyHandler implements KeyListener {
        private LineLabel lineLabel;

        public void keyPressed(final KeyEvent event) {
            if ((event.getKeyCode() == KeyEvent.VK_DELETE) || (event.getKeyCode() == KeyEvent.VK_BACK_SPACE) && chosenEntity != null) {
                
                if (!("Begin".equals(chosenEntity.getName())) && !("End".equals(chosenEntity.getName())))  {
                    
	                if (chosenEntity instanceof Line) {
		                List<List<Entity>> affectedLinks = data.findThisItemInCommited(chosenEntity);
		                if (!affectedLinks.isEmpty()) {
			                for (List<Entity> link : affectedLinks) {
				                data.removeConnection(link);
			                }
		                }
	                }
	                else {
		                chosenEntity.setSelected(false);
		                data.removeEntity(chosenEntity);
	                }
                    chosenEntity = null;
                    repaint();
                }
                

            }
        }

      public LineLabel getLineLable() {
        return lineLabel;
    }  public void keyReleased(final KeyEvent event) {
        }

        public void keyTyped(final KeyEvent event) {
        }
    }



    public void paintComponent(final Graphics g) {

        super.paintComponent(g);

        Graphics2D g2 = (Graphics2D) g;
        if (data.getPage() != null) {
            data.getPage().draw(g2);
            if (data.getListOfEntities() != null) {



                if (toolBarState != 1) {
                    if (chosenEntity != null) {
                        chosenEntity.setSelected(false);
                        chosenEntity = null;
                    }
                }
                Font font = g2.getFont();
                g2.setFont(new Font("Serif", Font.BOLD, 15));
                if (chosenEntity != null) {

                    chosenEntity.draw(g2);
                    for (int i = 0; i < data.getListOfEntities().size(); i++) {
                        if (chosenEntity == data.getListOfEntities().get(i)) {
                            chosenEntity.draw(g2);
                        } else {
                            data.getListOfEntities().get(i).draw(g2);
                            if (!(data.getListOfCommittedConnections().isEmpty())){
                                //    System.out.println("i have "+data.getListOfCommittedConnections());

                                for (int k = 0; k < data.getListOfCommittedConnections().size(); k++)
                                    for (int j = 0; j < data.getListOfCommittedConnections().get(k).size(); j++) {
                                        if (!(chosenEntity.equals(data.getListOfCommittedConnections().get(k).get(j))))
                                            data.getListOfCommittedConnections().get(k).get(j).draw(g2);
                                    }
                            }
                        }
                    }


                } else {
                    if (data.getListOfCurrentConnection() != null){
                        for (int i = 0; i < data.getListOfCurrentConnection().size(); i++){
                            data.getListOfCurrentConnection().get(i).draw(g2);
                        }

                    }

                    if (!(data.getListOfCommittedConnections().isEmpty())){
                    //    System.out.println("i have "+data.getListOfCommittedConnections());

                        for (int i = 0; i < data.getListOfCommittedConnections().size(); i++)
                            for (int j = 0; j < data.getListOfCommittedConnections().get(i).size(); j++) {
                           //     System.out.println(data.getListOfCommittedConnections().get(i).get(j));
                                data.getListOfCommittedConnections().get(i).get(j).draw(g2);
                            }
                    }

                    for (int i = 0; i < data.getListOfEntities().size(); i++) {
                        data.getListOfEntities().get(i).draw(g2);
                    }


                    

                    }


                g2.setFont(font);
            }
            

            

            
            if (lineLabel != null)
                lineLabel.draw(g2);
        }
    }

    public Data getData() {
        return data;
    }

    public int getToolBarState() {
        return toolBarState;
    }

    public Entity getOutputHighlightedEntity() {
        return outputHighlightedEntity;
    }

    public void setOutputHighlightedEntity(Entity entity) {
        if (entity == null) {
            if (outputHighlightedEntity != null) { // clear output connector highlighting
                if(outputHighlightedEntity.isOutputHighlighted()) {
                    outputHighlightedEntity.colorizeOutput((Graphics2D)getGraphics(), false);
                }
                else if (outputHighlightedEntity.isOutput2Highlighted()) {
                    outputHighlightedEntity.colorizeOutput2((Graphics2D)getGraphics(), false);
                }
            }
        }
        this.outputHighlightedEntity = entity;
    }

    public LineLabel getLineLabel() {
        return lineLabel;
    }

    public void setLineLabel(LineLabel lineLabel) {
        this.lineLabel = lineLabel;
    }

    public Point getMousePressedPoint() {
        return mousePressedPoint;
    }

    public void setMousePressedPoint(Point mousePressedPoint) {
        this.mousePressedPoint = mousePressedPoint;
    }

    public Line getCurrentLine() {
        return currentLine;
    }

    public void setCurrentLine(Line currentLine) {
        this.currentLine = currentLine;
    }

    public void setChosenEntity(Entity chosenEntity) {
        if (this.chosenEntity != null) {
            this.chosenEntity.setSelected(false);
        }
        this.chosenEntity = chosenEntity;
        if (chosenEntity != null) {
            chosenEntity.setSelected(true);
        }
    }

    public boolean isInputHighlighted() {
        return inputHighlighted;
    }

    public void enablePopupMenu(boolean enabled) {
        setComponentPopupMenu(enabled ? popupMenu : null);
    }
}
