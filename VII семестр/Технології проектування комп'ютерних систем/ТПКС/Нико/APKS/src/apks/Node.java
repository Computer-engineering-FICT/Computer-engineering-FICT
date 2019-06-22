package apks;

import java.awt.Color;
import java.awt.Graphics;

public class Node extends Block {

    private Arrow arrow = null;

    public Node() {
        super();
    }

    public void setArrow(Arrow arrow) {this.arrow = arrow;}
    public Arrow getArrow() {return this.arrow;}
    public void setNoArrow(Arrow arrow) {}
    public Arrow getNoArrow() {return null;}
    
    public String getClassname() {return "Node";}
    
    @Override
    public void setNext(Block block) {this.arrow.setNext(block);}
    @Override
    public Block getNext() {return this.arrow.getNext();}


    @Override
    public void paint(Graphics g) {
        g.setColor(this.getColor());
        g.drawRect(this.getX(), this.getY(), this.getWidth(), this.getHeight());
        g.drawString(Integer.toString(getNumber()), getX() + 32, getY() + 20);
    }
}
