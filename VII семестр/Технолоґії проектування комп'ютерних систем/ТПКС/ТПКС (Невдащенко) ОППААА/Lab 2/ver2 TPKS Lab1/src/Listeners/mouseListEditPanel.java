package Listeners;

import java.awt.Component;
import java.awt.Point;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;

import javax.swing.JDialog;

public class mouseListEditPanel extends MouseMotionAdapter {
	Component dialog;
	Point pEIn = new Point();
	Point pSIn = new Point();
	Point p = new Point();

	public mouseListEditPanel(Component dial) {
		dialog = dial;
	}

	@Override
	public void mouseDragged(MouseEvent e) {
		pEIn = e.getPoint();

		p = dialog.getLocation();

		dialog.setLocation(p.x + (pEIn.x - pSIn.x), p.y + (pEIn.y - pSIn.y));
	}

	public void mousePressed(MouseEvent e) {
		pSIn = e.getPoint();
	}

}
