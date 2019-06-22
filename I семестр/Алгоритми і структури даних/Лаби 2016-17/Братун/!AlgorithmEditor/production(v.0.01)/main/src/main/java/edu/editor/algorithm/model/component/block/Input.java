package edu.editor.algorithm.model.component.block;

/**
 * Created by dtv on 09.11.2014.
 */

import java.awt.Color;
import java.awt.Graphics2D;

public class Input extends AbstractBlock {
    /**
     *
     */
    private static final long serialVersionUID = -2490176113441688909L;

//    private boolean type;

    public Input(int x, int y/*, boolean type*/) {
        super(x, y);
//        setType(type);
    }

    public Input(int x, int y/*, boolean type*/, String value) {
        super(x, y, value);
//        setType(type);
    }

    /*public boolean isInput() {
        return !getType();
    }

    public void setInput() {
        setType(false);
    }

    public boolean isOutput() {
        return getType();
    }

    public void setOutput() {
        setType(true);
    }*/

    /*private boolean getType() {
        return type;
    }

    private void setType(boolean type) {
        this.type = type;
    }*/

    @Override
    public void draw(Graphics2D g2d) {
        g2d.drawLine(getCenterX(), getPoint1Y(), getCenterX(), getPoint2Y());
        //g2d.clearRect(getPoint1X(), (getPoint1Y() + getCenterY())/2, getWidth(), getHeight()/2);
        int xa = getPoint1X(); int xb =  getPoint1X() + (int)(Math.tan(Math.PI/6) * getHeight()/4);
        int xc =  getPoint1X() + (int)(Math.tan(Math.PI/6) * getHeight()/2);
        int xd = getPoint2X() - (int)(Math.tan(Math.PI/6) * getHeight()/2); int xe =  getPoint2X();

        int ya = (getPoint1Y() + getCenterY())/2; int yb =  getCenterY(); int yc = (getCenterY() + getPoint2Y())/2;

        /*//todo change direction*/
        int x[] = {xb, xa, xc, xe, xd, xa, xc};
        int y[] = {yb, yb, ya, ya, yc, yc, ya};

        /*int x[] = {getPoint1X(),
                getPoint2X() - (int)(Math.tan(Math.PI/6) * getHeight()/2),
                getPoint2X(),
                getPoint1X() + (int)(Math.tan(Math.PI/6) * getHeight()/2),
                getPoint1X(),
                getPoint1X() + (int)(Math.tan(Math.PI/6) * getHeight()/4),
                getPoint1X() + (int)(Math.tan(Math.PI/6) * getHeight()/2),
                *//*getPoint2X() - (int)(Math.tan(Math.PI/6) * getHeight()/2),
                getPoint2X()*//*};*/
        /*int y[] = {(getPoint1Y() + getCenterY())/2,
                (getPoint1Y() + getCenterY())/2,
                (getCenterY() + getPoint2Y())/2,
                (getCenterY() + getPoint2Y())/2,
                getCenterY(),
                getCenterY(),
                (getCenterY() + getPoint2Y())/2,
                *//*(getPoint1Y() + getCenterY())/2,
                (getPoint1Y() + getCenterY())/2*//*};*/
        g2d.setColor(Color.WHITE);
        g2d.fillPolygon(x, y, 7);
        g2d.setColor(Color.BLACK);
        g2d.drawPolygon(x, y, 7);
        drawValue(g2d);
        if (getOutputConnection()==null || getInputConnection()==null ){
            g2d.setColor(Color.RED);
            g2d.drawRect(getPoint1X()-5, (getPoint1Y() + getCenterY())/2-5, getWidth()+10, getHeight()/2+10);
        }
    }
}

