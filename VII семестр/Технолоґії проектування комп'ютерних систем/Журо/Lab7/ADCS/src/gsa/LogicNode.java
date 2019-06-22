package gsa;

import java.awt.*;
import java.util.LinkedList;
import java.util.ListIterator;

class LogicNode extends Node {

    public static String YES_TEXT = "1";
    public static String NO_TEXT = "0";

    private static String TEXT = "X";

    private int number;
    private LinkedList<Node> parents;
    private Node yesChild;
    private Node noChild;

    public LogicNode(int x, int y, int width, int height, Color color, int number) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.color = color;
        this.number = number;
        parents = new LinkedList<Node>();
    }

    public void addParentNode(Node node) {
        parents.add(node);
    }

    public void removeParentNodes() {
        parents = new LinkedList<Node>();
    }

    public void removeParentNode(Node node) {
        ListIterator<Node> iterator = parents.listIterator();
        boolean found = false;
        while ((iterator.hasNext()) && (!found)) {
            if (iterator.next() == node) {
                iterator.remove();
            }
        }
    }

    public void setYesChildNode(Node node) {
        yesChild = node;
    }

    public void removeYesChildNode() {
        yesChild = null;
    }

    public void setNoChildNode(Node node) {
        noChild = node;
    }

    public void removeNoChildNode() {
        noChild = null;
    }

    @Override
    public LinkedList<Node> getParents() {
        return parents;
    }

    @Override
    public LinkedList<Node> getChildren() {
        LinkedList<Node> list = new LinkedList<Node>();
        list.add(yesChild);
        list.add(noChild);
        return list;
    }

    @Override
    public String getText() {
        return (TEXT + String.valueOf(number));
    }

    @Override
    public int[] getSignals() {
        int[] result = new int[1];
        result[0] = number;
        return result;
    }

    public void setSignal(int number) {
        this.number = number;
    }

}
