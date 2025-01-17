package kursach;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;

import javax.swing.JPanel;
import javax.swing.SwingUtilities;
import javax.swing.event.MouseInputAdapter;

import kursach.Node;
import kursach.ChangeWeightDialog;
import kursach.MainWindow;
import java.awt.Point;
import javax.swing.JOptionPane;

public class GraphView extends JPanel {
        private GraphModel model;
        private Node first;
        private int countNodes = 0;

        public GraphView() {
                model = new GraphModel();
                setLayout(null);
                NodeMovingListener mouseListener = new NodeMovingListener();
                addMouseListener(mouseListener);
                addMouseMotionListener(mouseListener);
        }

        public void setModel(GraphModel model) {
                this.model = model;
        }

        public GraphModel getModel() {
                return model;
        }

        public void addNode(Node node) {
                add(node);
                model.addNode(node);
        }

        public void addLine(Line line) {
            add(line);
            model.addLine(line);
        }

        class NodeMovingListener extends MouseInputAdapter  {
                private Node selectedNode = null;
                private Line selectedLine = null;
                private int dx, dy;
                public void mousePressed(MouseEvent e) {
                        int state = MainWindow.instance.getState();
                        switch (state){
                        case 0:
                        {
                            if (selectedNode != null) {
                                selectedNode.setSelected(false);
                            }
                            if (selectedLine != null ){
                                selectedLine.setSelected(false);
                            }
                            selectedNode = model.getNode(e.getX(), e.getY());
                            if (selectedNode != null)
                            {
                                if (SwingUtilities.isLeftMouseButton(e))
                                {
                                    selectedNode.setSelected(true);
                                    dx = e.getX()-selectedNode.getX();
                                    dy = e.getY()-selectedNode.getY();
                                }
                                else
                                    new ChangeWeightDialog( MainWindow.instance, selectedNode );
                            }else
                            {
                                selectedLine = model.getLine(e.getX(), e.getY());
                                if (selectedLine != null)
                                {
                                    if (SwingUtilities.isLeftMouseButton(e))
                                    {
                                        selectedLine.setSelected(true);
                                        dx = e.getX()-selectedLine.getX();
                                        dy = e.getY()-selectedLine.getY();
                                    }
                                    else
                                        new ChangeWeightDialog( MainWindow.instance, selectedLine );
                                }
                            }
                            break;
                        }
                        case 1:
                        {
                            Node n = new Node();
                            n.getModel().setNumber( countNodes );
                            countNodes++;
                            addNode(n);
                            n.setLocation(e.getX()-Node.DEFAULT_RADIUS,
                                          e.getY()-Node.DEFAULT_RADIUS);
                            break;
                        }
                        case 2:
                        {
                            if ( first == null )
                            {
                                if (selectedNode != null) {
                                    selectedNode.setSelected(false);
                                }
                                selectedNode = model.getNode(e.getX(), e.getY());
                                if (selectedNode != null) {
                                    if (SwingUtilities.isLeftMouseButton(e)) {
                                        selectedNode.setSelected(true);
                                        first = selectedNode;
                                    }
                                }
                            }else
                            {
                                Node second = new Node();
                                selectedNode = model.getNode(e.getX(), e.getY());
                                if (selectedNode != null) {
                                    if (SwingUtilities.isLeftMouseButton(e)) {
                                        selectedNode.setSelected(true);
                                        second = selectedNode;

                                        // ���������� �����

                                        Line line = new Line();
                                        addLine(line);

                                        if (first.getY() > second.getY() )
                                        {
                                            second = first;
                                            first = selectedNode;
                                        }

                                        Point start = new Point( first.getX()+first.getWidth()/2, first.getY()+first.getHeight() );
                                        Point end = new Point( second.getX()+second.getWidth()/2, second.getY());

                                        if ( first.getX() < second.getX() )
                                        {
                                            line.setType(0); // left to right
                                            line.setLocation( start.x, start.y );
                                            line.setSize(end.x - start.x, end.y - start.y);
                                        }
                                        else
                                        {
                                            line.setType(1); // right to left
                                            line.setLocation( end.x, start.y );
                                            line.setSize(Math.abs(end.x - start.x), Math.abs( end.y - start.y));
                                        }
                                        line.getModel().setStartNode( first );
                                        line.getModel().setEndNode( second );
                                    }
                                    first.setSelected(false);
                                    second.setSelected(false);
                                    first = null;
                                } else
                                {
                                    JOptionPane.showMessageDialog(MainWindow.instance, "�������� ��� �������, ���� ������� ��",
                                                "������", JOptionPane.ERROR_MESSAGE);
                                }
                            }
                            break;
                        }
                        }
                }
                public void mouseDragged(MouseEvent e) {
                        if (selectedNode != null && SwingUtilities.isLeftMouseButton(e)) {
                                selectedNode.setLocation(e.getX()-dx, e.getY()-dy);
                        }
                }
        }
}
