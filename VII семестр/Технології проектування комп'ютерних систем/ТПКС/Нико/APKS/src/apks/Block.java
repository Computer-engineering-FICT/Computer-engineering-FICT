package apks;

import java.awt.Color;
import java.awt.Graphics;
import java.util.ArrayList;
import javax.swing.JComponent;

public abstract class Block extends JComponent {

    public Block() {
        setSize(70, 30);
    }

    private Color color;
    private int number;
    private ArrayList<Integer> signals = new ArrayList();

    public void setColor(Color color) {this.color = color;}
    public Color getColor() {return this.color;}

    public void setNumber(int number) {this.number = number;}
    public int getNumber() {return this.number;}

    public void setNext(Block block) {}
    public Block getNext() {return null;}

    public ArrayList<Integer> getSignals() {return this.signals;}
    public void addSignal(int newSignal) {
        if (!signals.contains(newSignal))
            signals.add(newSignal);
    }
    public void removeSignal(int newSignal) {
        if (signals.contains(newSignal))
            signals.remove(newSignal);
    }

    public abstract void setArrow(Arrow arrow);
    public abstract Arrow getArrow();
    public abstract void setNoArrow(Arrow arrow);
    public abstract Arrow getNoArrow();
    public abstract String getClassname();

    public void move(int x, int y, Graphics g) {
        erase(g);
        setColor(Color.BLACK);
        setLocation(x, y);
        g.setColor(this.getColor());
        paint(g);
    }

    public void erase(Graphics g) {
        setColor(Color.WHITE);
        g.setColor(this.getColor());
        paint(g);
    }
}
