package gsa;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionAdapter;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.util.LinkedList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 07.09.2010
 * Time: 13:59:04
 * To change this template use File | Settings | File Templates.
 */
public class GSAPanel extends JPanel {

    private static Color DEFAULT_TEXT_COLOR = Color.BLACK;
    private static Font DEFAULT_FONT = new Font("Sans Serif", Font.PLAIN, 14);

    private GSAModel model;
    private JFrame frame;

    private Node dragNode;
    private int dragX;
    private int dragY;

    private Node parentNodeToConnect;
    private boolean isParentNodeLogic;
    private Point fromPoint;
    private Point toPoint;

    public GSAPanel(GSAModel model, JFrame frame) {
        super();
        this.model = model;
        this.frame = frame;
        setBackground(model.getBackgroundColor());
        addMouseListener(new GSAMouseListener(frame));
        addMouseMotionListener(new GSAMouseMotionListener());
        dragNode = null;
        dragX = 0;
        dragY = 0;
    }

    public GSAModel getModel() {
        return model;
    }

    public void setModel(GSAModel model) {
        this.model = model;
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;
        g2.setColor(model.getNetColor());
        for (int i = model.getNetInterval(); i < getWidth(); i += model.getNetInterval()) {
            g2.drawLine(i, 0, i, getHeight());
        }
        for (int i = model.getNetInterval(); i < getHeight(); i += model.getNetInterval()) {
            g2.drawLine(0, i, getWidth(), i);
        }
        for (Node e : model.getNodes()) {
            if (e.getClass().getName().contains("BeginNode")) {
                drawBeginNode((BeginNode) e, g2);
            }
            else {
                if (e.getClass().getName().contains("OperatorNode")) {
                    drawOperatorNode((OperatorNode) e, g2);
                }
                else {
                    if (e.getClass().getName().contains("LogicNode")) {
                        drawLogicNode((LogicNode) e, g2);
                    }
                    else {
                        drawEndNode((EndNode) e, g2);
                    }
                }
            }
        }
        for (Node e : model.getNodes()) {
            LinkedList<Node> children = e.getChildren();
            boolean haveChildren = false;
            if (children != null) {
                for (Node c : children) {
                    if (c != null) {
                        haveChildren = true;
                    }
                }
            }
            if (haveChildren) {
                if (e.getClass().getName().contains("BeginNode") || e.getClass().getName().contains("OperatorNode") || e.getClass().getName().contains("EndNode")) {
                    Node child = children.getFirst();
                    drawArrowLine(new Point(e.getX() + e.getWidth() / 2, e.getY() + e.getHeight()),
                            new Point(child.getX() + child.getWidth() / 2, child.getY()), g2);
                } else {
                    if (e.getClass().getName().contains("LogicNode")) {
                        Node yesChild = children.getFirst();
                        Node noChild = children.getLast();
                        if (yesChild != null) {
                            drawArrowLine(new Point(e.getX(), e.getY() + e.getHeight() / 2),
                                    new Point(yesChild.getX() + yesChild.getWidth() / 2, yesChild.getY()), g2);
                        }
                        if (noChild != null) {
                            drawArrowLine(new Point(e.getX() + e.getWidth(), e.getY() + e.getHeight() / 2),
                                    new Point(noChild.getX() + noChild.getWidth() / 2, noChild.getY()), g2);
                        }
                    }
                }
            }
        }
        if (fromPoint != null) {
            drawArrowLine(fromPoint, toPoint, g2);
        }
    }

    private void drawArrowLine(Point p1, Point p2, Graphics2D g2) {
        g2.setColor(model.getLinesColor());
        g2.drawLine((int) p1.getX(), (int) p1.getY(), (int) p2.getX(), (int) p2.getY());
        double temp = Math.atan2(p1.getX() - p2.getX(), p1.getY() - p2.getY());
        g2.drawLine((int) p2.getX(), (int) p2.getY(),
                (int) (p2.getX() + GSAModel.DEFAULT_ARROW_WIDTH * Math.sin(temp + GSAModel.DEFAULT_ARROW_ANGLE)),
                (int) (p2.getY() + GSAModel.DEFAULT_ARROW_WIDTH * Math.cos(temp + GSAModel.DEFAULT_ARROW_ANGLE)));
        g2.drawLine((int) p2.getX(), (int) p2.getY(),
                (int) (p2.getX() + GSAModel.DEFAULT_ARROW_WIDTH * Math.sin(temp - GSAModel.DEFAULT_ARROW_ANGLE)),
                (int) (p2.getY() + GSAModel.DEFAULT_ARROW_WIDTH * Math.cos(temp - GSAModel.DEFAULT_ARROW_ANGLE)));
    }

    private void drawOperatorNode(OperatorNode node, Graphics2D g2) {
        g2.setColor(node.getColor());
        g2.fillRect(node.getX(), node.getY(), node.getWidth(), node.getHeight());
        g2.setColor(DEFAULT_TEXT_COLOR);
        FontRenderContext context = g2.getFontRenderContext();
        Rectangle2D bounds = DEFAULT_FONT.getStringBounds(node.getText(), context);
        double x = node.getX() + (node.getWidth() - bounds.getWidth()) / 2;
        double y = node.getY() + node.getHeight() - (node.getHeight() - bounds.getHeight());
        g2.drawString(node.getText(), (int) x, (int) y);
        g2.setColor(model.getLinesColor());
        g2.fillRect(node.getX() + (node.getWidth() - GSAModel.DEFAULT_CONNECTORS_SIZE) / 2, node.getY() - GSAModel.DEFAULT_CONNECTORS_SIZE / 2,
                GSAModel.DEFAULT_CONNECTORS_SIZE, GSAModel.DEFAULT_CONNECTORS_SIZE);
        g2.fillRect(node.getX() + (node.getWidth() - GSAModel.DEFAULT_CONNECTORS_SIZE) / 2, node.getY() + node.getHeight() - GSAModel.DEFAULT_CONNECTORS_SIZE / 2,
                GSAModel.DEFAULT_CONNECTORS_SIZE, GSAModel.DEFAULT_CONNECTORS_SIZE);
    }

    private void drawLogicNode(LogicNode node, Graphics2D g2) {
        Polygon shape = new Polygon();
        shape.addPoint(node.getX(), (node.getY() + node.getHeight() / 2));
        shape.addPoint((node.getX() + node.getWidth() / 2), node.getY());
        shape.addPoint((node.getX() + node.getWidth()), (node.getY() + node.getHeight() / 2));
        shape.addPoint((node.getX() + node.getWidth() / 2), (node.getY() + node.getHeight()));
        g2.setColor(node.getColor());
        g2.fill(shape);
        g2.setColor(DEFAULT_TEXT_COLOR);
        FontRenderContext context = g2.getFontRenderContext();
        Rectangle2D bounds = DEFAULT_FONT.getStringBounds(node.getText(), context);
        double x = node.getX() + (node.getWidth() - bounds.getWidth()) / 2;
        double y = node.getY() + node.getHeight() - (node.getHeight() - bounds.getHeight());
        g2.drawString(node.getText(), (int) x, (int) y);
        x = node.getX() + 5;
        y = node.getY() + node.getHeight();
        g2.drawString(LogicNode.YES_TEXT, (int) x, (int) y);
        bounds = DEFAULT_FONT.getStringBounds(LogicNode.NO_TEXT, context);
        x = node.getX() + node.getWidth() - bounds.getWidth() - 5;
        g2.drawString(LogicNode.NO_TEXT, (int) x, (int) y);
        g2.setColor(model.getLinesColor());
        g2.fillRect(node.getX() + (node.getWidth() - GSAModel.DEFAULT_CONNECTORS_SIZE) / 2, node.getY() - GSAModel.DEFAULT_CONNECTORS_SIZE / 2,
                GSAModel.DEFAULT_CONNECTORS_SIZE, GSAModel.DEFAULT_CONNECTORS_SIZE);
        g2.fillRect(node.getX() - GSAModel.DEFAULT_CONNECTORS_SIZE / 2, node.getY() + (node.getHeight() - GSAModel.DEFAULT_CONNECTORS_SIZE) / 2,
                GSAModel.DEFAULT_CONNECTORS_SIZE, GSAModel.DEFAULT_CONNECTORS_SIZE);
        g2.fillRect(node.getX() - GSAModel.DEFAULT_CONNECTORS_SIZE / 2 + node.getWidth(), node.getY() + (node.getHeight() - GSAModel.DEFAULT_CONNECTORS_SIZE) / 2,
                GSAModel.DEFAULT_CONNECTORS_SIZE, GSAModel.DEFAULT_CONNECTORS_SIZE);
    }

    private void drawBeginNode(BeginNode node, Graphics2D g2) {
        g2.setColor(node.getColor());
        g2.fillOval(node.getX(), node.getY(), node.getHeight(), node.getHeight());
        g2.fillOval(node.getX() + node.getWidth() - node.getHeight(), node.getY(), node.getHeight(), node.getHeight());
        g2.fillRect(node.getX() + node.getHeight() / 2, node.getY(), node.getWidth() - node.getHeight(), node.getHeight());
        g2.setColor(DEFAULT_TEXT_COLOR);
        FontRenderContext context = g2.getFontRenderContext();
        Rectangle2D bounds = DEFAULT_FONT.getStringBounds(node.getText(), context);
        double x = node.getX() + (node.getWidth() - bounds.getWidth()) / 2;
        double y = node.getY() + node.getHeight() - (node.getHeight() - bounds.getHeight());
        g2.drawString(node.getText(), (int) x, (int) y);
        g2.setColor(model.getLinesColor());
        g2.fillRect(node.getX() + (node.getWidth() - GSAModel.DEFAULT_CONNECTORS_SIZE) / 2, node.getY() + node.getHeight() - GSAModel.DEFAULT_CONNECTORS_SIZE / 2,
                GSAModel.DEFAULT_CONNECTORS_SIZE, GSAModel.DEFAULT_CONNECTORS_SIZE);
    }

    private void drawEndNode(EndNode node, Graphics2D g2) {
        g2.setColor(node.getColor());
        g2.fillOval(node.getX(), node.getY(), node.getHeight(), node.getHeight());
        g2.fillOval(node.getX() + node.getWidth() - node.getHeight(), node.getY(), node.getHeight(), node.getHeight());
        g2.fillRect(node.getX() + node.getHeight() / 2, node.getY(), node.getWidth() - node.getHeight(), node.getHeight());
        g2.setColor(DEFAULT_TEXT_COLOR);
        FontRenderContext context = g2.getFontRenderContext();
        Rectangle2D bounds = DEFAULT_FONT.getStringBounds(node.getText(), context);
        double x = node.getX() + (node.getWidth() - bounds.getWidth()) / 2;
        double y = node.getY() + node.getHeight() - (node.getHeight() - bounds.getHeight());
        g2.drawString(node.getText(), (int) x, (int) y);
        g2.setColor(model.getLinesColor());
        g2.fillRect(node.getX() + (node.getWidth() - GSAModel.DEFAULT_CONNECTORS_SIZE) / 2, node.getY() - GSAModel.DEFAULT_CONNECTORS_SIZE / 2,
                GSAModel.DEFAULT_CONNECTORS_SIZE, GSAModel.DEFAULT_CONNECTORS_SIZE);
    }

    private class GSAMouseListener implements MouseListener {

        private JFrame frame;

        public GSAMouseListener(JFrame frame) {
            super();
            this.frame = frame;
        }

        public void mouseClicked(MouseEvent e) {
            if ((e.getButton() == MouseEvent.BUTTON1) && (e.getClickCount() == 1)) {
                if (!model.isInNode(e.getX(), e.getY())) {
                    if (model.getActionType() == 1) {
                        try {
                            model.addBeginNode(e.getX(), e.getY(), GSAModel.DEFAULT_NODE_WIDTH, GSAModel.DEFAULT_NODE_HEIGHT);
                            repaint();
                        } catch (IllegalNodeException e1) {
                            JOptionPane.showMessageDialog(frame, "Error! There is already one Begin node.",
                                    "Error", JOptionPane.ERROR_MESSAGE);
                        }
                    } else {
                        if (model.getActionType() == 2) {
                            String signalCountString = JOptionPane.showInputDialog(frame, "Please, enter the number of signals:",
                                    "Input", JOptionPane.INFORMATION_MESSAGE);
                            int signalCount = Integer.valueOf(signalCountString);
                            if (signalCount > 0) {
                                int[] signalNumbers = new int[signalCount];
                                for (int i = 0; i < signalCount; i++) {
                                    String signalNumberString = JOptionPane.showInputDialog(frame, "Please, enter the number of signal:",
                                            "Input", JOptionPane.INFORMATION_MESSAGE);
                                    int signalNumber = Integer.valueOf(signalNumberString);
                                    if (signalNumber > 0) {
                                        signalNumbers[i] = signalNumber;
                                    } else {
                                        JOptionPane.showMessageDialog(frame, "Error! Incorrect number of signal.",
                                                "Error", JOptionPane.ERROR_MESSAGE);
                                    }
                                }
                                model.addOperatorNode(e.getX(), e.getY(), GSAModel.DEFAULT_NODE_WIDTH, GSAModel.DEFAULT_NODE_HEIGHT, signalNumbers);
                                repaint();
                            } else {
                                JOptionPane.showMessageDialog(frame, "Error! The node must contain at least one signal.",
                                        "Error", JOptionPane.ERROR_MESSAGE);
                            }
                        } else {
                            if (model.getActionType() == 3) {
                                String signalNumberString = JOptionPane.showInputDialog(frame, "Please, enter the number of signal:",
                                        "Input", JOptionPane.INFORMATION_MESSAGE);
                                int signalNumber = Integer.valueOf(signalNumberString);
                                if (signalNumber > 0) {
                                    model.addLogicNode(e.getX(), e.getY(), GSAModel.DEFAULT_NODE_WIDTH, GSAModel.DEFAULT_NODE_HEIGHT, signalNumber);
                                    repaint();
                                } else {
                                    JOptionPane.showMessageDialog(frame, "Error! Incorrect number of signal.",
                                            "Error", JOptionPane.ERROR_MESSAGE);
                                }
                            } else {
                                if (model.getActionType() == 4) {
                                    try {
                                        model.addEndNode(e.getX(), e.getY(), GSAModel.DEFAULT_NODE_WIDTH, GSAModel.DEFAULT_NODE_HEIGHT);
                                        repaint();
                                    } catch (IllegalNodeException e1) {
                                        JOptionPane.showMessageDialog(frame, "Error! There is already one End node.",
                                                "Error", JOptionPane.ERROR_MESSAGE);
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if (model.getActionType() == 5) {
                        int result = JOptionPane.showConfirmDialog(frame, "Are you sure to delete this node?",
                                "Confirm", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                        if (result == JOptionPane.YES_OPTION) {
                            model.removeNode(model.getInNode(e.getX(), e.getY()));
                            repaint();
                        }
                    }
                }
                if (model.getActionType() == 5) {
                    Node node = model.getNodeInEntrance(e.getX(), e.getY());
                    if (node != null) {
                        int result = JOptionPane.showConfirmDialog(frame, "Are you sure to delete all these connections?",
                                "Confirm", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                        if (result == JOptionPane.YES_OPTION) {
                            for (Node n : node.getParents()) {
                                if (n.getClass().getName().contains("BeginNode")) {
                                    BeginNode bNode = (BeginNode) n;
                                    bNode.removeChildNode();
                                }
                                else {
                                    if (n.getClass().getName().contains("OperatorNode")) {
                                        OperatorNode oNode = (OperatorNode) n;
                                        oNode.removeChildNode();
                                    }
                                    else {
                                        if (n.getClass().getName().contains("LogicNode")) {
                                            LogicNode lNode = (LogicNode) n;
                                            if (lNode.getChildren().getFirst() == node) {
                                                lNode.removeYesChildNode();
                                            }
                                            else {
                                                lNode.removeNoChildNode();
                                            }
                                        }
                                    }
                                }
                            }
                            if (node.getClass().getName().contains("OperatorNode")) {
                                OperatorNode oNode = (OperatorNode) node;
                                oNode.removeParentNodes();
                            }
                            else {
                                if (node.getClass().getName().contains("LogicNode")) {
                                    LogicNode lNode = (LogicNode) node;
                                    lNode.removeParentNodes();
                                }
                                else {
                                    if (node.getClass().getName().contains("EndNode")) {
                                        EndNode eNode = (EndNode) node;
                                        eNode.removeParentNodes();
                                    }
                                }
                            }
                            repaint();
                        }
                    }
                    else {
                        node = model.getNotLogicNodeInExit(e.getX(), e.getY());
                        if (node != null) {
                            int result = JOptionPane.showConfirmDialog(frame, "Are you sure to delete this connection?",
                                "Confirm", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                            if (result == JOptionPane.YES_OPTION) {
                                Node child = node.getChildren().getFirst();
                                if (child.getClass().getName().contains("OperatorNode")) {
                                    OperatorNode oNode = (OperatorNode) child;
                                    oNode.removeParentNode(node);
                                }
                                else {
                                    if (child.getClass().getName().contains("LogicNode")) {
                                        LogicNode lNode = (LogicNode) child;
                                        lNode.removeParentNode(node);
                                    }
                                    else {
                                        if (child.getClass().getName().contains("EndNode")) {
                                            EndNode eNode = (EndNode) child;
                                            eNode.removeParentNode(node);
                                        }
                                    }
                                }
                                if (node.getClass().getName().contains("BeginNode")) {
                                    BeginNode bNode = (BeginNode) node;
                                    bNode.removeChildNode();
                                }
                                else {
                                    if (node.getClass().getName().contains("OperatorNode")) {
                                        OperatorNode eNode = (OperatorNode) node;
                                        eNode.removeChildNode();
                                    }
                                }
                                repaint();
                            }
                        }
                        else {
                            node = model.getLogicNodeInExit(e.getX(), e.getY());
                            if (node != null) {
                                int result = JOptionPane.showConfirmDialog(frame, "Are you sure to delete this connection?",
                                    "Confirm", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                                if (result == JOptionPane.YES_OPTION) {
                                    LogicNode lNode = (LogicNode) node;
                                    Node child;
                                    if (model.isYesNoExit()) {
                                        child = lNode.getChildren().getFirst();
                                    }
                                    else {
                                        child = lNode.getChildren().getLast();
                                    }
                                    if (child.getClass().getName().contains("OperatorNode")) {
                                        OperatorNode oChild = (OperatorNode) child;
                                        oChild.removeParentNode(node);
                                    }
                                    else {
                                        if (child.getClass().getName().contains("LogicNode")) {
                                            LogicNode lChild = (LogicNode) child;
                                            lChild.removeParentNode(node);
                                        }
                                        else {
                                            if (child.getClass().getName().contains("EndNode")) {
                                                EndNode eChild = (EndNode) child;
                                                eChild.removeParentNode(node);
                                            }
                                        }
                                    }
                                    if (model.isYesNoExit()) {
                                        lNode.removeYesChildNode();
                                    }
                                    else {
                                        lNode.removeNoChildNode();
                                    }
                                }
                                repaint();
                            }
                        }
                    }
                }
            }
            else {
                if ((e.getButton() == MouseEvent.BUTTON1) && (e.getClickCount() == 2) && (model.getActionType() == 0)) {
                    if (model.isInNode(e.getX(), e.getY())) {
                        Node node = model.getInNode(e.getX(), e.getY());
                        if (node.getClass().getName().contains("OperatorNode")) {
                            OperatorNode oNode = (OperatorNode) node;
                            int[] oldSignals = oNode.getSignals();
                            String signalCountString = JOptionPane.showInputDialog(frame, "Please, enter the number of signals:",
                                    String.valueOf(oldSignals.length));
                            int signalCount = Integer.valueOf(signalCountString);
                            if (signalCount > 0) {
                                int[] newSignals = new int[signalCount];
                                for (int i = 0; i < signalCount; i++) {
                                    int initialValue = 1;
                                    if (i < oldSignals.length) {
                                        initialValue = oldSignals[i];    
                                    }
                                    String signalNumberString = JOptionPane.showInputDialog(frame, "Please, enter the number of signal:",
                                            String.valueOf(initialValue));
                                    int signalNumber = Integer.valueOf(signalNumberString);
                                    if (signalNumber > 0) {
                                        newSignals[i] = signalNumber;
                                    } else {
                                        if (i < oldSignals.length) {
                                            newSignals[i] = oldSignals[i];
                                        }
                                        else {
                                            newSignals[i] = 1;
                                        }
                                        JOptionPane.showMessageDialog(frame, "Error! Incorrect number of signal.",
                                                "Error", JOptionPane.ERROR_MESSAGE);
                                    }
                                }
                                oNode.setSignals(newSignals);
                                repaint();
                            } else {
                                JOptionPane.showMessageDialog(frame, "Error! The node must contain at least one signal.",
                                        "Error", JOptionPane.ERROR_MESSAGE);
                            }
                        }
                        else {
                            if (node.getClass().getName().contains("LogicNode")) {
                                LogicNode lNode = (LogicNode) node;
                                String signalNumberString = JOptionPane.showInputDialog(frame, "Please, enter the number of signal:",
                                         String.valueOf(lNode.getSignals()[0]));
                                int signalNumber = Integer.valueOf(signalNumberString);
                                if (signalNumber > 0) {
                                    lNode.setSignal(signalNumber);
                                    repaint();
                                } else {
                                    JOptionPane.showMessageDialog(frame, "Error! Incorrect number of signal.",
                                            "Error", JOptionPane.ERROR_MESSAGE);
                                }
                            }
                        }
                    }
                }
            }
        }

        public void mousePressed(MouseEvent e) {
            if ((e.getButton() == MouseEvent.BUTTON1) && (model.getActionType() == 0) && (model.isInNode(e.getX(), e.getY()))) {
                dragNode = model.getInNode(e.getX(), e.getY());
                dragX = e.getX();
                dragY = e.getY();
            }
            else {
                if ((e.getButton() == MouseEvent.BUTTON1) && (model.getActionType() == 6)) {
                    Node node = model.getNotLogicNodeInExit(e.getX(), e.getY());
                    if ((node != null) && (node.getChildren().getFirst() == null)) {
                        parentNodeToConnect = node;
                        isParentNodeLogic = false;
                        fromPoint = new Point(e.getX(), e.getY());
                    }
                    else {
                        node = model.getLogicNodeInExit(e.getX(), e.getY());
                        if ((node != null) && (((model.isYesNoExit()) && (node.getChildren().getFirst() == null)) || ((!model.isYesNoExit()) && (node.getChildren().getLast() == null)))) {
                            parentNodeToConnect = node;
                            isParentNodeLogic = true;
                            fromPoint = new Point(e.getX(), e.getY());
                        }
                    }
                }
            }
        }

        public void mouseReleased(MouseEvent e) {
            if ((dragNode != null) && (model.getActionType() == 0)) {
                dragNode = null;
            }
            else {
                if ((parentNodeToConnect != null) && (model.getActionType() == 6)) {
                    Node node = model.getNodeInEntrance(e.getX(), e.getY());
                    if (node != null) {
                        if (node.getClass().getName().contains("OperatorNode")) {
                            OperatorNode oNode = (OperatorNode) node;
                            oNode.addParentNode(parentNodeToConnect);
                        }
                        else {
                            if (node.getClass().getName().contains("LogicNode")) {
                                LogicNode lNode = (LogicNode) node;
                                lNode.addParentNode(parentNodeToConnect);
                            }
                            else {
                                if (node.getClass().getName().contains("EndNode")) {
                                    EndNode eNode = (EndNode) node;
                                    eNode.addParentNode(parentNodeToConnect);
                                }
                            }
                        }
                        if (isParentNodeLogic) {
                            LogicNode lNode = (LogicNode) parentNodeToConnect;
                            if (model.isYesNoExit()) {
                                lNode.setYesChildNode(node);
                            }
                            else {
                                lNode.setNoChildNode(node);
                            }
                        }
                        else {
                            if (parentNodeToConnect.getClass().getName().contains("BeginNode")) {
                                BeginNode bNode = (BeginNode) parentNodeToConnect;
                                bNode.setChildNode(node);
                            }
                            else {
                                if (parentNodeToConnect.getClass().getName().contains("OperatorNode")) {
                                    OperatorNode oNode = (OperatorNode) parentNodeToConnect;
                                    oNode.setChildNode(node);
                                }
                            }
                        }
                    }
                }
                parentNodeToConnect = null;
                isParentNodeLogic = false;
                fromPoint = null;
                toPoint = null;
                repaint();
            }
        }

        public void mouseEntered(MouseEvent e) {}

        public void mouseExited(MouseEvent e) {}

    }

    private class GSAMouseMotionListener extends MouseMotionAdapter {

        @Override
        public void mouseDragged(MouseEvent e) {
            if ((dragNode != null) && (model.getActionType() == 0)) {
                dragNode.setX(dragNode.getX() + (e.getX() - dragX));
                dragNode.setY(dragNode.getY() + (e.getY() - dragY));
                dragX = e.getX();
                dragY = e.getY();
                repaint();
            }
            else {
                if ((parentNodeToConnect != null) && (model.getActionType() == 6)) {
                    toPoint = new Point(e.getX(), e.getY());
                    repaint();
                }
            }
        }
        
    }

}
