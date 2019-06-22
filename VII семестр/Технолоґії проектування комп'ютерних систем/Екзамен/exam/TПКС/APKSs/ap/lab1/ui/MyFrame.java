/**
 * 
 */
package lab1.ui;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;

import lab1.ServiceClass;
import lab1.mura.ForGraphMura;
import lab1.mura.Mura;
import lab1.mura.MuraManager;

/**
 * @author Dmytro Pogrebnjuk
 * 
 */
public class MyFrame extends JFrame {
	private static final long serialVersionUID = 1L;
	private MyFrame _instance;
	private CircleLayout la = new CircleLayout(false);
	private MyPanel jp = new MyPanel();

	public MyFrame() {
		super("MyFrame");
		_instance = this;

		setSize(new Dimension(500, 400));
		setJMenuBar(getMenu());
		setContentPane(jp);
		setDefaultCloseOperation(EXIT_ON_CLOSE);

		jp.setLayout(la);
		startPaint();
		
		setVisible(true);

	}

	public void refresh(){
		repaint();
		
		startPaint();
		
		setVisible(true);
		//System.out.println(MuraManager.get_instance().get_size());
	}
	
	private void startPaint() {
		Mura mura = ServiceClass.getFirstMura();
		
		drawOneMura(mura);
		
	}

	private void drawOneMura(Mura mura) {
		if (!mura.isDraw()) {
			jp.add(mura);
			mura.setDraw(true);
			ArrayList<ForGraphMura> arr = mura.getAllConnection();
			for (int i = 0; i < arr.size(); i++) {
				Mura child = arr.get(i).get_toBlock();
				drawOneMura(child);
			}
		}
	}

	private JMenuBar getMenu() {
		JMenuBar menuBar = new JMenuBar();
		//menuBar.setLayout(new BoxLayout(menuBar, BoxLayout.PAGE_AXIS));

		// save-------------
		JMenuItem save = new JMenuItem("save");
		ImageIcon image1 = new ImageIcon(getToolkit().createImage("E:/work/Java/Eclipse/APKS/src/lab1/save.gif"));
		save.setIcon(image1);
		ActionListener saveAction = new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				JFileChooser jfc = new JFileChooser();

				String path = "";
				try {
					if (jfc.showSaveDialog(_instance) != JFileChooser.CANCEL_OPTION) {
						path = jfc.getSelectedFile().getCanonicalPath();

						saveToFile(path);
					}

				} catch (FileNotFoundException e1) {
					JOptionPane.showMessageDialog(_instance, "File ( " + path
							+ " ) not found.", "Файл не знайдено.",
							JOptionPane.WARNING_MESSAGE);

				} catch (IOException e1) {
					JOptionPane.showMessageDialog(_instance, "Error!\n"
							+ e1.getMessage(), "Помилка вводу виводу.",
							JOptionPane.ERROR_MESSAGE);
				}
			}

		};
		save.addActionListener(saveAction);

		menuBar.add(save);
		// --------------
		// load-------------
		JMenuItem load = new JMenuItem("load");
		ImageIcon image2 = new ImageIcon(getToolkit().createImage("E:/work/Java/Eclipse/APKS/src/lab1/open.gif"));
		load.setIcon(image2);
		
		ActionListener loadAction = new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				JFileChooser jfc = new JFileChooser();

				String path = "";
				try {
					if (jfc.showOpenDialog(_instance) != JFileChooser.CANCEL_OPTION) {
						path = jfc.getSelectedFile().getCanonicalPath();

						loadFromFile(path);
						getContentPane().removeAll();
						
						refresh();
					}

				} catch (FileNotFoundException e1) {
					JOptionPane.showMessageDialog(_instance, "File ( " + path
							+ " ) not found.", "Файл не знайдено.",
							JOptionPane.WARNING_MESSAGE);

				} catch (IOException e1) {
					JOptionPane.showMessageDialog(_instance, "Error!\n"
							+ e1.getMessage(), "Помилка вводу виводу.",
							JOptionPane.ERROR_MESSAGE);
				}
			}

		};
		load.addActionListener(loadAction);

		menuBar.add(load);
		// --------------

		return menuBar;
	}

	private void saveToFile(String path) {
		Iterator<Mura> it = MuraManager.get_instance().getIterator();

		BufferedWriter out;
		try {
			out = new BufferedWriter(new FileWriter(path));
			while (it.hasNext()) {
				out.write(it.next().toString() + "\n");
			}
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void loadFromFile(String path) {
		BufferedReader in;
		try {
			MuraManager.get_instance().clear();
			in = new BufferedReader(new FileReader(path));
			while (in.ready()) {
				String line = in.readLine();
				if (line.length() > 0) {
					parse(line);
				}
			}
			ServiceClass.setFirstMura(MuraManager.get_instance().getFirst());

			in.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void parse(String line) {
		int index = line.indexOf("(");
		String name = line.substring(1, index);
		String opName = line
				.substring(line.indexOf("(") + 1, line.indexOf(")"));
		String endPart = line.substring(line.indexOf(">") + 1);
		String toBlock = "";
		String condition = "";
		if (endPart.startsWith("z")) {
			toBlock = endPart.substring(1);
		} else {
			condition = endPart.substring(8, endPart.indexOf(")") + 1);
			toBlock = endPart.substring(endPart.indexOf("z") + 1);
		}
		ForGraphMura fg = new ForGraphMura();
		fg.set_condition(condition);
		MuraManager mm = MuraManager.get_instance();
		if (mm.contains(toBlock)) {
			fg.set_toBlock(mm.getMura(toBlock));
		} else {
			fg.set_toBlock(null);
			mm.putFG(fg, toBlock);
		}

		if (!mm.contains(name)) {
			Mura res = new Mura(Integer.valueOf(name));
			res.addOperation(opName);
			res.addConnection(fg);
			mm.addMura(res);
		} else {
			mm.getMura(name).addConnection(fg);
		}
		mm.refresh();
	}
}
