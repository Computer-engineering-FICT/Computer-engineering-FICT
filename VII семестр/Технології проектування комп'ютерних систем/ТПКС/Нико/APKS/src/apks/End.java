package apks;

import java.awt.Graphics;

public class End extends Terminal {

    private static End instance = null;

    private End() {
        super();
    }

    public static End getInstance() {
        if (instance == null)
            instance = new End();
        return instance;
    }

    public String getClassname() {return "End";}

    @Override public void paint(Graphics g) {
        g.setColor(this.getColor());
        g.drawRoundRect(this.getX(), this.getY(), this.getWidth(), this.getHeight(), 25, 25);
        g.drawString("END", this.getX() + 23, this.getY() + 20);
    }

    public void setArrow(Arrow arrow) {}
    public Arrow getArrow() {return null;}
    public void setNoArrow(Arrow arrow) {}
    public Arrow getNoArrow() {return null;}
}
