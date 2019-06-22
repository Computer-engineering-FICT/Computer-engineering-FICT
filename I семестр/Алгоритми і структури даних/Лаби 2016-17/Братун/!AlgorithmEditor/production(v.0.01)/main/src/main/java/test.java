import edu.editor.algorithm.controller.listener.BlockMouseMotionListener;
import edu.editor.algorithm.controller.listener.key.AlgorithmKeyListener;
import edu.editor.algorithm.controller.listener.mouse.BlockMouseListener;
import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.view.menubar.AlgorithmMenu;
import edu.editor.algorithm.view.panel.AlgorithmPanel;
import edu.editor.algorithm.view.toolbar.AlgorithmToolbar;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;

public class test {
    static boolean twoScreens = false;
    // !"debugMode" field  in "PseudoLanguage" class


    static int scrollSpeedRate = 10;

	public static ArrayList<Object> l = new ArrayList<Object>();

	public static void main(String args[]) {
		AlgorithmModel model = new AlgorithmModel();
		JFrame frame = new JFrame("Algorithm Editor");
		AlgorithmPanel panel = new AlgorithmPanel(model);
		panel.setLayout(null);
		panel.addMouseListener(new BlockMouseListener(panel));
		panel.addMouseMotionListener(new BlockMouseMotionListener(panel));
        panel.setFocusable(true);
        panel.addKeyListener(new AlgorithmKeyListener(model,panel));
//        frame.addKeyListener(new AlgorithmKeyListener(model,panel));
		JScrollPane jsp = new JScrollPane(panel);

        //todo 1) it in horizontal scroll bar and 2) scrollSpeedRate have to be adaptive for flowchart size
        JScrollBar jspBar = jsp.getVerticalScrollBar();
        jspBar.setUnitIncrement(jspBar.getUnitIncrement() * scrollSpeedRate);

		panel.setJsp(jsp);
		frame.getContentPane().add(jsp);
        if (twoScreens) {
            /*int width = 400;
            frame.setSize(width, 900);
            frame.setLocation(-width, 0);*/
			int width = 700;
            frame.setSize(width, 900);
            frame.setLocation(-width - 10, 180);
        }else {
            Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
            frame.setSize((int)screenSize.getWidth()/2, (int)screenSize.getHeight()-40);
            frame.setLocation((int)screenSize.getWidth()/2, 0);
        }

		frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
//		frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
		new AlgorithmToolbar(frame,panel,model);
		new AlgorithmMenu(frame,panel);	
		frame.setVisible(true);
//		System.out.println("Done!");
	}
}
