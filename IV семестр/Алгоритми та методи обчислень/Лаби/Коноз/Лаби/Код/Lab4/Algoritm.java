package Lab4;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.image.BufferedImage;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

public class Algoritm extends JDialog {
	public Algoritm() {
		setTitle("Алгоритм");
		setBounds(100, 100, 500, 625);
		setContentPane(new ImagePanel());
		setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		setVisible(true);
	}

}
