package edu.editor.algorithm.model.component.block;

import edu.editor.algorithm.model.component.AbstractComponent;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

import java.awt.*;

/**
 * Created by dtv on 07.01.2015.
 */
public class BeginActivity extends AbstractBlock {
    public BeginActivity(int x, int y) {
        super(x, y);
        setWidth(getHeight());
        setValue("<activity_name>");
    }

    @Override
    public void draw(Graphics2D g2d) {
        g2d.setColor(Color.BLACK);
        int x = (int)g2d.getFont().getStringBounds(getValue(), g2d.getFontRenderContext()).getWidth();
        int y = (int)g2d.getFont().getStringBounds(getValue(), g2d.getFontRenderContext()).getHeight();
        //g2d.setColor(Color.BLUE);
        //g2d.setFont(g2d.getFont().deriveFont(Font.BOLD));
        g2d.drawString(getValue(), getCenterX() - x/2,
                getPoint1Y() - getHeight()/12 - y/4);
        g2d.setFont(g2d.getFont().deriveFont(Font.PLAIN));

        g2d.drawLine(getCenterX(), getCenterY(), getCenterX(), getPoint2Y());
        g2d.fillOval((getPoint1X()+getCenterX())/2, (getPoint1Y() + getCenterY())/2, getWidth()/2, getHeight()/2);

        if (getOutputConnection()==null){
            g2d.setColor(Color.RED);
            g2d.drawRect(getPoint1X()-5, (getPoint1Y() + getCenterY())/2-5, getWidth()+10, getHeight()/2+10);
        }
    }
}
