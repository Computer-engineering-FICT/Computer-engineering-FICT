package Main;

import java.awt.Dimension;
import java.awt.Toolkit;

import javax.swing.JFrame;
import javax.swing.JRootPane;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;


public class AppFrame extends JFrame {

	public AppFrame() {
		int height = Toolkit.getDefaultToolkit().getScreenSize().height;
		int width = Toolkit.getDefaultToolkit().getScreenSize().width;
		setTitle("Logic algorithms editor.    Version 1.0");
		setBounds(width / 4, height / 4, width / 2, height / 2);
//		 setBounds(width / 4, height / 4, width / 4, height / 4);
		setMinimumSize(new Dimension(400, 200));
		setUndecorated(true);
		setResizable(false);
		setExtendedState(JFrame.MAXIMIZED_BOTH);
		getRootPane().setWindowDecorationStyle(JRootPane.FRAME);
		try {
			UIManager
					.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedLookAndFeelException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		add(new Panel(this));

	}

}
