package edu.editor.algorithm.model.component.block;

import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.view.panel.AlgorithmPanel;

import java.awt.Color;
import java.awt.Graphics2D;

public class Output extends AbstractBlock {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2490176113441688909L;
	
//	private boolean type;

	public Output(int x, int y/*, boolean type*/) {
		super(x, y);
//		setType(type);
	}

	public Output(int x, int y/*, boolean type*/, String value) {
		super(x, y, value);
//		setType(type);
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
	}
	
	private boolean getType() {
		return type;
	}
	
	private void setType(boolean type) {
		this.type = type;
	}*/

    /*
    * Ниже - геометрические расчёты, которые помагают повторить
    * размер загнутого кусочка в блоке ввода
    * */
    static double alpha = Math.toRadians(45) - Math.atan(0.5);
    static double a = Math.sqrt(2)*Math.sin(alpha);
    static double b = Math.sqrt(2)*Math.cos(alpha);
    //double d = Math.sqrt(5)/2;

	@Override
	public void draw(Graphics2D g2d) {
		g2d.drawLine(getCenterX(), getPoint1Y(), getCenterX(), getPoint2Y());
		//g2d.clearRect(getPoint1X(), (getPoint1Y() + getCenterY())/2, getWidth(), getHeight()/2);

		int x[] = {getPoint2X() - (int)(Math.tan(Math.PI/6) * getHeight()/2),
                getPoint1X(),
                getPoint1X() + (int)(Math.tan(Math.PI/6) * getHeight()/2),
                getPoint2X(),
                (int)(getPoint2X() - AlgorithmPanel.widthCell*b),
                (int)(getPoint2X() - AlgorithmPanel.widthCell*(b+a/2)),
                getPoint2X()};
		int y[] = {(getCenterY() + getPoint2Y())/2,
                (getCenterY() + getPoint2Y())/2,
                (getPoint1Y() + getCenterY())/2,
                (getPoint1Y() + getCenterY())/2,
                (int)(getPoint1Y() + AlgorithmPanel.heightCell - AlgorithmPanel.widthCell*a),
                (getPoint1Y() + getCenterY())/2,
                (getPoint1Y() + getCenterY())/2};
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
