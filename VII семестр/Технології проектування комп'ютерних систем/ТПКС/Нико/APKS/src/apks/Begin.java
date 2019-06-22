package apks;

import java.awt.Graphics;

public class Begin extends Terminal {

    private Arrow arrow = null;
    private static Begin instance = null;

    private Begin() {
        super();
    }

    public static Begin getInstance() {
        if (instance == null)
            instance = new Begin();
        return instance;
    }

    public void setNext(Block block) {this.arrow.setNext(block);}
    public Block getNext() {return this.arrow.getNext();}

    public void setArrow(Arrow arrow) {this.arrow = arrow;}
    public Arrow getArrow() {return this.arrow;}
    public void setNoArrow(Arrow arrow) {}
    public Arrow getNoArrow() {return null;}
    
    public String getClassname() {return "Begin";}

    @Override public void paint(Graphics g) {
        g.setColor(this.getColor());
        g.drawRoundRect(this.getX(), this.getY(), this.getWidth(), this.getHeight(), 25, 25);
        g.drawString("BEGIN", this.getX() + 15, this.getY() + 20);        
    }
}
