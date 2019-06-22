package gsa;

import java.awt.*;
import java.util.LinkedList;

class BeginNode extends Node {

    private static String TEXT = "Begin";

    private Node child;

    public BeginNode(int x, int y, int width, int height, Color color) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.color = color;
    }

    @Override
    public LinkedList<Node> getParents() {
        return null;
    }

    @Override
    public LinkedList<Node> getChildren() {
        LinkedList<Node> list = new LinkedList<Node>();
        list.add(child);
        return list;
    }

    @Override
    public String getText() {
        return TEXT;
    }

    @Override
    public int[] getSignals() {
        int[] result = new int[1];
        result[0] = 0;
        return result;
    }

    public void setChildNode(Node node) {
        child = node;
    }

    public void removeChildNode() {
        child = null;
    }

}
