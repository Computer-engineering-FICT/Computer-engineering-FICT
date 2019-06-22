package graph;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 26.12.10
 * Time: 16:50
 * To change this template use File | Settings | File Templates.
 */
public class GraphPanel extends JPanel implements Serializable {

    private static Color PANEL_COLOR = Color.WHITE;

    private ArrayList<Vertex> vertexes;
    private ArrayList<Line> lines;

    private boolean modified;

    private byte action;
    // 0 - Moving vertexes
    // 1 - Adding vertex
    // 2 - Adding connection
    // 3 - Deleting vertex

    private Vertex draggedVertex;
    private Point tempPoint;
    private Line tempLine;
    private Vertex tempVertex;

    public GraphPanel() {
        super();
        addMouseListener(new GraphMouseListener(this));
        addMouseMotionListener(new GraphMouseMotionListener(this));
        setBackground(PANEL_COLOR);
        lines = new ArrayList<Line>();
        vertexes = new ArrayList<Vertex>();
        modified = false;
        action = 0;
        draggedVertex = null;
        tempPoint = null;
        tempLine = null;
        tempVertex = null;
    }

    public void setAction(byte action) {
        this.action = action;
    }

    public boolean isModified() {
        return modified;
    }

    public void setModified(boolean modified) {
        this.modified = modified;
    }

    public String[] getVertexesNameVector() {
        String[] vector = new String[vertexes.size()];
        for (int i = 0; i < vertexes.size(); i++) {
            vector[i] = new String(vertexes.get(i).getName());
        }
        return vector;
    }

    public int[] getVertexesWeightVector() {
        int[] vector = new int[vertexes.size()];
        for (int i = 0; i < vertexes.size(); i++) {
            vector[i] = vertexes.get(i).getWeight();
        }
        return vector;
    }

    public int[][] getConnectionMatrix() {
        int[][] matrix = new int[vertexes.size()][];
        for (int i = 0; i < matrix.length; i++) {
            matrix[i] = new int[vertexes.size()];
            for (int j = 0; j < matrix[i].length; j++) {
                matrix[i][j] = 0;
            }
        }
        for (int i = 0; i < vertexes.size(); i++) {
            ArrayList<Vertex> nextVertexes = vertexes.get(i).getNextVertexes();
            for (int j = 0; j < nextVertexes.size(); j++) {
                int k = 0;
                boolean found = false;
                while ((k < vertexes.size()) && (!found)) {
                    if (vertexes.get(k) == nextVertexes.get(j)) {
                        found = true;
                    }
                    k++;
                }
                if (found) {
                    k--;
                    boolean lineFound = false;
                    int lineWeight = 0;
                    int l = 0;
                    while ((!lineFound) && (l < lines.size())) {
                        if ((lines.get(l).getP1().getX() == vertexes.get(i).getCenter().getX()) &&
                                (lines.get(l).getP1().getY() == vertexes.get(i).getCenter().getY()) &&
                                (lines.get(l).getP2().getX() == vertexes.get(k).getCenter().getX()) &&
                                (lines.get(l).getP2().getY() == vertexes.get(k).getCenter().getY())) {
                            lineFound = true;
                            lineWeight = lines.get(l).getWeight();
                        }
                        l++;
                    }
                    if (lineFound) {
                        matrix[i][k] = lineWeight;
                    }
                }
            }
        }
        return matrix;
    }

    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2 = (Graphics2D) g;
        if (!lines.isEmpty()) {
            for (Line l : lines) {
                l.draw(g2);
            }
        }
        if (tempLine != null) {
            tempLine.draw(g2);
        }
        if (!vertexes.isEmpty()) {
            for (Vertex v : vertexes) {
                v.draw(g2);
            }
        }
    }

    private class GraphMouseListener extends MouseAdapter implements Serializable {

        private GraphPanel panel;

        private GraphMouseListener(GraphPanel panel) {
            this.panel = panel;
        }

        @Override
        public void mousePressed(MouseEvent e) {
            switch (action) {
                case 0: {
                    int i = 0;
                    while ((i < vertexes.size()) && (draggedVertex == null)) {
                        if (vertexes.get(i).contains(e.getPoint())) {
                            draggedVertex = vertexes.get(i);
                        }
                        i++;
                    }
                    break;
                }
                case 2: {
                    int i = 0;
                    while ((i < vertexes.size()) && (tempPoint == null)) {
                        if (vertexes.get(i).contains(e.getPoint())) {
                            tempPoint = vertexes.get(i).getCenter();
                            tempVertex = vertexes.get(i);
                        }
                        i++;
                    }
                    break;
                }
            }
        }

        @Override
        public void mouseReleased(MouseEvent e) {
            switch (action) {
                case 0: {
                    draggedVertex = null;
                    break;
                }
                case 2: {
                    int i = 0;
                    boolean found = false;
                    while ((i < vertexes.size()) && (!found)) {
                        if (vertexes.get(i).contains(e.getPoint())) {
                            found = true;
                        }
                        i++;
                    }
                    if (found) {
                        i--;
                        String weightString = JOptionPane.showInputDialog(panel, "Введите вес ребра:");
                        int weight = Integer.valueOf(weightString);
                        if (weight > 0) {
                            lines.add(new Line(tempPoint, vertexes.get(i).getCenter(), weight));
                            try {
                                tempVertex.addNextVertex(vertexes.get(i));
                                modified = true;
                            } catch (ConnectionAlreadyExistException e1) {
                                JOptionPane.showMessageDialog(panel, e1.getMessage(), "Ошибка",
                                        JOptionPane.ERROR_MESSAGE);
                            }
                        }
                        else {
                            JOptionPane.showMessageDialog(panel, "Некорректный вес ребра!", "Ошибка",
                                    JOptionPane.ERROR_MESSAGE);
                        }
                    }
                    tempPoint = null;
                    tempLine = null;
                    tempVertex = null;
                    repaint();
                    break;
                }
            }
        }

        @Override
        public void mouseClicked(MouseEvent e) {
            if (e.getButton() == MouseEvent.BUTTON1) {
                switch (action) {
                    case 1: {
                        String name = JOptionPane.showInputDialog(panel, "Введите имя вершины:");
                        String weightString = JOptionPane.showInputDialog(panel, "Введите вес вершины:");
                        int weight = Integer.valueOf(weightString);
                        if (weight > 0) {
                            vertexes.add(new Vertex(name, weight, e.getPoint()));
                            modified = true;
                            repaint();
                        }
                        else {
                            JOptionPane.showMessageDialog(panel, "Некорректный вес вершины!", "Ошибка",
                                    JOptionPane.ERROR_MESSAGE);
                        }
                        break;
                    }
                    case 3: {
                        int i = 0;
                        boolean found = false;
                        while ((i < vertexes.size()) && (!found)) {
                            if (vertexes.get(i).contains(e.getPoint())) {
                                found = true;
                            }
                            i++;
                        }
                        if (found) {
                            int result = JOptionPane.showConfirmDialog(panel, "Вы действительно хотите удалить эту вершину?",
                                    "Подтверждение удаления", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
                            if (result == JOptionPane.YES_OPTION) {
                                i--;
                                for (Vertex v : vertexes) {
                                    try {
                                        v.removeNextVertex(vertexes.get(i));
                                    } catch (ConnectionDoesntExistException e1) {}
                                }
                                for (int j = lines.size() - 1; j >= 0; j--) {
                                    if (((lines.get(j).getP1().getX() == vertexes.get(i).getCenter().getX()) &&
                                            (lines.get(j).getP1().getY() == vertexes.get(i).getCenter().getY())) ||
                                            ((lines.get(j).getP2().getX() == vertexes.get(i).getCenter().getX()) &&
                                            (lines.get(j).getP2().getY() == vertexes.get(i).getCenter().getY()))) {
                                        lines.remove(j);
                                    }
                                }
                                vertexes.remove(i);
                                modified = true;
                                repaint();
                            }
                        }
                        break;
                    }
                }
            }
            else {
                if (e.getButton() == MouseEvent.BUTTON3) {
                    int i = 0;
                    boolean found = false;
                    while ((i < vertexes.size()) && (!found)) {
                        if (vertexes.get(i).contains(e.getPoint())) {
                            found = true;
                        }
                        i++;
                    }
                    if (found) {
                        i--;
                        JPopupMenu popupMenu = new JPopupMenu();
                        JMenu deleteConnectionMenu = new JMenu("Удалить ребро...");
                        for (Vertex v : vertexes.get(i).getNextVertexes()) {
                            JMenuItem menuItem = new JMenuItem(new DeleteConnectionAction(vertexes.get(i), v));
                            StringBuilder builder = new StringBuilder();
                            builder.append(vertexes.get(i).getName());
                            builder.append(" -> ");
                            builder.append(v.getName());
                            menuItem.setText(builder.toString());
                            deleteConnectionMenu.add(menuItem);
                        }
                        popupMenu.add(deleteConnectionMenu);
                        popupMenu.show(panel, e.getX(), e.getY());
                    }
                }
            }
        }

        private class DeleteConnectionAction extends AbstractAction implements Serializable {

            private Vertex parentVertex;
            private Vertex childVertex;

            public DeleteConnectionAction(Vertex parentVertex, Vertex childVertex) {
                this.parentVertex = parentVertex;
                this.childVertex = childVertex;
            }

            public void actionPerformed(ActionEvent e) {
                try {
                    parentVertex.removeNextVertex(childVertex);
                } catch (ConnectionDoesntExistException e1) {}
                int i = 0;
                boolean found = false;
                while ((!found) && (i < lines.size())) {
                    if ((lines.get(i).getP1().getX() == parentVertex.getCenter().getX()) &&
                            (lines.get(i).getP1().getY() == parentVertex.getCenter().getY()) &&
                            (lines.get(i).getP2().getX() == childVertex.getCenter().getX()) &&
                            (lines.get(i).getP2().getY() == childVertex.getCenter().getY())) {
                        found = true;
                    }
                    i++;
                }
                if (found) {
                    lines.remove(--i);
                    modified = true;
                }
                repaint();
            }

        }

    }

    private class GraphMouseMotionListener extends MouseMotionAdapter implements Serializable {

        private GraphPanel panel;

        private GraphMouseMotionListener(GraphPanel panel) {
            this.panel = panel;
        }

        @Override
        public void mouseDragged(MouseEvent e) {
            if (draggedVertex != null) {
                ArrayList<Line> inLines = new ArrayList<Line>();
                ArrayList<Line> outLines = new ArrayList<Line>();
                for (Line l : lines) {
                    if ((l.getP1().getX() == draggedVertex.getCenter().getX()) &&
                            (l.getP1().getY() == draggedVertex.getCenter().getY())) {
                        outLines.add(l);
                    }
                    else {
                        if ((l.getP2().getX() == draggedVertex.getCenter().getX()) &&
                                (l.getP2().getY() == draggedVertex.getCenter().getY())) {
                            inLines.add(l);
                        }
                    }
                }
                draggedVertex.setLeftUpperCorner(e.getPoint());
                for (Line l : inLines) {
                    l.setP2(draggedVertex.getCenter());
                }
                for (Line l : outLines) {
                    l.setP1(draggedVertex.getCenter());
                }
                modified = true;
                repaint();
            }
            if (tempPoint != null) {
                tempLine = new Line(tempPoint, e.getPoint(), -1);
                repaint();
            }
        }

    }

}
