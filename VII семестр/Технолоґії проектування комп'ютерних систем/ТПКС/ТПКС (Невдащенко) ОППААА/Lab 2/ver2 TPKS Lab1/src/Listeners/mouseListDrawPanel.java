package Listeners;

import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.ImageIcon;
import Panels.scrollPane_Center;

public class mouseListDrawPanel implements MouseListener {
	scrollPane_Center scrP;

	@Override
	public void mousePressed(MouseEvent e) {
		for (int j = 0; j < scrP.Panel_Draw.getEls().size(); j++) {
			if (e.getComponent()
					.getLocation()
					.equals(scrP.Panel_Draw.getEls().get(j).getLbl()
							.getLocation())) {
				scrP.Panel_Draw.getEls().get(j).getLbl()
						.setIcon(new ImageIcon("1p.png"));
			} else {
				scrP.Panel_Draw.getEls().get(j).getLbl()
						.setIcon(new ImageIcon("1.png"));
			}
		}
	}

	@Override
	public void mouseReleased(MouseEvent e) {
	}

	@Override
	public void mouseEntered(MouseEvent e) {
	}

	@Override
	public void mouseExited(MouseEvent e) {
	}

	@Override
	public void mouseClicked(MouseEvent e) {
	}

}
