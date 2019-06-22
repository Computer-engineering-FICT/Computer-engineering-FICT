package Objects;

import java.awt.geom.Rectangle2D;
import java.util.ArrayList;

// each element of algorithm
public class OneElement {
	private Labelone lbl;
	private Rectangle2D rect;
	private ArrayList<String> signals;

	public OneElement(Rectangle2D.Double r, Labelone l) {
		lbl = l;
		rect = r;
		signals = new ArrayList<String>();
	}

	public ArrayList<String> getSignals() {
		return signals;
	}

	public Labelone getLbl() {
		return lbl;
	}

	public void setLbl(Labelone lbl) {
		this.lbl = lbl;
	}

	public Rectangle2D getRect() {
		return rect;
	}

	public void setRect(Rectangle2D rect) {
		this.rect = rect;
	}

}
