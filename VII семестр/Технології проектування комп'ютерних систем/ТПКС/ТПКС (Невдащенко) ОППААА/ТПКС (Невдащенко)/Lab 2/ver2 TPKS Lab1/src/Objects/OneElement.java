package Objects;

import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.FontFormatException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

// each element of algorithm
public class OneElement {
	private JLabel lbl;
	private ArrayList<String> signals;

	public OneElement(String t) {
		ImageIcon icon = new ImageIcon("1.png");
		lbl = new JLabel();
		lbl.setIcon(icon);
		lbl.setHorizontalTextPosition(SwingConstants.CENTER);
		lbl.setVerticalTextPosition(SwingConstants.CENTER);
		lbl.setText(t);
		lbl.setFont(new Font("SansSerif", Font.PLAIN, 20));
		lbl.setPreferredSize(new Dimension(64, 64));
		lbl.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		signals = new ArrayList<String>();
	}

	public ArrayList<String> getSignals() {
		return signals;
	}

	public JLabel getLbl() {
		return lbl;
	}

	public void setLbl(String t) {
		this.lbl.setText(t);
	}

}
