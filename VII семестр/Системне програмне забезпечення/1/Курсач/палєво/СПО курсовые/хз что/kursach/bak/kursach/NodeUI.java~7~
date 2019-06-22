package kursach;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import javax.swing.JComponent;
import javax.swing.plaf.ComponentUI;
import kursach.MainWindow;
import java.awt.FontMetrics;

public class NodeUI extends ComponentUI {
        public boolean contains(JComponent c, int x, int y) {
                if (c instanceof Node) {
                        Node n = (Node) c;
                        int xCenter = c.getWidth()/2;
                        int yCenter = c.getHeight()/2;
                        int radius = c.getWidth()/2;
                        int sqrX = (x-xCenter)*(x-xCenter);
                        int sqrY = (y-yCenter)*(y-yCenter);
                        if (sqrX+sqrY <= radius*radius) {
                                return true;
                        }
                        else {
                                return false;
                        }
                }
                return false;
        }

        public void paint(Graphics g, JComponent c) {
                super.paint(g, c);
                Graphics2D g2 = (Graphics2D)g.create();
                BasicStroke stroke = new BasicStroke(1);
                g2.setStroke(stroke);
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                                RenderingHints.VALUE_ANTIALIAS_ON);
                if (c instanceof Node) {
                        Node node = (Node)c;
                        if (node.isSelected()) {
                                g2.setColor(new Color(200, 220, 251));
                                g2.fillOval(0, 0, c.getWidth()-1, c.getHeight()-1);
                        }
                        g2.setColor(Color.BLACK);
                        g2.drawOval(0, 0, c.getWidth()-1, c.getHeight()-1);
                        String weight = String.valueOf(node.getWeight());
                        FontMetrics fm = MainWindow.instance.
                                getFontMetrics(MainWindow.instance.getFont());
                        int width = fm.stringWidth(weight);
                        g2.drawString(weight, c.getWidth()/2-width/2,
                                        c.getHeight()/2+fm.getHeight()/4);
                }
        }

}
