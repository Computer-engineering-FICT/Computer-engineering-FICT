package apks;

import java.awt.Color;
import java.awt.Graphics;
import javax.swing.JComponent;

public class Arrow extends JComponent {
    
    private Block next = null;
    private Block prev = null;
    private int shiftX = 0;
    private Color color;

    public void setColor(Color color) {this.color = color;}
    public Color getColor() {return this.color;}

    public Block getNext() {return this.next;}
    public void setNext(Block block) {this.next = block;}

    public Block getPrev() {return this.prev;}
    public void setPrev(Block block) {this.prev = block;}

    public int getShiftX() {return this.shiftX;}
    public void setShiftX(int x) {this.shiftX = x;}

    public void countNewShiftX() {
        if ((next.getX() > prev.getX() + prev.getWidth())
            || (next.getX() + next.getWidth() < prev.getX()))
            shiftX = (prev.getX() + prev.getWidth() + next.getX()) / 2;
        else if (next.getY() > prev.getY() + prev.getHeight() + 20)
            shiftX = (prev.getX() + next.getX() + prev.getWidth()) / 2;
        else if (next.getY() > prev.getY() + prev.getHeight())
            shiftX = prev.getX() + prev.getWidth() / 2;
        else if (next.getY() < prev.getY() - next.getHeight())
            if (next.getX() > prev.getX())
                shiftX = next.getX() + next.getWidth() + 10;
            else shiftX = next.getX() - 10;
    }
    
    @Override
    public void paint(Graphics g) {
        g.setColor(this.getColor());
        int x, y, oldY;
        x = prev.getX() + prev.getWidth() / 2;
        y = prev.getY() + prev.getHeight();
        g.drawLine(x, y, x, y + 10);
        y += 10;
        g.drawLine(x, y, shiftX, y);
        x = next.getX() + next.getWidth() / 2;
        oldY = y;
        y = next.getY() - 10;
        g.drawLine(shiftX, oldY, shiftX, y);
        g.drawLine(shiftX, y, x, y);
        g.drawLine(x, y, x, y + 10);
        g.fillOval(x - 3, y + 7, 6, 6);
        if (prev.getClass().equals(new Condition().getClass()))
            if (prev.getArrow() == this) {
                g.drawString("+", x + 3, y + 10);
            } else
                g.drawString("-", x + 3, y + 8);
    }

    public void erase(Graphics g) {
        setColor(Color.WHITE);
        paint(g);
        setColor(Color.BLACK);
    }
    
}
