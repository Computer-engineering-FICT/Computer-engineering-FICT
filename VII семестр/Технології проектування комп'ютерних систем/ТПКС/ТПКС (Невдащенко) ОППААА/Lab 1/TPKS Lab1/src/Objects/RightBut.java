package Objects;

import javax.swing.JButton;

// object of button from rightPanel
public class RightBut {
	private JButton but;
	private int numb;
	private boolean hasActon;

	public boolean isHasActon() {
		return hasActon;
	}

	public void setHasActon(boolean hasActon) {
		this.hasActon = hasActon;
	}

	public JButton getBut() {
		return but;
	}

	public void setBut(JButton but) {
		this.but = but;
	}

	public int getNumb() {
		return numb;
	}

	public void setNumb(int numb) {
		this.numb = numb;
	}
}
