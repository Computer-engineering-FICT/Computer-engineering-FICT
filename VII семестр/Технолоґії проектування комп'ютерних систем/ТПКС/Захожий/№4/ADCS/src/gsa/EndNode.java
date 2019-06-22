package gsa;

import java.awt.*;
import java.util.LinkedList;
import java.util.ListIterator;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 07.09.2010
 * Time: 14:22:44
 * To change this template use File | Settings | File Templates.
 */
class EndNode extends Node {

    private static String TEXT = "End";

    private LinkedList<Node> parents; 

    public EndNode(int x, int y, int width, int height, Color color) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.color = color;
        parents = new LinkedList<Node>();
    }

    @Override
    public LinkedList<Node> getParents() {
        return parents;
    }

    @Override
    public LinkedList<Node> getChildren() {
        return null;
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

}
