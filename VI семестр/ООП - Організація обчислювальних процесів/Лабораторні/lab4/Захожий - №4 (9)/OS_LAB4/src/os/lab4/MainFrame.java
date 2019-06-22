package os.lab4;

import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileNotFoundException;

import javax.swing.AbstractAction;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTextArea;

public class MainFrame extends JFrame {

	private static final long serialVersionUID = 4272542240756969890L;
	private JTextArea textArea;
	private JFileChooser chooser;
	private Planner planner;

	public MainFrame() {
		super();
		setTitle("Лабораторная работа №4");
		setMinimumSize(new Dimension(800, 600));
		setExtendedState(JFrame.MAXIMIZED_BOTH);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JSplitPane splitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT);
		textArea = new JTextArea();
		textArea.setFont(new Font("Monospaced", Font.PLAIN, 12));
		textArea.setEditable(false);
		add(new JScrollPane(textArea));
		splitPane.setDividerLocation(400);
		JMenuBar menuBar = new JMenuBar();
		JMenu fileMenu = new JMenu("Файл");
		JMenuItem openItem = new JMenuItem();
		openItem.setAction(new OpenAction(this));
		openItem.setText("Открыть...");
		fileMenu.add(openItem);
		menuBar.add(fileMenu);
		setJMenuBar(menuBar);
		chooser = new JFileChooser();
		chooser.setDialogType(JFileChooser.OPEN_DIALOG);
		chooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
		chooser.setCurrentDirectory(new File("."));
	}
	
	private class OpenAction extends AbstractAction {
		
		private static final long serialVersionUID = -5099362063131839615L;
		private MainFrame frame;

		public OpenAction(MainFrame frame) {
			this.frame = frame;
		}
		
		public void actionPerformed(ActionEvent arg0) {
			int answer = chooser.showOpenDialog(frame);
			if (answer == JFileChooser.APPROVE_OPTION) {
				try {
					planner = Planner.readGraphFromFile(chooser.getSelectedFile());
				} catch (FileNotFoundException e) {}
				textArea.setText(planner.getLog());
			}
		}
		
	}
	
}
