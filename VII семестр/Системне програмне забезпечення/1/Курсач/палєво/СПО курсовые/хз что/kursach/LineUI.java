package kursach;

import javax.swing.plaf.ComponentUI;
import javax.swing.JComponent;
import java.awt.RenderingHints;
import java.awt.Graphics2D;
import java.awt.BasicStroke;
import java.awt.Graphics;
import java.awt.Color;
import java.awt.FontMetrics;
import java.awt.Point;

public class LineUI extends ComponentUI {
    public boolean contains(JComponent c, int x, int y) {
        Line line = (Line)c;
        Point upper = null;
        Point lower = null;
        if (line.getType() == Line.LEFT_TO_RIGHT) {
            upper = new Point(0, 0);
            lower = new Point(c.getWidth(),c.getHeight());
        }
        else {
            upper = new Point(0, c.getHeight());
            lower = new Point(c.getWidth(), 0);
        }

        int yLine = ((x-upper.x)*(lower.y-upper.y)/(lower.x-upper.x))+upper.y;

        if (Math.abs(yLine - y) <= 1) {
            return true;
        }
        else
            return false;
    }

    public void paint(Graphics g, JComponent c) {
        super.paint(g, c);
        Graphics2D g2 = (Graphics2D) g.create();
        BasicStroke stroke = new BasicStroke(1);
        g2.setStroke(stroke);
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                            RenderingHints.VALUE_ANTIALIAS_ON);
        if (c instanceof Line) {
                        Line line = (Line)c;
                        if (line.isSelected()) {
                                g2.setColor(new Color(200, 220, 251));
                        }
                        g2.setColor(Color.BLACK);
                        if ( line.getType() == Line.LEFT_TO_RIGHT )
                            g2.drawLine(0, 0, c.getWidth()-1, c.getHeight()-1);
                        else
                            g2.drawLine(0, c.getHeight()-1, c.getWidth()-1, 0);
                        String transfer = String.valueOf(line.getTransfer());
                        FontMetrics fm = MainWindow.instance.
                                getFontMetrics(MainWindow.instance.getFont());
                        int width = fm.stringWidth(transfer);
                        g2.drawString(transfer, c.getWidth()/2-width/2,
                                        c.getHeight()/2+fm.getHeight()/4-10);
                }
    }
}
