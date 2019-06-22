package Main;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.awt.event.HierarchyBoundsAdapter;
import java.awt.event.HierarchyBoundsListener;
import java.awt.event.HierarchyEvent;

import javax.swing.JFrame;
import javax.swing.JRootPane;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import Panels.Panel_Center;
import Panels.scrollPane_Center;

public class AppFrame extends JFrame {

	public AppFrame() {
		int height = Toolkit.getDefaultToolkit().getScreenSize().height;
		int width = Toolkit.getDefaultToolkit().getScreenSize().width;
		setTitle("Logic algorithms editor.    Version 2.0");
		if (width < 1400) {
			setResizable(false);
			setExtendedState(JFrame.MAXIMIZED_BOTH);
		} else
			setBounds(width / 8, height / 4, width / 2 + 10, height / 2);
		setMinimumSize(new Dimension(400, 200));
		setUndecorated(true);
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

		add(new scrollPane_Center());

		getContentPane().addHierarchyBoundsListener(
				new HierarchyBoundsAdapter() {
					public void ancestorMoved(HierarchyEvent e) {
						for (int j = 0; j < scrollPane_Center.Panel_Draw.dials
								.size(); j++) {
							scrollPane_Center.Panel_Draw.dials.get(j).dispose();
							scrollPane_Center.Panel_Draw.dial.dispose();
						}
						scrollPane_Center.Panel_Draw.dials.clear();
					}
				});

	}
}
