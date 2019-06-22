package Main;

import java.awt.AWTException;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.MouseInfo;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.InputEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.swing.BorderFactory;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;
import javax.swing.filechooser.FileNameExtensionFilter;

import Objects.JTextFieldLimit;
import Objects.Labelone;
import Objects.OneElement;
import Objects.RightBut;

public class Panel extends JComponent implements MouseMotionListener,
		MouseListener, ActionListener {
	private JButton new_b, y, x, ArrowUp, end_b, save, open;
	private ArrayList<OneElement> elementsToDraw;
	private ArrayList<RightBut> rightButtons;
	private JPanel Panel_Buttons_Midle;
	private JPanel Panel_Buttons_Left;
	private JPanel Panel_Buttons;
	private JPanel Panel_Draw;
	private JPanel Panel_ButtonsRight;
	private JScrollPane scrollPanel;
	private JScrollPane scrollPanel_Right;
	private JFrame f;
	private JDialog dial;
	private JList<String> signalsList;
	private JFileChooser chooser;

	private int curY = 0;
	private int curX = 0;
	private int curArrUp = 0;
	private int curArrDown = 0;

	private int[] disp = { 0, 0 };
	private int labelDispX = 8;
	private int i = 0;

	private boolean d = false;
	private boolean isBeginning = false;
	private boolean isEnd = false;

	// ///////////////////////////////////////
	// ////////////// Paint //////////////////
	// ///////////////////////////////////////

	public Panel(AppFrame frame) {
		this.f = frame;
		setLayout(new BorderLayout());
		elementsToDraw = new ArrayList<OneElement>();

		// draw elements from elementsToDraw
		Panel_Draw = new JPanel() {
			public void paintComponent(Graphics g) {
				Graphics2D g2 = (Graphics2D) g;
				super.paintComponent(g);
				drawGrid(g2);

				for (int i = 0; i < elementsToDraw.size(); i++) {
					g2.draw(elementsToDraw.get(i).getRect());
				}

				for (int i = 0; i < elementsToDraw.size(); i++) {
					g2.drawString(elementsToDraw.get(i).getLbl().getText(),
							elementsToDraw.get(i).getLbl().getX() + labelDispX,
							elementsToDraw.get(i).getLbl().getY() + 20);
				}
			}
		};

		// create & initialize all buttons
		open = new JButton("Open");
		open.addActionListener(this);
		open.setFocusable(false);

		save = new JButton("Save");
		save.addActionListener(this);
		save.setFocusable(false);

		new_b = new JButton("New Scheme");
		new_b.addActionListener(this);
		new_b.setFocusable(false);

		y = new JButton("Y0");
		y.addActionListener(this);
		y.setFocusable(false);

		x = new JButton("X0");
		x.addActionListener(this);
		x.setFocusable(false);
		x.setEnabled(false);

		ArrowUp = new JButton("↑0");
		ArrowUp.setFocusable(false);
		ArrowUp.addActionListener(this);
		ArrowUp.setEnabled(false);

		end_b = new JButton("K");
		end_b.addActionListener(this);
		end_b.setFocusable(false);
		end_b.setEnabled(false);

		// initialize all panels
		Panel_Buttons = new JPanel();
		Panel_Buttons.setLayout(new BorderLayout());
		Panel_Buttons_Left = new JPanel();
		Panel_Buttons_Left.add(open);
		Panel_Buttons_Left.add(new_b);
		Panel_Buttons_Left.add(save);
		Panel_Buttons.add(Panel_Buttons_Left, BorderLayout.WEST);

		Panel_Buttons_Midle = new JPanel();
		Panel_Buttons_Midle.add(y);
		Panel_Buttons_Midle.add(x);
		Panel_Buttons_Midle.add(ArrowUp);
		Panel_Buttons_Midle.add(end_b);
		Panel_Buttons.add(Panel_Buttons_Midle, BorderLayout.CENTER);

		Panel_Draw.setBorder(BorderFactory.createLoweredBevelBorder());
		Panel_Draw.setBackground(Color.white);
		Panel_Draw.setPreferredSize(getPreferredSize());

		scrollPanel = new JScrollPane(Panel_Draw);
		scrollPanel.addMouseListener(this);
		scrollPanel.setViewportView(Panel_Draw);
		scrollPanel
				.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		scrollPanel.getVerticalScrollBar().setUnitIncrement(16);
		scrollPanel.setPreferredSize(getPreferredSize());
		scrollPanel.setFocusable(true);

		Panel_ButtonsRight = new JPanel();
		Panel_ButtonsRight.setBorder(new TitledBorder(new LineBorder(new Color(
				100, 130, 190), 1, true), "↓ Buttons"));
		Panel_ButtonsRight.setPreferredSize(new Dimension(
				f.getSize().width / 10, 1000));
		scrollPanel_Right = new JScrollPane(Panel_ButtonsRight);
		scrollPanel_Right.setViewportView(Panel_ButtonsRight);
		scrollPanel_Right
				.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		scrollPanel_Right.setBorder(null);
		scrollPanel_Right.getVerticalScrollBar().setUnitIncrement(16);

		// add panels
		add(Panel_Buttons, BorderLayout.NORTH);
		add(scrollPanel_Right, BorderLayout.EAST);
		add(scrollPanel, BorderLayout.CENTER);

	}

	// ///////////////////////////////////////
	// //////// DrawGrid /////////////////////
	// ///////////////////////////////////////

	private void drawGrid(Graphics2D g2) {
		g2.setColor(new Color(234, 234, 234));
		for (int i = 0; i < (int) this.getSize().width / 10 + 1; i++) {
			g2.drawLine(30 * i, 0, 30 * i, (int) Panel_Draw.getSize().height);
		}

		for (int i = 0; i < (int) this.getSize().height / 2 + 1; i++) {
			g2.drawLine(0, 30 * i, (int) Panel_Draw.getSize().width, 30 * i);
		}
		g2.setColor(Color.black);
	}

	// ///////////////////////////////////////
	// //////// ActionListener ///////////////
	// ///////////////////////////////////////

	@Override
	public void actionPerformed(ActionEvent e) {
		// draw start place ("П")
		beginCheck();

		// go to next line
		endLineCheck();

		// add scroll if size is to big
		isWinResizeNeed();

		// make disp
		if (curArrUp > 99 || curArrDown > 99 || curX > 99 || curY > 99) {
			labelDispX = 2;
		}
		if (e.getSource().equals(y)) {
			yPressed();
		}
		if (e.getSource().equals(x)) {
			xPressed();
		}
		if (e.getSource().equals(end_b) && end_b.isEnabled()) {
			endPressed();
		}
		if (e.getSource().equals(new_b)) {
			newPressed();
		}
		if (e.getSource().equals(save)) {
			savePressed();
		}
		if (e.getSource().equals(open)) {
			openPressed();
		}
	}

	// call when pressing open button
	// open file and get info
	private void openPressed() {
		FileNameExtensionFilter filter = new FileNameExtensionFilter(
				"Text files", "txt");

		ArrayList<String> restore = new ArrayList<String>();
		;
		chooser = new JFileChooser();
		chooser.setCurrentDirectory(new File("c:\\Users\\Admin\\Desktop\\"));
		chooser.setFileFilter(filter);

		int result = chooser.showOpenDialog(null);
		if (result == JFileChooser.CANCEL_OPTION) {
			return;
		}
		File myFile = chooser.getSelectedFile();
		BufferedReader in;
		try {
			in = new BufferedReader(new FileReader(myFile.getAbsolutePath()
					.toString()));
			String s = "";
			while ((s = in.readLine()) != null) {
				restore.add(s);
			}
			in.close();

		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		// formating array of lines
		ArrayList<String> res = new ArrayList<String>();
		for (int i = 0; i < restore.size(); i++) {
			if (!restore.get(i).equals("")) {
				res.add(restore.get(i));
			}
		}
		restore = res;

		// System.out.println("before:");
		// for (int i = 0; i < restore.size(); i++) {
		// if (restore.get(i).equals("")) {
		// System.out.println("null");
		// } else {
		// System.out.println(restore.get(i));
		// }
		// }

		// reset all variables
		elementsToDraw = new ArrayList<OneElement>();
		disp[0] = 0;
		disp[1] = 0;
		curY = 0;
		curX = 0;
		curArrUp = 0;
		curArrDown = 0;
		labelDispX = 8;
		for (int i = 0; i < restore.size(); i++) {
			beginCheck();
			disp[0] += 30;
			// wait for y
			if (restore.get(i).substring(0, 1).equals("1")) {
				restore.set(i, restore.get(i).substring(2));
				ArrayList<String> yy = new ArrayList<String>();
				while (restore.get(i).length() > 0) {
					yy.add(restore.get(i).substring(0,
							restore.get(i).indexOf(",")));
					restore.set(
							i,
							restore.get(i).substring(
									restore.get(i).indexOf(",") + 1));
				}
				// create OneElement
				Labelone l1 = new Labelone();
				if (yy.size() == 1) {
					if (yy.get(0).length() > 3) {
						l1.setText("Y" + yy.get(0).substring(2));
					} else {
						l1.setText("Y" + yy.get(0));
					}
				} else if (yy.size() > 1) {
					if (yy.get(0).length() > 2) {
						l1.setText("Y" + yy.get(0).substring(0, 2) + "▪");
					} else {
						l1.setText("Y" + yy.get(0).substring(0, 1) + "▪");
					}
				}
				l1.setX(90 + disp[0]);
				l1.setY(60 + disp[1]);
				elementsToDraw.add(new OneElement(new Rectangle2D.Double(l1
						.getX(), l1.getY(), 30, 30), l1));
				for (int k = 0; k < yy.size(); k++) {
					elementsToDraw.get(elementsToDraw.size() - 1).getSignals()
							.add("Y" + yy.get(k));
				}
				curY++;
				//wait for x
			} else if (restore.get(i).substring(0, 1).equals("2")) {
				restore.set(i, restore.get(i).substring(2));
				ArrayList<String> xx = new ArrayList<String>();
				while (restore.get(i).length() > 0) {
					xx.add(restore.get(i).substring(0,
							restore.get(i).indexOf(",")));
					restore.set(
							i,
							restore.get(i).substring(
									restore.get(i).indexOf(",") + 1));
				}
				Labelone l1 = new Labelone();
				if (xx.size() == 1) {
					if (xx.get(0).length() > 3) {
						l1.setText("X" + xx.get(0).substring(2));
					} else {
						l1.setText("X" + xx.get(0));
					}
				} else if (xx.size() > 1) {
					if (xx.get(0).length() > 2) {
						l1.setText("X" + xx.get(0).substring(0, 2) + "▪");
					} else {
						l1.setText("X" + xx.get(0).substring(0, 1) + "▪");
					}
				}
				l1.setX(90 + disp[0]);
				l1.setY(60 + disp[1]);
				elementsToDraw.add(new OneElement(new Rectangle2D.Double(l1
						.getX(), l1.getY(), 30, 30), l1));
				for (int k = 0; k < xx.size(); k++) {
					elementsToDraw.get(elementsToDraw.size() - 1).getSignals()
							.add("X" + xx.get(k));
				}
				curX++;
			}
			
			if (restore.get(i).length() > 5) {
				if (restore.get(i).substring(0, 2).equals("s1")) {
					restore.set(i, restore.get(i).substring(3));
					ArrayList<String> upup = new ArrayList<String>();
					while (restore.get(i).length() > 0) {
						upup.add(restore.get(i).substring(0,
								restore.get(i).indexOf("|")));
						restore.set(
								i,
								restore.get(i).substring(
										restore.get(i).indexOf("|") + 1));
					}

					// System.out.println("s1");
					// for (int j = 0; j < upup.size(); j++) {
					// System.out.println(upup.get(j));
					// System.out.println(upup.get(j).substring(0,
					// upup.get(j).indexOf("(")));
					// System.out.println(upup.get(j).substring(
					// upup.get(j).indexOf("(") + 1,
					// upup.get(j).indexOf(",")));
					// System.out.println(upup.get(j).substring(
					// upup.get(j).indexOf(",") + 1,
					// upup.get(j).indexOf(")")));
					// }

					for (int j = 0; j < upup.size(); j++) {
						disp[0] += 30;
						Labelone l1 = new Labelone();
						l1.setText("↑"
								+ Integer.parseInt(upup.get(j).substring(0,
										upup.get(j).indexOf("("))));
						l1.setX(Integer.parseInt(upup.get(j).substring(
								upup.get(j).indexOf("(") + 1,
								upup.get(j).indexOf(","))));
						l1.setY(Integer.parseInt(upup.get(j).substring(
								upup.get(j).indexOf(",") + 1,
								upup.get(j).indexOf(")"))));
						elementsToDraw.add(new OneElement(
								new Rectangle2D.Double(l1.getX(), l1.getY(),
										30, 30), l1));
						curArrUp++;
					}
				} else if (restore.get(i).substring(0, 2).equals("s2")) {
					restore.set(i, restore.get(i).substring(3));
					ArrayList<String> upup = new ArrayList<String>();
					while (restore.get(i).length() > 0) {
						upup.add(restore.get(i).substring(0,
								restore.get(i).indexOf("|")));
						restore.set(
								i,
								restore.get(i).substring(
										restore.get(i).indexOf("|") + 1));
					}

					for (int j = 0; j < upup.size(); j++) {
						disp[0] += 30;
						Labelone l1 = new Labelone();
						l1.setText("↓"
								+ Integer.parseInt(upup.get(j).substring(0,
										upup.get(j).indexOf("("))));
						l1.setX(Integer.parseInt(upup.get(j).substring(
								upup.get(j).indexOf("(") + 1,
								upup.get(j).indexOf(","))));
						l1.setY(Integer.parseInt(upup.get(j).substring(
								upup.get(j).indexOf(",") + 1,
								upup.get(j).indexOf(")"))));
						elementsToDraw.add(new OneElement(
								new Rectangle2D.Double(l1.getX(), l1.getY(),
										30, 30), l1));
						curArrDown++;
					}
				}
			}
		}
		disp[0] -= 30;
		endPressed();
	}

	// call when save button pressed
	// save the file in matrix form
	private void savePressed() {
		FileNameExtensionFilter filter = new FileNameExtensionFilter(
				"Text files", "txt");

		chooser = new JFileChooser();
		chooser.setCurrentDirectory(new File("c:\\Users\\Admin\\Desktop\\"));
		chooser.setFileFilter(filter);

		int result = chooser.showSaveDialog(null);
		if (result == JFileChooser.CANCEL_OPTION) {
			return;
		}
		PrintWriter out = null;
		File myFile = chooser.getSelectedFile();
		try {
			out = new PrintWriter(new BufferedWriter(new FileWriter(myFile
					.getAbsolutePath().toString() + ".txt")));
		} catch (IOException e) {
			e.printStackTrace();
		}

		for (int i = 0; i < elementsToDraw.size(); i++) {
			if (elementsToDraw.get(i).getSignals().size() > 0) {
				switch (elementsToDraw.get(i).getSignals().get(0)
						.substring(0, 1)) {
				case "Y":
					out.print(1 + ",");
					break;
				case "X":
					out.print(2 + ",");
					break;
				case "↑":
					out.print(0);
					break;
				case "↓":
					out.print(0);
					break;
				}
			}

			for (int j = 0; j < elementsToDraw.get(i).getSignals().size(); j++) {
				if (!elementsToDraw.get(i).getLbl().getText().contains("↑")
						&& !elementsToDraw.get(i).getLbl().getText()
								.contains("↓")) {
					out.print(elementsToDraw.get(i).getSignals().get(j)
							.substring(1)
							+ ",");
				}
			}
			out.print("\n");
		}
		
		// save s after matrix
		out.print("s1,");
		for (int i = 0; i < elementsToDraw.size(); i++) {
			if (elementsToDraw.get(i).getLbl().getText().contains("↑")) {
				out.print(elementsToDraw.get(i).getSignals().get(0)
						.substring(1)
						+ "("
						+ elementsToDraw.get(i).getLbl().getX()
						+ ","
						+ elementsToDraw.get(i).getLbl().getY() + ")|");
			}
		}
		out.print("\n");
		out.print("s2,");
		for (int i = 0; i < elementsToDraw.size(); i++) {
			if (elementsToDraw.get(i).getLbl().getText().contains("↓")) {
				out.print(elementsToDraw.get(i).getSignals().get(0)
						.substring(1)
						+ "("
						+ elementsToDraw.get(i).getLbl().getX()
						+ ","
						+ elementsToDraw.get(i).getLbl().getY() + ")|");
			}
		}

		out.close();

	}

	// ///////////////////////////////////////
	// //////// MouseListener ////////////////
	// ///////////////////////////////////////

	@Override
	public void mouseDragged(MouseEvent e) {
	}

	@Override
	public void mouseMoved(MouseEvent e) {
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		// left double click - remove
		if (findRect(e.getPoint()) > 0 && e.getClickCount() >= 2
				&& e.getButton() == MouseEvent.BUTTON1) {
			removeEl(e);
		}
		// right double click - edit
		if (findRect(e.getPoint()) > 0 && e.getClickCount() >= 2
				&& e.getButton() == MouseEvent.BUTTON3) {
			if (!elementsToDraw.get(findRect(e.getPoint())).getLbl().getText()
					.contains("↑")
					&& !elementsToDraw.get(findRect(e.getPoint())).getLbl()
							.getText().contains("↓")) {
				editPanel(e);
			} else {
				editArrowPanel(e);
			}
		}
	}

	// call when you press double ckick (right) - to edit arrows
	private void editArrowPanel(MouseEvent e) {
		String newText = JOptionPane.showInputDialog(null, "Enter signal:");
		try {
			Integer.parseInt(newText);
			elementsToDraw.get(findRect(e.getPoint())).getSignals().clear();
			elementsToDraw
					.get(findRect(e.getPoint()))
					.getSignals()
					.add(elementsToDraw.get(findRect(e.getPoint())).getLbl()
							.getText().substring(0, 1)
							+ newText);
			if (elementsToDraw.get(findRect(e.getPoint())).getSignals().get(0)
					.length() > 2) {
				elementsToDraw
						.get(findRect(e.getPoint()))
						.getLbl()
						.setText(
								elementsToDraw.get(findRect(e.getPoint()))
										.getSignals().get(0).substring(0, 3));
			} else {
				elementsToDraw
						.get(findRect(e.getPoint()))
						.getLbl()
						.setText(
								elementsToDraw.get(findRect(e.getPoint()))
										.getSignals().get(0).substring(0, 2));
			}
			Panel_Draw.repaint();
		} catch (NumberFormatException e2) {
			JOptionPane.showMessageDialog(null, "Bad input!");
		}
	}
	
	// call when you press double ckick (left) - to del element
	private void removeEl(MouseEvent e) {
		if (elementsToDraw.get(findRect(e.getPoint())).getLbl().getText()
				.equals("end")) {
			y.setEnabled(true);
			x.setEnabled(true);
			end_b.setEnabled(true);
			for (int i = 0; i < rightButtons.size(); i++) {
				rightButtons.get(i).getBut().setEnabled(true);
			}
		}
		final String butText = elementsToDraw.get(findRect(e.getPoint()))
				.getLbl().getText();
		if (butText.contains("↓")) {
			RightBut r1 = new RightBut();
			JButton bi = new JButton();
			bi.setText("↓" + butText.substring(1));
			bi.setFocusable(false);
			bi.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent e) {
					arrDownPressed(butText.substring(1));
					curArrUp--;
					ArrowUp.setText("↑" + curArrUp);
				}
			});
			curArrUp++;
			ArrowUp.setText("↑" + curArrUp);
			r1.setBut(bi);
			r1.setHasActon(true);
			r1.setNumb(Integer.parseInt(butText.substring(1, butText.length())));
			rightButtons.add(r1);
			Panel_ButtonsRight.add(rightButtons.get(rightButtons.size() - 1)
					.getBut());
		} else if (butText.contains("X")) {
			curX--;
			x.setText("X" + curX);
		} else if (butText.contains("Y")) {
			curY--;
			y.setText("Y" + curY);
		}
		elementsToDraw.remove(findRect(e.getPoint()));
		Panel_Draw.repaint();
		Panel_ButtonsRight.updateUI();
	}

	// call when you press double ckick (right) - to edit something(!arrows)
	private void editPanel(MouseEvent e) {
		x.setEnabled(false);
		y.setEnabled(false);
		end_b.setEnabled(false);
		dial = new JDialog(f, "Signals:");
		dial.setSize(300, 240);
		dial.setLocation(Toolkit.getDefaultToolkit().getScreenSize().width / 2,
				Toolkit.getDefaultToolkit().getScreenSize().height / 3);
		dial.setLayout(new BorderLayout());
		dial.setUndecorated(true);
		// //////////// left panel, list of signals ////////////////////////////
		final JScrollPane scrPaneList = new JScrollPane();
		final DefaultListModel<String> model = new DefaultListModel<String>();
		for (int i = 0; i < elementsToDraw.get(findRect(e.getPoint()))
				.getSignals().size(); i++) {
			model.addElement(elementsToDraw.get(findRect(e.getPoint()))
					.getSignals().get(i));
		}
		signalsList = new JList<String>(model);
		scrPaneList.setViewportView(signalsList);
		scrPaneList
				.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		scrPaneList.getVerticalScrollBar().setUnitIncrement(16);
		scrPaneList.setPreferredSize(new Dimension(100, 200));
		scrPaneList.setBorder(new TitledBorder(new LineBorder(new Color(150,
				150, 150), 1, true), "Signals:"));
		dial.add(scrPaneList, BorderLayout.WEST);
		// //////////////////// right panel //////////////////////////////////
		JPanel editButs = new JPanel();
		editButs.setPreferredSize(new Dimension(200, 400));
		// ////////////////////// up panel ///////////////////////////////////
		JPanel up = new JPanel();
		up.setLayout(new BorderLayout());
		up.setPreferredSize(new Dimension(180, 80));
		up.setBorder(new TitledBorder(new LineBorder(new Color(150, 150, 150),
				1, true), "Add new signal:"));
		final JTextField Jtf = new JTextField();
		Jtf.setDocument(new JTextFieldLimit(10));
		JButton add = new JButton("Add");
		final MouseEvent event = e;
		add.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					Integer.parseInt(Jtf.getText());
					elementsToDraw
							.get(findRect(event.getPoint()))
							.getSignals()
							.add(elementsToDraw.get(findRect(event.getPoint()))
									.getLbl().getText().substring(0, 1)
									+ Jtf.getText());
					model.addElement(elementsToDraw
							.get(findRect(event.getPoint())).getLbl().getText()
							.substring(0, 1)
							+ Jtf.getText());
					Jtf.setText("");
				} catch (Exception e2) {
					JOptionPane.showMessageDialog(null, "Bad input!");
					Jtf.setText("");
				}

			}
		});
		up.add(Jtf, BorderLayout.NORTH);
		up.add(add, BorderLayout.CENTER);
		// ////////////////// midle panel //////////////////////////////////////
		JPanel middle = new JPanel();
		middle.setBorder(new TitledBorder(new LineBorder(new Color(150, 150,
				150), 1, true), "Delete selected signal:"));
		middle.setPreferredSize(new Dimension(180, 65));
		JButton remove = new JButton("Remove");
		remove.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (!signalsList.isSelectionEmpty()) {
					elementsToDraw.get(findRect(event.getPoint())).getSignals()
							.remove(signalsList.getSelectedIndex());
					model.remove(signalsList.getSelectedIndex());
				}
			}
		});
		middle.add(remove);
		// ////////////////// down panel ////////////////////////////////////
		JPanel down = new JPanel();
		down.setBorder(new TitledBorder(new LineBorder(
				new Color(150, 150, 150), 1, true), "Save & exit:"));
		down.setPreferredSize(new Dimension(180, 65));
		JButton ok = new JButton("Ok");
		ok.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (elementsToDraw.get(findRect(event.getPoint())).getSignals()
						.isEmpty()) {
					JOptionPane.showMessageDialog(null,
							"Enter one signals or more!");
				} else if (elementsToDraw.get(findRect(event.getPoint()))
						.getSignals().size() > 1) {
					elementsToDraw
							.get(findRect(event.getPoint()))
							.getLbl()
							.setText(
									elementsToDraw
											.get(findRect(event.getPoint()))
											.getSignals().get(0)
											.substring(0, 2)
											+ "▪");
					dial.dispose();
				} else if (elementsToDraw.get(findRect(event.getPoint()))
						.getSignals().size() == 1) {
					if (elementsToDraw.get(findRect(event.getPoint()))
							.getSignals().get(0).length() > 3) {
						elementsToDraw
								.get(findRect(event.getPoint()))
								.getLbl()
								.setText(
										elementsToDraw
												.get(findRect(event.getPoint()))
												.getSignals().get(0)
												.substring(0, 2)
												+ "..");
					} else {
						if (elementsToDraw.get(findRect(event.getPoint()))
								.getSignals().get(0).length() > 2) {
							elementsToDraw
									.get(findRect(event.getPoint()))
									.getLbl()
									.setText(
											elementsToDraw
													.get(findRect(event
															.getPoint()))
													.getSignals().get(0)
													.substring(0, 3));
						} else {
							elementsToDraw
									.get(findRect(event.getPoint()))
									.getLbl()
									.setText(
											elementsToDraw
													.get(findRect(event
															.getPoint()))
													.getSignals().get(0)
													.substring(0, 2));
						}
					}
					dial.dispose();
				}
				x.setEnabled(true);
				y.setEnabled(true);
				end_b.setEnabled(true);
			}
		});
		down.add(ok);

		editButs.add(up);
		editButs.add(middle);
		editButs.add(down);
		dial.add(editButs);
		dial.show();
		if (elementsToDraw.get(findRect(e.getPoint())).getLbl().getText()
				.equals("end")) {
			dial.dispose();
			x.setEnabled(true);
			y.setEnabled(true);
			end_b.setEnabled(true);
		}
		Panel_Draw.repaint();
	}

	@Override
	public void mousePressed(MouseEvent e) {}

	@Override
	public void mouseReleased(MouseEvent e) {}

	@Override
	public void mouseEntered(MouseEvent e) {}

	@Override
	public void mouseExited(MouseEvent e) {}

	// return index of element you pressed
	private int findRect(Point2D point) {
		for (int i = 0; i < elementsToDraw.size(); i++) {
			if (elementsToDraw.get(i).getRect().contains(point)) {
				return i;
			}
		}
		return -1;
	}

	// check if resize panel needed
	private void isWinResizeNeed() {
		if (disp[1] > this.getSize().height - 100) {
			Panel_Draw.setPreferredSize(new Dimension(this.getSize().width,
					this.getSize().height + 3000));
			if (d == false) {
				f.setSize(f.getSize().width + 1, f.getHeight());
				d = true;
			}
		}

	}

	// check if step to next line needed
	private void endLineCheck() {
		if (disp[0] > this.getSize().width - 330) {
			disp[1] += 60;
			disp[0] = -30;
		}
	}

	// check if the end of line coming
	private void endLineCheckX() {
		if (disp[0] > this.getSize().width - 300) {
			disp[1] += 60;
			disp[0] = 0;
		}
	}

	// check if it's beginning of program
	private void beginCheck() {
		if (elementsToDraw.isEmpty()) {
			Labelone l0 = new Labelone();
			l0.setText(" П");
			l0.setX(90 + disp[0]);
			l0.setY(60 + disp[1]);
			elementsToDraw.add(new OneElement(new Rectangle2D.Double(l0.getX(),
					l0.getY(), 30, 30), l0));
			disp[0] += 30;
			rightButtons = new ArrayList<RightBut>();
		}
	}

	// call when new button pressed
	// create new panel
	private void newPressed() {
		scrollPanel.remove(Panel_Draw);
		elementsToDraw = new ArrayList<OneElement>();
		disp[0] = 0;
		disp[1] = 0;
		curY = 0;
		curX = 0;
		curArrUp = 0;
		curArrDown = 0;

		labelDispX = 8;
		y.setEnabled(true);
		x.setEnabled(false);
		isEnd = false;

		// recreate Panel_Draw
		Panel_Draw = new JPanel() {
			public void paintComponent(Graphics g) {
				Graphics2D g2 = (Graphics2D) g;
				super.paintComponent(g);
				drawGrid(g2);

				for (int i = 0; i < elementsToDraw.size(); i++) {
					g2.draw(elementsToDraw.get(i).getRect());
				}

				for (int i = 0; i < elementsToDraw.size(); i++) {
					g2.drawString(elementsToDraw.get(i).getLbl().getText(),
							elementsToDraw.get(i).getLbl().getX() + labelDispX,
							elementsToDraw.get(i).getLbl().getY() + 20);
				}
			}
		};

		Panel_Draw.setBorder(BorderFactory.createLoweredBevelBorder());
		Panel_Draw.setBackground(Color.white);
		scrollPanel.setFocusable(true);
		scrollPanel.setViewportView(Panel_Draw);
		y.setText("Y0");
		x.setText("X0");
		ArrowUp.setText("↑0");
		for (int i = 0; i < rightButtons.size(); i++) {
			rightButtons.remove(i);
		}

		// recreate Panel_ButtonsRight
		scrollPanel_Right.remove(Panel_ButtonsRight);
		Panel_ButtonsRight = new JPanel();
		Panel_ButtonsRight.setBorder(new TitledBorder(new LineBorder(new Color(
				100, 130, 190), 1, true), "↓ Buttons"));
		Panel_ButtonsRight.setPreferredSize(new Dimension(
				f.getSize().width / 12, 1000));
		scrollPanel_Right.setViewportView(Panel_ButtonsRight);

		Panel_ButtonsRight.repaint();
		Panel_Draw.repaint();
		repaint();
	}

	// call when Y button pressed
	private void yPressed() {
		disp[0] += 30;
		if (isBeginning == false) {
			x.setEnabled(true);
			if (rightButtons.isEmpty() == true) {
				end_b.setEnabled(true);
			}
		}

		Labelone l1 = new Labelone();
		l1.setText("Y" + curY);
		l1.setX(90 + disp[0]);
		l1.setY(60 + disp[1]);
		elementsToDraw.add(new OneElement(new Rectangle2D.Double(l1.getX(), l1
				.getY(), 30, 30), l1));
		elementsToDraw.get(elementsToDraw.size() - 1).getSignals()
				.add("Y" + curY);
		curY++;
		y.setText("Y" + curY);

		try {
			Robot r = new Robot();
			int x = MouseInfo.getPointerInfo().getLocation().x;
			int y = MouseInfo.getPointerInfo().getLocation().y;
			r.mouseMove(elementsToDraw.get(elementsToDraw.size() - 1).getLbl()
					.getX() + 25, elementsToDraw.get(elementsToDraw.size() - 1)
					.getLbl().getY() + 85);
			r.mousePress(InputEvent.BUTTON3_MASK);
			r.mouseRelease(InputEvent.BUTTON3_MASK);
			r.mousePress(InputEvent.BUTTON3_MASK);
			r.mouseRelease(InputEvent.BUTTON3_MASK);
			r.mouseMove(x, y);

		} catch (AWTException e) {
			e.printStackTrace();
		}

		Panel_Buttons.repaint();
		repaint();
	}

	// call when X button pressed
	private void xPressed() {
		disp[0] += 30;

		if (curX >= 0) {
			end_b.setEnabled(false);
		}

		// x
		Labelone l2 = new Labelone();
		l2.setText("X" + curX);
		l2.setX(90 + disp[0]);
		l2.setY(60 + disp[1]);
		elementsToDraw.add(new OneElement(new Rectangle2D.Double(l2.getX(), l2
				.getY(), 30, 30), l2));
		elementsToDraw.get(elementsToDraw.size() - 1).getSignals()
				.add("X" + curX);
		disp[0] += 30;
		curX++;
		x.setText("X" + curX);

		endLineCheckX();

		// ↑
		Labelone l3 = new Labelone();
		l3.setText("↑" + curArrUp);
		l3.setX(90 + disp[0]);
		l3.setY(60 + disp[1]);
		elementsToDraw.add(new OneElement(new Rectangle2D.Double(l3.getX(), l3
				.getY(), 30, 30), l3));
		elementsToDraw.get(elementsToDraw.size() - 1).getSignals()
				.add("↑" + curArrUp);
		curArrUp++;
		ArrowUp.setText("↑" + curArrUp);

		// addButton
		addRightPanButton();

		try {
			Robot r = new Robot();
			int x = MouseInfo.getPointerInfo().getLocation().x;
			int y = MouseInfo.getPointerInfo().getLocation().y;
			r.mouseMove(elementsToDraw.get(elementsToDraw.size() - 2).getLbl()
					.getX() + 25, elementsToDraw.get(elementsToDraw.size() - 2)
					.getLbl().getY() + 85);
			r.mousePress(InputEvent.BUTTON3_MASK);
			r.mouseRelease(InputEvent.BUTTON3_MASK);
			r.mousePress(InputEvent.BUTTON3_MASK);
			r.mouseRelease(InputEvent.BUTTON3_MASK);
			r.mouseMove(x, y);

		} catch (AWTException e) {
			e.printStackTrace();
		}

		Panel_Buttons.repaint();
		repaint();
	}

	// call when adds button to right panel
	private void addRightPanButton() {
		// resize if needed
		if ((curArrUp - 1) % 58 == 0) {
			Panel_ButtonsRight.setPreferredSize(new Dimension(
					f.getSize().width / 12,
					Panel_ButtonsRight.getSize().height * 2));
		}

		// create new button
		RightBut r1 = new RightBut();
		JButton bi = new JButton();
		bi.setText("↓" + (curArrUp - 1));
		bi.setFocusable(false);
		r1.setBut(bi);
		r1.setNumb((curArrUp - 1));
		rightButtons.add(r1);

		i = 0;
		for (i = 0; i < rightButtons.size(); i++) {
			if (rightButtons.get(i).isHasActon() == false) {
				rightButtons.get(i).getBut()
						.addActionListener(new ActionListener() {
							@Override
							public void actionPerformed(ActionEvent e) {
								arrDownPressed((e.getActionCommand())
										.substring(1));
								curArrUp--;
								ArrowUp.setText("↑" + curArrUp);
							}
						});
				rightButtons.get(i).setHasActon(true);
			}
		}

		// add all buttons
		for (int i = 0; i < rightButtons.size(); i++) {
			Panel_ButtonsRight.add(rightButtons.get(i).getBut());
		}

	}

	// call when arrDown button pressed
	private void arrDownPressed(String comand) {
		disp[0] += 30;

		// checkEndLine
		endLineCheckX();

		// add button to arrList to draw on panel
		Labelone l4 = new Labelone();
		l4.setText("↓" + comand);
		l4.setX(90 + disp[0]);
		l4.setY(60 + disp[1]);
		elementsToDraw.add(new OneElement(new Rectangle2D.Double(l4.getX(), l4
				.getY(), 30, 30), l4));
		elementsToDraw.get(elementsToDraw.size() - 1).getSignals()
				.add("↓" + comand);
		curArrDown++;
		if (rightButtons.size() == 1) {
			end_b.setEnabled(true);
		}

		// display buttons
		Panel_ButtonsRight.removeAll();
		for (int i = 0; i < rightButtons.size(); i++) {
			if (rightButtons.get(i).getNumb() == Integer.parseInt(comand)) {
				rightButtons.remove(i);
			}
		}

		// draw all buttons
		for (int i = 0; i < rightButtons.size(); i++) {
			Panel_ButtonsRight.add(rightButtons.get(i).getBut());
		}

		Panel_ButtonsRight.repaint();
		Panel_Draw.repaint();
		ArrowUp.revalidate();
	}

	// call when END button pressed
	private void endPressed() {
		disp[0] += 30;
		if (isBeginning == false) {
			disp[0] += 30;
			Labelone l3 = new Labelone();
			l3.setText("end");
			l3.setX(87 + disp[0]);
			l3.setY(60 + disp[1]);
			elementsToDraw.add(new OneElement(new Rectangle2D.Double(
					l3.getX() + 3, l3.getY(), 30, 30), l3));
			end_b.setEnabled(false);
			y.setEnabled(false);
			x.setEnabled(false);
			for (int i = 0; i < rightButtons.size(); i++) {
				rightButtons.get(i).getBut().setEnabled(false);
			}
			Panel_Buttons.repaint();
			repaint();
			isEnd = true;
		}
	}

}
