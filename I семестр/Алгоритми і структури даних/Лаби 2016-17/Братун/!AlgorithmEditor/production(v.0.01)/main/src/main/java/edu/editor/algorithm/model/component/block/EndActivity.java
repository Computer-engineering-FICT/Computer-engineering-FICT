package edu.editor.algorithm.model.component.block;


import java.awt.*;

/**
 * Created by dtv on 07.01.2015.
 */
public class EndActivity extends AbstractBlock {
    public EndActivity(int x, int y) {
        super(x, y);
        setWidth(getHeight());
    }

    @Override
    public void draw(Graphics2D g2d) {
        g2d.drawLine(getCenterX(), getPoint1Y(), getCenterX(), getCenterY());
        g2d.setColor(Color.WHITE);
        g2d.fillOval((getPoint1X()+getCenterX())/2, (getPoint1Y() + getCenterY())/2, getWidth()/2, getHeight()/2);
        g2d.setColor(Color.BLACK);
        g2d.drawOval((getPoint1X()+getCenterX())/2, (getPoint1Y() + getCenterY())/2, getWidth()/2, getHeight()/2);
        g2d.fillOval((getPoint1X()+getCenterX())/2 + getWidth()/12, (getPoint1Y() + getCenterY())/2 + getHeight()/12,
                getWidth()/3+1, getHeight()/3+1);

        if (getInputConnection()==null){
            g2d.setColor(Color.RED);
            g2d.drawRect(getPoint1X()-5, (getPoint1Y() + getCenterY())/2-5, getWidth()+10, getHeight()/2+10);
        }
    }
}
