package gsa;

import java.awt.*;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 07.09.2010
 * Time: 14:00:30
 * To change this template use File | Settings | File Templates.
 */
public class GSAModel {

    public static int DEFAULT_NODE_WIDTH = 100;
    public static int DEFAULT_NODE_HEIGHT = 30;
    public static int DEFAULT_ARROW_WIDTH = 20;
    public static double DEFAULT_ARROW_ANGLE = 0.5;
    public static int DEFAULT_CONNECTORS_SIZE = 6;
    
    public static Color DEFAULT_ERROR_NODES_COLOR = Color.MAGENTA;
    public static Color DEFAULT_ERROR_LINES_COLOR = Color.RED;

    private static Color DEFAULT_BACKGROUND_COLOR = Color.WHITE;
    private static Color DEFAULT_NET_COLOR = Color.LIGHT_GRAY;
    private static Color DEFAULT_NODES_COLOR = Color.CYAN;
    private static Color DEFAULT_LINES_COLOR = Color.BLACK;

    private static int DEFAULT_NET_INTERVAL = 50;

    private ArrayList<Node> nodes;
    private ArrayList<Node> nodesInInfiniteCycles;
    private boolean hasBeginNode;
    private boolean hasEndNode;
    private Color backgroundColor;
    private Color netColor;
    private Color nodesColor;
    private Color linesColor;
    private int netInterval;
    private boolean isChanged;
    private int actionType;
    private boolean yesNoExit;

    public GSAModel() {
        nodes = new ArrayList<Node>();
        nodesInInfiniteCycles = new ArrayList<Node>();
        hasBeginNode = false;
        hasEndNode = false;
        backgroundColor = DEFAULT_BACKGROUND_COLOR;
        netColor = DEFAULT_NET_COLOR;
        nodesColor = DEFAULT_NODES_COLOR;
        netInterval = DEFAULT_NET_INTERVAL;
        linesColor = DEFAULT_LINES_COLOR;
        isChanged = false;
        actionType = 0;
    }

    public ArrayList<Node> getNodesInInfiniteCycles() {
        return nodesInInfiniteCycles;
    }

    public void setNodesInInfiniteCycles(ArrayList<Integer> nodesInInfiniteCycles) {
        for (int i = 0; i < nodesInInfiniteCycles.size(); i++) {
            this.nodesInInfiniteCycles.add(nodes.get(nodesInInfiniteCycles.get(i)));
        }
    }

    public void removeNodesInInfiniteCycles() {
        nodesInInfiniteCycles = new ArrayList<Node>();
    }

    public Color getLinesColor() {
        return linesColor;
    }

    public void setLinesColor(Color linesColor) {
        this.linesColor = linesColor;
    }

    public int getNetInterval() {
        return netInterval;
    }

    public void setNetInterval(int netInterval) {
        this.netInterval = netInterval;
    }

    public int getActionType() {
        return actionType;
    }

    public void setActionType(int actionType) {
        this.actionType = actionType;
    }

    public boolean isChanged() {
        return isChanged;
    }

    public void setChanged(boolean changed) {
        isChanged = changed;
    }

    public void addBeginNode(int x, int y, int width, int height) throws IllegalNodeException {
        if (!hasBeginNode) {
            nodes.add(new BeginNode(x, y, width, height, nodesColor));
            hasBeginNode = true;
        }
        else {
            throw new IllegalNodeException(true);
        }
    }

    public void addEndNode(int x, int y, int width, int height) throws IllegalNodeException {
        if (!hasEndNode) {
            nodes.add(new EndNode(x, y, width, height, nodesColor));
            hasEndNode = true;
        }
        else {
            throw new IllegalNodeException(false);    
        }
    }

    public void addLogicNode(int x, int y, int width, int height, int signalNumber) {
        nodes.add(new LogicNode(x, y, width, height, nodesColor, signalNumber));
    }

    public void addOperatorNode(int x, int y, int width, int height, int[] signalNumbers) {
        nodes.add(new OperatorNode(x, y, width, height, nodesColor, signalNumbers));
    }

    public void removeNode(Node node) {
        if (node.getClass().getName().contains("BeginNode")) {
            hasBeginNode = false;
        }
        else {
            if (node.getClass().getName().contains("EndNode")) {
                hasEndNode = false;
            }
        }
        for (Node e : nodes) {
            LinkedList<Node> parents = e.getParents();
            if (parents != null) {
                for (int i = 0; i < parents.size(); i++) {
                    if (parents.get(i) == node) {
                        parents.remove(i);
                    }
                }
            }
            LinkedList<Node> children = e.getChildren();
            if (children != null) {
                for (int i = 0; i < children.size(); i++) {
                    if (children.get(i) == node) {
                        if (e.getClass().getName().contains("BeginNode")) {
                            BeginNode bNode = (BeginNode) e;
                            bNode.removeChildNode();
                        }
                        else {
                            if (e.getClass().getName().contains("OperatorNode")) {
                                OperatorNode oNode = (OperatorNode) e;
                                oNode.removeChildNode();
                            }
                            else {
                                if (e.getClass().getName().contains("LogicNode")) {
                                    LogicNode lNode = (LogicNode) e;
                                    if (i == 0) {
                                        lNode.removeYesChildNode();
                                    }
                                    else {
                                        lNode.removeNoChildNode();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        nodes.remove(node);
    }

    public boolean isInNode(int x, int y) {
        boolean isIn = false;
        int i = 0;
        while ((i < nodes.size()) && (!isIn)) {
            int nodex1 = nodes.get(i).getX();
            int nodex2 = nodes.get(i).getX() + nodes.get(i).getWidth();
            int nodey1 = nodes.get(i).getY();
            int nodey2 = nodes.get(i).getY() + nodes.get(i).getHeight();
            if ((x >= nodex1) && (x <= nodex2) && (y >= nodey1) && (y <= nodey2)) {
                isIn = true;
            }
            i++;
        }
        return isIn;
    }

    public Node getInNode(int x, int y) {
        Node inNode = null;
        int i = 0;
        while ((i < nodes.size()) && (inNode == null)) {
            int nodex1 = nodes.get(i).getX();
            int nodex2 = nodes.get(i).getX() + nodes.get(i).getWidth();
            int nodey1 = nodes.get(i).getY();
            int nodey2 = nodes.get(i).getY() + nodes.get(i).getHeight();
            if ((x >= nodex1) && (x <= nodex2) && (y >= nodey1) && (y <= nodey2)) {
                inNode = nodes.get(i);
            }
            i++;
        }
        return inNode;
    }

    public Node getNodeInEntrance(int x, int y) {
        for (Node e : nodes) {
            if (!e.getClass().getName().contains("BeginNode")) {
                Rectangle connector = new Rectangle(e.getX() + (e.getWidth() - DEFAULT_CONNECTORS_SIZE) / 2,
                        e.getY() - DEFAULT_CONNECTORS_SIZE / 2, DEFAULT_CONNECTORS_SIZE, DEFAULT_CONNECTORS_SIZE);
                if (connector.contains(x, y)) {
                    return e;
                }
            }
        }
        return null;
    }

    public Node getNotLogicNodeInExit(int x, int y) {
        for (Node e : nodes) {
            if ((!e.getClass().getName().contains("EndNode")) && (!e.getClass().getName().contains("LogicNode"))) {
                Rectangle connector = new Rectangle(e.getX() + (e.getWidth() - DEFAULT_CONNECTORS_SIZE) / 2,
                        e.getY() + e.getHeight() - DEFAULT_CONNECTORS_SIZE / 2, DEFAULT_CONNECTORS_SIZE, DEFAULT_CONNECTORS_SIZE);
                if (connector.contains(x, y)) {
                    return e;
                }
            }
        }
        return null;
    }

    public Node getLogicNodeInExit(int x, int y) {
        for (Node e : nodes) {
            if (e.getClass().getName().contains("LogicNode")) {
                Rectangle yesConnector = new Rectangle(e.getX()- DEFAULT_CONNECTORS_SIZE / 2,
                        e.getY() + (e.getHeight() - DEFAULT_CONNECTORS_SIZE) / 2, DEFAULT_CONNECTORS_SIZE, DEFAULT_CONNECTORS_SIZE);
                if (yesConnector.contains(x, y)) {
                    yesNoExit = true;
                    return e;
                }
                Rectangle noConnector = new Rectangle(e.getX() + e.getWidth() - DEFAULT_CONNECTORS_SIZE / 2,
                        e.getY() + (e.getHeight() - DEFAULT_CONNECTORS_SIZE) / 2, DEFAULT_CONNECTORS_SIZE, DEFAULT_CONNECTORS_SIZE);
                if (noConnector.contains(x, y)) {
                    yesNoExit = false;
                    return e;
                }
            }
        }
        return null;
    }

    public boolean isYesNoExit() {
        return yesNoExit;
    }

    public Color getNodesColor() {
        return nodesColor;
    }

    public Color getNetColor() {
        return netColor;
    }

    public Color getBackgroundColor() {
        return backgroundColor;
    }

    public ArrayList<Node> getNodes() {
        return nodes;
    }

    public int[][] getConnectionMatrix() {
        int[][] matrix = new int[nodes.size()][];
        for (int i = 0; i < matrix.length; i++) {
            matrix[i] = new int[nodes.size()];
            for (int j = 0; j < matrix[i].length; j++) {
                matrix[i][j] = 0;
            }
        }
        for (int i = 0; i < nodes.size(); i++) {
            LinkedList<Node> children = nodes.get(i).getChildren();
            if (children != null) {
                for (int j = 0; j < children.size(); j++) {
                    int k = 0;
                    boolean found = false;
                    while ((k < nodes.size()) && (!found)) {
                        if (children.get(j) == nodes.get(k)) {
                            matrix[i][k] = j + 1;
                            found = true;
                        }
                        k++;
                    }
                }
            }
        }
        return matrix;
    }

    public int[] getNodesType() {
        int[] matrix = new int[nodes.size()];
        for (int i = 0; i < nodes.size(); i++) {
            if (nodes.get(i).getClass().getName().contains("BeginNode")) {
                matrix[i] = 0;
            }
            else {
                if (nodes.get(i).getClass().getName().contains("OperatorNode")) {
                    matrix[i] = 1;
                }
                else {
                    if (nodes.get(i).getClass().getName().contains("LogicNode")) {
                        matrix[i] = 2;
                    }
                    else {
                        if (nodes.get(i).getClass().getName().contains("EndNode")) {
                            matrix[i] = 3;
                        }
                    }
                }
            }
        }
        return matrix;
    }

    public int[][] getBoundsMatrix() {
        int[][] matrix = new int[nodes.size()][];
        for (int i = 0; i < matrix.length; i++) {
            matrix[i] = new int[4];
        }
        for (int i = 0; i < nodes.size(); i++) {
            matrix[i][0] = nodes.get(i).getX();
            matrix[i][1] = nodes.get(i).getY();
            matrix[i][2] = nodes.get(i).getWidth();
            matrix[i][3] = nodes.get(i).getHeight();
        }
        return matrix;
    }

    public int[][] getSignalMatrix() {
        int[][] matrix = new int[nodes.size()][];
        for (int i = 0; i < nodes.size(); i++) {
            matrix[i] = nodes.get(i).getSignals();
        }
        return matrix;
    }

    public void setGSA(int[] nodesType, int[][] connectivityMatrix, int[][] signalMatrix,
                       int[][] boundsMatrix) throws IllegalNodeException {
        hasBeginNode = false;
        hasEndNode = false;
        nodes = new ArrayList<Node>();
        for (int i = 0; i < nodesType.length; i++) {
            if (nodesType[i] == 0) {
                addBeginNode(boundsMatrix[i][0], boundsMatrix[i][1], boundsMatrix[i][2],
                            boundsMatrix[i][3]);
            }
            else {
                if (nodesType[i] == 1) {
                    addOperatorNode(boundsMatrix[i][0], boundsMatrix[i][1], boundsMatrix[i][2],
                                boundsMatrix[i][3], signalMatrix[i]);
                }
                else {
                    if (nodesType[i] == 2) {
                        addLogicNode(boundsMatrix[i][0], boundsMatrix[i][1], boundsMatrix[i][2],
                                    boundsMatrix[i][3], signalMatrix[i][0]);
                    }
                    else {
                        addEndNode(boundsMatrix[i][0], boundsMatrix[i][1], boundsMatrix[i][2],
                                    boundsMatrix[i][3]);
                    }
                }
            }
        }
        for (int i = 0; i < nodes.size(); i++) {
            if (nodes.get(i).getClass().getName().contains("BeginNode")) {
                int j = 0;
                boolean found = false;
                BeginNode node = (BeginNode) nodes.get(i);
                while ((j < connectivityMatrix[i].length) && (!found)) {
                    if (connectivityMatrix[i][j] == 1) {
                        node.setChildNode(nodes.get(j));
                        found = true;
                    }
                    j++;
                }
            }
            else {
                if (nodes.get(i).getClass().getName().contains("OperatorNode")) {
                    int j = 0;
                    boolean foundChild = false;
                    OperatorNode node = (OperatorNode) nodes.get(i);
                    while ((j < connectivityMatrix[i].length) && (!foundChild)) {
                        if (connectivityMatrix[j][i] > 0) {
                            node.addParentNode(nodes.get(j));
                        }
                        if (connectivityMatrix[i][j] == 1) {
                            node.setChildNode(nodes.get(j));
                            foundChild = true;
                        }
                        j++;
                    }
                }
                else {
                    if (nodes.get(i).getClass().getName().contains("LogicNode")) {
                        int j = 0;
                        int foundChildren = 0;
                        LogicNode node = (LogicNode) nodes.get(i);
                        while ((j < connectivityMatrix[i].length) && (foundChildren < 2)) {
                            if (connectivityMatrix[j][i] > 0) {
                                node.addParentNode(nodes.get(j));
                            }
                            if (connectivityMatrix[i][j] == 1) {
                                node.setYesChildNode(nodes.get(j));
                                foundChildren++;
                            }
                            if (connectivityMatrix[i][j] == 2) {
                                node.setNoChildNode(nodes.get(j));
                                foundChildren++;
                            }
                            j++;
                        }
                    }
                    else {
                        EndNode node = (EndNode) nodes.get(i);
                        for (int j = 0; j < connectivityMatrix[i].length; j++) {
                            if (connectivityMatrix[i][j] > 0) {
                                node.addParentNode(nodes.get(j));
                            }
                        }
                    }
                }
            }
        }
    }

}
