package gsa;

import java.awt.*;
import java.util.LinkedList;
import java.util.ListIterator;

class OperatorNode extends Node {

    static String TEXT = "Y";

    private int[] numbers;
    private LinkedList<Node> parents;
    private Node child;

    public OperatorNode(int x, int y, int width, int height, Color color, int[] numbers) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.color = color;
        this.numbers = numbers;
        parents = new LinkedList<Node>();
    }

    public void addParentNode(Node node) {
        parents.add(node);
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

    public void removeParentNodes() {
        parents = new LinkedList<Node>();
    }

    public void setChildNode(Node node) {
        child = node;
    }

    public void removeChildNode() {
        child = null;
    }

    @Override
    public LinkedList<Node> getParents() {
        return parents;
    }

    @Override
    public LinkedList<Node> getChildren() {
        LinkedList<Node> list = new LinkedList<Node>();
        list.add(child);
        return list;
    }

    @Override
    public String getText() {
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < numbers.length; i++) {
            builder.append(TEXT);
            builder.append(String.valueOf(numbers[i]));
        }
        return builder.toString();
    }

    @Override
    public int[] getSignals() {
        return numbers;
    }

    public void setSignals(int[] numbers) {
        this.numbers = numbers;
    }
}
