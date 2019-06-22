package kursach;

import java.util.ArrayList;
import kursach.Node;

public class GraphModel {
        private ArrayList<Node> elements;
        private ArrayList<Line> connections;

        public GraphModel() {
                elements = new ArrayList<Node>();
                connections = new ArrayList<Line>();
        }

        public void addNode(Node n) {
                elements.add(n);
        }

        public Node getNode(int i) {
                return elements.get(i);
        }

        public int getNodeCount() {
                return elements.size();
        }

        public Node getNode(int x, int y) {
                for (Node n : elements) {
                        if (n.contains(x-n.getX(), y-n.getY())) {
                                return n;
                        }
                }
                return null;
        }

        public void addLine(Line l) {
                connections.add(l);
        }

        public Line getLine(int i) {
                return connections.get(i);
        }

        public int getLineCount() {
                return connections.size();
        }

        public Line getLine(int x, int y) {
                for (Line l : connections) {
                        if (l.contains(x-l.getX(), y-l.getY())) {
                                return l;
                        }
                }
                return null;
        }

}
