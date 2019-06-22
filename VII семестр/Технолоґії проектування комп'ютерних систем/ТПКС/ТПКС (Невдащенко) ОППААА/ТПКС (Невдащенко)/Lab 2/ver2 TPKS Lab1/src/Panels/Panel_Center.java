package Panels;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;

import javax.swing.BorderFactory;
import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.SwingUtilities;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

import Listeners.mouseListDrawPanel;
import Listeners.mouseListEditPanel;
import Objects.OneElement;

public class Panel_Center extends JPanel implements ActionListener {
	public int curY = 0;
	public int curX = 0;
	public int curArrUp = 0;
	public int curArrDown = 0;

	mouseListDrawPanel mouseList;
	public JPanel Panel_Buttons_Left;
	public JPanel Panel_Buttons_Middle;
	public JPanel Panel_Buttons_Right;
	public JPanel Panel_Buttons;
	public JPanel DrawPanel;
	public JDialog dial;
	public OneElement bufOneElement;
	public ArrayList<JDialog> dials = new ArrayList<JDialog>();
	public JCheckBox cycles;

	public JButton new_b, y, x, ArrowUp, end_b, save, open, del, edit, cut,
			paste, ArrowDown, search;

	public ArrayList<OneElement> els;
	ArrayList<String> ways = new ArrayList<String>();

	public ArrayList<OneElement> getEls() {
		return els;
	}

	Panel_Center() {
		els = new ArrayList<OneElement>();
		setLayout(new BorderLayout());
		mouseList = new mouseListDrawPanel();

		this.setBorder(BorderFactory.createLoweredBevelBorder());
		this.setBackground(Color.white);
		this.setPreferredSize(getPreferredSize());

		// Buttons
		open = new JButton(new ImageIcon("open.png"));
		open.setToolTipText("Open");
		open.addActionListener(this);
		open.setFocusable(false);

		save = new JButton(new ImageIcon("save.png"));
		save.setToolTipText("Save");
		save.addActionListener(this);
		save.setFocusable(false);

		new_b = new JButton(new ImageIcon("new.png"));
		new_b.setToolTipText("New");
		new_b.addActionListener(this);
		new_b.setFocusable(false);

		search = new JButton(new ImageIcon("search.png"));
		search.setToolTipText("Search errors");
		search.addActionListener(this);
		search.setFocusable(false);

		del = new JButton(new ImageIcon("del.png"));
		del.setToolTipText("Delete");
		del.addActionListener(this);
		del.setFocusable(false);

		edit = new JButton(new ImageIcon("edit.png"));
		edit.setToolTipText("Edit");
		edit.addActionListener(this);
		edit.setFocusable(false);

		y = new JButton(new ImageIcon("y.png"));
		y.addActionListener(this);
		y.setFocusable(false);

		x = new JButton(new ImageIcon("x.png"));
		x.addActionListener(this);
		x.setFocusable(false);

		ArrowUp = new JButton(new ImageIcon("up.png"));
		ArrowUp.setFocusable(false);
		ArrowUp.addActionListener(this);

		ArrowDown = new JButton(new ImageIcon("down.png"));
		ArrowDown.setFocusable(false);
		ArrowDown.addActionListener(this);

		end_b = new JButton(new ImageIcon("k.png"));
		end_b.addActionListener(this);
		end_b.setFocusable(false);

		cut = new JButton(new ImageIcon("cut.png"));
		cut.setToolTipText("Cut");
		cut.addActionListener(this);
		cut.setFocusable(false);

		paste = new JButton(new ImageIcon("paste.png"));
		paste.setToolTipText("Paste");
		paste.addActionListener(this);
		paste.setFocusable(false);
		paste.setEnabled(false);

		Panel_Buttons = new JPanel();
		Panel_Buttons_Left = new JPanel();
		JPanel Panel_Buttons_LeftDop = new JPanel();
		Panel_Buttons_LeftDop.setBorder(new TitledBorder(new LineBorder(
				new Color(152, 162, 167), 1, true), "File"));
		Panel_Buttons_LeftDop.add(new_b);
		Panel_Buttons_LeftDop.add(open);
		Panel_Buttons_LeftDop.add(save);
		Panel_Buttons_LeftDop.add(search);

		cycles = new JCheckBox();
		cycles.setToolTipText("Show cycles");
		Panel_Buttons_LeftDop.add(cycles);

		Panel_Buttons_Left.add(Panel_Buttons_LeftDop);
		Panel_Buttons.add(Panel_Buttons_Left, BorderLayout.WEST);

		Panel_Buttons_Middle = new JPanel();
		JPanel Panel_Buttons_MiddleDop = new JPanel();
		Panel_Buttons_MiddleDop.setBorder(new TitledBorder(new LineBorder(
				new Color(152, 162, 167), 1, true), "Edit"));
		Panel_Buttons_MiddleDop.add(del);
		Panel_Buttons_MiddleDop.add(edit);
		Panel_Buttons_MiddleDop.add(cut);
		Panel_Buttons_MiddleDop.add(paste);
		Panel_Buttons_Middle.add(Panel_Buttons_MiddleDop);
		Panel_Buttons.add(Panel_Buttons_Middle, BorderLayout.CENTER);

		Panel_Buttons_Right = new JPanel();
		JPanel Panel_Buttons_RightDop = new JPanel();
		Panel_Buttons_RightDop.setBorder(new TitledBorder(new LineBorder(
				new Color(152, 162, 167), 1, true), "Operation"));
		Panel_Buttons_RightDop.add(y);
		Panel_Buttons_RightDop.add(x);
		Panel_Buttons_RightDop.add(ArrowUp);
		Panel_Buttons_RightDop.add(ArrowDown);
		Panel_Buttons_RightDop.add(end_b);
		Panel_Buttons_Right.add(Panel_Buttons_RightDop);
		Panel_Buttons.add(Panel_Buttons_Right, BorderLayout.EAST);

		// DrawPanel
		DrawPanel = new JPanel();
		DrawPanel.setBackground(Color.white);

		// draw start place ("П")
		beginCheck();

		add(Panel_Buttons, BorderLayout.NORTH);
		add(DrawPanel, BorderLayout.CENTER);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// Cut
		if (e.getSource().equals(cut)) {
			if (findSelected(els) >= 0) {
				cutPressed();
			} else
				JOptionPane.showMessageDialog(null, "Select something");
		}
		// Paste
		if (e.getSource().equals(paste)) {
			if (findSelected(els) >= 0) {
				pastePressed();
			} else
				JOptionPane.showMessageDialog(null, "Select something");
		}
		// Y
		if (e.getSource().equals(y)) {
			yPressed();
		}
		// X
		if (e.getSource().equals(x)) {
			xPressed();
		}
		// ArrUp
		if (e.getSource().equals(ArrowUp)) {
			arrUpPressed();
		}
		// ArrDown
		if (e.getSource().equals(ArrowDown)) {
			arrDownPressed();
		}
		// End
		if (e.getSource().equals(end_b) && end_b.isEnabled()) {
			endPressed();
		}
		// New
		if (e.getSource().equals(new_b)) {
			newPressed();
		}
		// Save
		if (e.getSource().equals(save)) {
			savePressed();
		}
		// Open
		if (e.getSource().equals(open)) {
			openPressed();
		}
		// Search
		if (e.getSource().equals(search)) {
			searchPressed();
		}
		// Del
		if (e.getSource().equals(del)) {
			if (findSelected(els) >= 0) {
				delPressed();
			} else
				JOptionPane.showMessageDialog(null, "Select something");

		}
		// Edit
		if (e.getSource().equals(edit)) {
			if (findSelected(els) >= 0) {
				editPressed();
			} else
				JOptionPane.showMessageDialog(null, "Select something");
		}
	}

	private void searchPressed() {
		int[][] nodeMatr = null;
		ArrayList<Integer> hangingNodes = new ArrayList<Integer>();
		ways.clear();
		if (els.get(els.size() - 1).getLbl().getText().substring(0, 1)
				.equals("↓")) {
			JOptionPane.showMessageDialog(null, "Finish the algorithmus!");
		} else {
			nodeMatr = formNodeMatr(els);
			nodeMatr = correctMatr(nodeMatr);
			nodeMatr = transpMatr(nodeMatr);
			findErrorWays(nodeMatr, "", 0);
			hangingNodes = findHangingNodes(nodeMatr);
			showHangingNodes(hangingNodes, els, Panel_Center.this);

			// printMatr(nodeMatr);
			// System.out.println("All possible ways:");
			// for (int i = 0; i < ways.size(); i++) {
			// System.out.println(ways.get(i).substring(0,
			// ways.get(i).length() - 3));
			// }

			showCycles(ways, els, Panel_Center.this);
		}

	}

	private void showCycles(ArrayList<String> ways2,
			ArrayList<OneElement> els2, Panel_Center pan) {
		int x_popup = 0;
		int y_popup = 0;
		int realN = 0;
		for (int i = 0; i < ways2.size(); i++) {
			if (ways2.get(i).contains("(")) {
				char[] ar = ways2.get(i).toCharArray();
				for (int j = 0; j < ar.length; j++) {
					if (cycles.isSelected() == true) {
						switch (ar[j]) {
						case '(':
							// System.out.println("node = " + ar[j + 2]);
							realN = getRealHangingNode(Integer
									.parseInt(((ar[j + 2]) + "")));
							// System.out.println("realN = " + realN);
							realN -= 2;
							x_popup = (int) els2.get(realN).getLbl()
									.getLocationOnScreen().getX();
							y_popup = (int) els2.get(realN).getLbl()
									.getLocationOnScreen().getY();
							dial = new JDialog(
									SwingUtilities.windowForComponent(this));
							dial.setLocationRelativeTo(null);
							dial.setAlwaysOnTop(true);
							dial.setSize(20, 80);
							dial.setLocation(x_popup - 7, y_popup - 5);
							dial.setUndecorated(true);
							dial.setBackground(new Color(0, 0, 0, 0));
							JLabel l = new JLabel();
							l.setIcon(new ImageIcon("(.png"));
							dial.setLayout(new FlowLayout());
							dial.add(l);
							dial.addMouseListener(new MouseAdapter() {
								public void mousePressed(MouseEvent e) {
									for (int j = 0; j < dials.size(); j++) {
										dials.get(j).dispose();
										dial.dispose();
									}
									dials.clear();
								};
							});
							dial.show();
							dials.add(dial);
							break;
						case ')':
							// System.out.println("node = " + ar[j - 5]);
							realN = getRealHangingNode(Integer
									.parseInt(((ar[j - 5]) + "")));
							// System.out.println("realN = " + realN);
							x_popup = (int) els2.get(realN).getLbl()
									.getLocationOnScreen().getX();
							y_popup = (int) els2.get(realN).getLbl()
									.getLocationOnScreen().getY();
							dial = new JDialog(
									SwingUtilities.windowForComponent(this));
							dial.setLocationRelativeTo(null);
							dial.setAlwaysOnTop(true);
							dial.setSize(20, 80);
							dial.setLocation(x_popup - 18, y_popup - 5);
							dial.setUndecorated(true);
							dial.setBackground(new Color(0, 0, 0, 0));
							JLabel l1 = new JLabel();
							l1.setIcon(new ImageIcon(").png"));
							dial.setLayout(new FlowLayout());
							dial.add(l1);
							dial.addMouseListener(new MouseAdapter() {
								public void mousePressed(MouseEvent e) {
									for (int j = 0; j < dials.size(); j++) {
										dials.get(j).dispose();
										dial.dispose();
									}
									dials.clear();
								};
							});
							dial.show();
							dials.add(dial);
							break;
						}
					}
				}
			}
		}
	}

	private void showHangingNodes(ArrayList<Integer> hangingNodes,
			ArrayList<OneElement> els2, JPanel pan) {
		if (dial != null) {
			// dispose all dialogs
			for (int j = 0; j < dials.size(); j++) {
				dials.get(j).dispose();
				dial.dispose();
				dials.clear();
			}
		}
		int x_popup = 0;
		int y_popup = 0;
		int x_panel = 0;
		int y_panel = 0;
		int node, realN;

		for (int i = 0; i < hangingNodes.size(); i++) {
			node = hangingNodes.get(i);
			realN = getRealHangingNode(node);

			x_popup = (int) els2.get(realN).getLbl().getLocation().getX();
			y_popup = (int) els2.get(realN).getLbl().getLocation().getY();
			x_panel = (int) pan.getLocationOnScreen().getX();
			y_panel = (int) pan.getLocationOnScreen().getY();

			dial = new JDialog(SwingUtilities.windowForComponent(this));
			dial.setLocationRelativeTo(null);
			dial.setAlwaysOnTop(true);
			dial.setSize(130, 100);
			dial.setLocation(x_popup + x_panel - 18, y_popup + y_panel + 155);
			dial.setUndecorated(true);
			dial.setBackground(new Color(155, 155, 155, 0));
			JLabel l = new JLabel();
			l.setIcon(new ImageIcon("popup.png"));
			dial.setLayout(new FlowLayout());
			dial.addMouseListener(new MouseAdapter() {
				public void mousePressed(MouseEvent e) {
					for (int j = 0; j < dials.size(); j++) {
						dials.get(j).dispose();
						dial.dispose();
					}
					dials.clear();
				};
			});
			dials.add(dial);
			dial.add(l);
			dial.show();
		}
	}

	private int getRealHangingNode(int node) {
		int neddedNode = node;
		int counArr, counNodes;
		int realNode = -1;
		counArr = 0;
		counNodes = 0;
		for (int j = 0; j < els.size(); j++) {
			if (els.get(j).getLbl().getText().substring(0, 1).equals("↑")
					|| els.get(j).getLbl().getText().substring(0, 1)
							.equals("↓")) {
				counArr++;
			} else {
				counNodes++;
			}
			if ((counNodes - 1) == neddedNode) {
				break;
			}
		}

		realNode = counNodes + counArr - 1;

		// System.out.println("--- enter");
		// System.out.println("realNode = " + realNode);
		// System.out.println("counNodes = " + counNodes);
		// System.out.println("counArr = " + counArr);
		// System.out.println("--- end");

		return realNode;
	}

	private ArrayList<Integer> findHangingNodes(int[][] nodeMatr) {
		ArrayList<Integer> hNode = new ArrayList<Integer>();
		int c = 0;
		for (int i = 0; i < nodeMatr.length; i++) {
			c = 0;
			for (int j = 0; j < nodeMatr.length; j++) {
				if (nodeMatr[j][i] != 0) {
					c++;
				}
			}
			if (c == 0 && i != 0) {
				hNode.add(i);
			}
		}
		return hNode;
	}

	private void findErrorWays(int[][] arr, String w, int cur) {
		String way = w + (cur + 1) + " -> ";
		int count = 0;
		int t = 0;
		for (int i = 0; i < arr.length; i++) {
			if (arr[cur][i] > 0) {
				int tmpIndex;
				if ((tmpIndex = way.indexOf("" + (i + 1))) > -1) {
					if (t != arr[cur][i]) {
						tmpIndex -= 2;
						way = way.substring(0, tmpIndex + 1) + "("
								+ way.substring(tmpIndex + 1) + ")O ";
						t = arr[cur][i];
						i = -1;
					}
				} else {
					count++;
					findErrorWays(arr, way, i);
				}
			}
		}

		if (count == 0) {
			ways.add(way);
		}
	}

	private int[][] transpMatr(int[][] a) {
		int buf;
		int[][] arr = new int[a.length][a.length];
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr.length; j++) {
				buf = a[i][j];
				arr[i][j] = a[j][i];
				arr[j][i] = buf;
			}
		}
		return arr;
	}

	// private String next(int[][] arr, int nodeCur, String w) {
	// System.out.println("NEXT STARTEd - " + (nodeCur + 1));
	// String neWay = w;
	// for (int i = 0; i < arr.length; i++) {
	// System.out.println("\n curent ---  " + (i + 1) + "  ---");
	// if (arr[i][nodeCur] > 0) {
	// if (neWay.contains((i + 1) + "")) {
	// arr[i][nodeCur] = 0;
	// // printMatr(arr);
	// // neWay += " -> " + (i + 1);
	// // neWay = next(arr, i, neWay);
	// // System.out.println("way.contains");
	// // System.out.println("way = " + neWay);
	// } else {
	// neWay += " -> " + (i + 1);
	// // System.out.println("way = " + neWay);
	// neWay = next(arr, i, neWay);
	// }
	// }
	// }
	// System.out.println("NEXT ENDed - " + (nodeCur + 1));
	// return neWay;
	// }

	// private int lineHasMoreOne(int[][] arr, int jj, int ii) {
	// int count = 0;
	// for (int j = jj + 1; j < arr.length; j++) {
	// if (arr[j][ii] == 1) {
	// count++;
	// }
	// }
	// return count;
	// }

	private int[][] correctMatr(int[][] nodeMatr) {
		int[][] m = nodeMatr;
		int c;
		for (int i = 0; i < m.length; i++) {
			c = 0;
			for (int j = 0; j < m.length; j++) {
				if (m[j][i] != 0 && c == 0) {
					c++;
				} else if (m[j][i] != 0 && c > 0) {
					m[j][i] = 2;
				}
			}
		}
		return m;
	}

	private void pastePressed() {
		if (bufOneElement.getLbl().getText().equals("K")) {
			x.setEnabled(false);
			y.setEnabled(false);
			ArrowUp.setEnabled(false);
			els.add(findSelected(els) + 1, bufOneElement);
			paste.setEnabled(false);
		} else if (bufOneElement.getLbl().getText().contains("↓")
				&& els.get(els.size() - 1).getLbl().getText().equals("K")) {
			x.setEnabled(true);
			y.setEnabled(true);
			ArrowUp.setEnabled(true);
			els.add(findSelected(els) + 1, bufOneElement);
			paste.setEnabled(false);
		} else if ((bufOneElement.getLbl().getText().contains("↑") && els
				.get(findSelected(els)).getLbl().getText().substring(0, 1)
				.equals("↑"))
				|| (bufOneElement.getLbl().getText().contains("↑") && els
						.get(findSelected(els) + 1).getLbl().getText()
						.substring(0, 1).equals("↑"))) {
			JOptionPane.showMessageDialog(null, "Possible only one condition");
		} else {
			els.add(findSelected(els) + 1, bufOneElement);
			paste.setEnabled(false);
		}
		invAll();
	}

	private void cutPressed() {
		if (!els.get(findSelected(els)).getLbl().getText().equals("П")) {
			if (els.get(findSelected(els)).getLbl().getText().equals("K")) {
				x.setEnabled(true);
				y.setEnabled(true);
				ArrowUp.setEnabled(true);
			}
			bufOneElement = els.get(findSelected(els));
			els.remove(findSelected(els));
			paste.setEnabled(true);
			invAll();
		} else
			JOptionPane.showMessageDialog(null, "You can't cut this node");
		els.get(els.size() - 1).getLbl().setIcon(new ImageIcon("1p.png"));
	}

	// call when del button pressed
	private void delPressed() {
		if (!els.get(findSelected(els)).getLbl().getText().equals("П")) {
			if (els.get(findSelected(els)).getLbl().getText().equals("K")) {
				x.setEnabled(true);
				y.setEnabled(true);
				ArrowUp.setEnabled(true);
			}
			els.remove(findSelected(els));
			invAll();
		} else
			JOptionPane.showMessageDialog(null, "You can't remove this node");
		els.get(els.size() - 1).getLbl().setIcon(new ImageIcon("1p.png"));
	}

	// call when END button pressed
	private void endPressed() {
		boolean isEndWasPressed = false;
		for (int i = 0; i < els.size(); i++) {
			if (els.get(i).getLbl().getText().equals("K")) {
				isEndWasPressed = true;
			}
		}
		if (isEndWasPressed == false) {
			OneElement e = new OneElement("K");
			e.getLbl().addMouseListener(mouseList);
			els.add(e);
			x.setEnabled(false);
			y.setEnabled(false);
			ArrowUp.setEnabled(false);
			invAll();
		} else
			JOptionPane.showMessageDialog(null, "'K' is existed!");
	}

	// call when new button pressed
	// create new panel
	private void newPressed() {
		for (int j = 0; j < dials.size(); j++) {
			dials.get(j).dispose();
			dial.dispose();
		}
		dials.clear();
		curY = 0;
		curX = 0;
		curArrUp = 0;
		curArrDown = 0;
		x.setEnabled(true);
		y.setEnabled(true);
		ArrowUp.setEnabled(true);
		els.clear();
		beginCheck();
	}

	// call when Panel_Buttons.y button pressed
	private void yPressed() {
		OneElement e = new OneElement("Y" + curY);
		e.getSignals().add("Y" + curY);
		e.getLbl().addMouseListener(mouseList);
		els.add(e);
		curY++;
		invAll();
	}

	// call when Panel_Buttons.x button pressed
	private void xPressed() {
		OneElement e = new OneElement("X" + curX);
		e.getSignals().add("X" + curX);
		e.getLbl().addMouseListener(mouseList);
		els.add(e);
		curX++;
		invAll();
	}

	// call when arrUp button pressed
	private void arrUpPressed() {
		if (!els.get(els.size() - 1).getLbl().getText().substring(0, 1)
				.equals("↑")) {
			OneElement e = new OneElement("↑" + curArrUp);
			e.getSignals().add("↑" + curArrUp);
			e.getLbl().addMouseListener(mouseList);
			els.add(e);
			curArrUp++;
			invAll();
		} else
			JOptionPane.showMessageDialog(null, "Possible only one condition");

	}

	// call when ArrDown button pressed
	private void arrDownPressed() {
		if (els.get(els.size() - 1).getLbl().getText().equals("K")) {
			x.setEnabled(true);
			y.setEnabled(true);
			ArrowUp.setEnabled(true);
		}
		OneElement e = new OneElement("↓" + curArrDown);
		e.getSignals().add("↓" + curArrDown);
		e.getLbl().addMouseListener(mouseList);
		els.add(e);
		curArrDown++;
		invAll();
	}

	// call when pressing Panel_Buttons.open button
	// Panel_Buttons.open file and get info
	private void openPressed() {
	}

	// call when Panel_Buttons.save button pressed
	// Panel_Buttons.save the file in matrix form
	private void savePressed() {
	}

	// call when edit button pressed
	private void editPressed() {
		if (dial != null) {
			// dispose all dialogs
			for (int j = 0; j < dials.size(); j++) {
				dials.get(j).dispose();
				dial.dispose();
				dials.clear();
			}
		}
		dial = new JDialog(SwingUtilities.windowForComponent(this));
		dial.addMouseMotionListener(new mouseListEditPanel(dial));
		dial.setSize(300, 240);
		dial.setLocation(Toolkit.getDefaultToolkit().getScreenSize().width / 3,
				Toolkit.getDefaultToolkit().getScreenSize().height / 3);
		dial.setLayout(new BorderLayout());
		dial.setUndecorated(true);
		dial.setBackground(new Color(155, 155, 155, 50));
		// //////////// left panel, list of signals
		// ////////////////////////////
		final JScrollPane scrPaneList = new JScrollPane();
		final DefaultListModel<String> model = new DefaultListModel<String>();
		for (int i = 0; i < els.get(findSelected(els)).getSignals().size(); i++) {
			model.addElement(els.get(findSelected(els)).getSignals().get(i));
		}

		final JList<String> signalsList = new JList<String>(model);
		scrPaneList.setViewportView(signalsList);
		scrPaneList
				.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		scrPaneList.getVerticalScrollBar().setUnitIncrement(16);
		scrPaneList.setPreferredSize(new Dimension(100, 200));
		scrPaneList.addMouseMotionListener(new mouseListEditPanel(dial));
		scrPaneList.setBorder(new TitledBorder(new LineBorder(new Color(150,
				150, 150), 1, true), "Signals:"));
		dial.add(scrPaneList, BorderLayout.WEST);
		// //////////////////// right panel
		// //////////////////////////////////
		JPanel editButs = new JPanel();
		editButs.setBackground(new Color(0, 0, 0, 0));
		editButs.setPreferredSize(new Dimension(200, 400));
		// ////////////////////// up panel
		// ///////////////////////////////////
		JPanel up = new JPanel();
		up.addMouseMotionListener(new mouseListEditPanel(dial));
		up.setBackground(new Color(0, 0, 0, 0));
		up.setLayout(new BorderLayout());
		up.setPreferredSize(new Dimension(180, 80));
		up.setBorder(new TitledBorder(new LineBorder(new Color(150, 150, 150),
				1, true), "Add new signal:"));
		final JTextField Jtf = new JTextField();
		JButton add = new JButton("Add");
		add.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					Integer.parseInt(Jtf.getText());
					els.get(findSelected(els))
							.getSignals()
							.add(els.get(findSelected(els)).getLbl().getText()
									.substring(0, 1)
									+ Jtf.getText());
					model.addElement(els.get(findSelected(els)).getLbl()
							.getText().substring(0, 1)
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
		// ////////////////// midle panel
		// //////////////////////////////////////
		JPanel middle = new JPanel();
		middle.addMouseMotionListener(new mouseListEditPanel(dial));
		middle.setBackground(new Color(0, 0, 0, 0));
		middle.setBorder(new TitledBorder(new LineBorder(new Color(150, 150,
				150), 1, true), "Delete selected signal:"));
		middle.setPreferredSize(new Dimension(180, 65));
		JButton remove = new JButton("Remove");
		remove.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (!signalsList.isSelectionEmpty()) {
					els.get(findSelected(els)).getSignals()
							.remove(signalsList.getSelectedIndex());
					model.remove(signalsList.getSelectedIndex());
				}
			}
		});
		middle.add(remove);
		// ////////////////// down panel
		// ////////////////////////////////////
		JPanel down = new JPanel();
		down.addMouseMotionListener(new mouseListEditPanel(dial));
		down.setBackground(new Color(0, 0, 0, 0));
		down.setBorder(new TitledBorder(new LineBorder(
				new Color(150, 150, 150), 1, true), "Save & exit:"));
		down.setPreferredSize(new Dimension(180, 65));
		JButton ok = new JButton("Ok");
		ok.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if (els.get(findSelected(els)).getSignals().isEmpty()) {
					JOptionPane.showMessageDialog(null,
							"Enter one signals or more!");
				} else if (els.get(findSelected(els)).getSignals().size() > 1) {
					els.get(findSelected(els))
							.getLbl()
							.setText(
									els.get(findSelected(els)).getSignals()
											.get(0).substring(0, 2)
											+ "▪");
					dial.dispose();
				}
				if (els.get(findSelected(els)).getSignals().size() == 1) {
					if (els.get(findSelected(els)).getSignals().get(0).length() > 3) {
						els.get(findSelected(els))
								.getLbl()
								.setText(
										els.get(findSelected(els)).getSignals()
												.get(0).substring(0, 2)
												+ "..");
					}
					dial.dispose();
				}
			}
		});
		down.add(ok);

		editButs.add(up);
		editButs.add(middle);
		editButs.add(down);

		dial.add(editButs);
		dials.add(dial);
		dial.show();
		if (els.get(findSelected(els)).getLbl().getText().equals("K")
				|| els.get(findSelected(els)).getLbl().getText().equals("П")) {
			dial.dispose();
			JOptionPane.showMessageDialog(null, "You can't edit this node");
			ok.requestFocus();
			invAll();
		}
	}

	// //////////////////////////////////////////////////////////////////////////////////////
	// ////////////////////..M..E..T..H..O..D..S..../////////////////////////////////////////
	// //////////////////////////////////////////////////////////////////////////////////////

	private int[][] formNodeMatr(ArrayList<OneElement> arr) {
		int[][] matr = new int[countRealNodes(arr)][countRealNodes(arr)];
		for (int i = 0; i < arr.size() - 1; i++) {
			// System.out.println("\ncurrent - " +
			// arr.get(i).getLbl().getText());
			switch (arr.get(i).getLbl().getText().substring(0, 1)) {
			case "Y":
				// System.out.print("Y -> ");
				switch (arr.get(i + 1).getLbl().getText().substring(0, 1)) {
				case "Y":
					// System.out.println("Y");
					matr = next_Y_X_K(i, matr);
					break;
				case "X":
					// System.out.println("X");
					matr = next_Y_X_K(i, matr);
					break;
				case "↓":
					// System.out.println("↓");
					// matr = next_arrDown(i, matr);
					break;
				case "↑":
					// System.out.println("↑");
					matr = next_arrUp(i + 1, matr);
					// matr = next_arrDown(i + 1, matr);
					break;
				case "K":
					// System.out.println("K");
					matr = next_Y_X_K(i, matr);
					break;
				}
				break;
			case "X":
				// System.out.print("X -> ");
				switch (arr.get(i + 1).getLbl().getText().substring(0, 1)) {
				case "Y":
					// System.out.println("Y");
					matr = next_Y_X_K(i, matr);
					break;
				case "X":
					// System.out.println("X");
					matr = next_Y_X_K(i, matr);
					break;
				case "↓":
					// System.out.println("↓");
					// matr = next_arrDown(i + 1, matr);
					break;
				case "↑":
					// System.out.println("↑");
					matr = next_arrUp(i + 1, matr);
					matr = next_arrDown(i + 1, matr);
					break;
				case "K":
					// System.out.println("K");
					matr = next_Y_X_K(i, matr);
					break;
				}
				break;
			case "↓":
				matr = next_arrDown(i, matr);
				break;
			case "↑":

				break;
			case "K":
				switch (arr.get(i + 1).getLbl().getText().substring(0, 1)) {
				case "↓":
					// System.out.println("↓");
					matr = next_arrDown(i + 1, matr);
					break;
				}
				break;
			case "П":
				// System.out.print("П -> ");
				switch (arr.get(i + 1).getLbl().getText().substring(0, 1)) {
				case "Y":
					// System.out.println("Y");
					matr = next_Y_X_K(i, matr);
					break;
				case "X":
					// System.out.println("X");
					matr = next_Y_X_K(i, matr);
					break;
				case "↓":
					// System.out.println("↓");
					// matr = next_arrDown(i, matr);
					break;
				case "↑":
					// System.out.println("↑");
					matr = next_arrUp(i + 1, matr);
					// matr = next_arrDown(i + 1, matr);
					break;
				case "K":
					// System.out.println("K");
					matr = next_Y_X_K(i, matr);
					break;
				}
				break;

			}
		}
		return matr;
	}

	private int[][] next_arrDown(int i, int[][] matr) {
		int[][] newMatr = matr;
		if (!els.get(i - 1).getLbl().getText().substring(0, 1).equals("↓")
				&& !els.get(i - 1).getLbl().getText().substring(0, 1)
						.equals("↑")) {
			int prev = i;
			int last = i;
			int c = 0;
			for (int j = i; j < els.size(); j++) {
				if (els.get(j).getLbl().getText().substring(0, 1).equals("↓")
						|| els.get(j).getLbl().getText().substring(0, 1)
								.equals("↑")) {
					// System.out.println("c++  " +
					// els.get(j).getLbl().getText());
					c++;
				} else {
					last += c;
					break;
				}
			}

			int c1 = 0;
			int j = i;
			while (els.get(j).getLbl().getText().substring(0, 1).equals("↓")
					|| els.get(j).getLbl().getText().substring(0, 1)
							.equals("↑")) {
				c1++;
				// System.out.println("c++  " +
				// els.get(j).getLbl().getText()+"j="+j);
				j--;
			}
			prev -= c1;
			// for (int j = i; j < 0; j--) {
			// System.out.println(els.get(j).getLbl().getText());
			// if (els.get(j).getLbl().getText().substring(0, 1).equals("↓")
			// || els.get(j).getLbl().getText().substring(0, 1)
			// .equals("↑")) {
			// c++;
			// System.out.println("c++  " + els.get(j).getLbl().getText());
			// } else {
			// prev -= c;
			// System.out.println("prev -= c;");
			// break;
			// }
			// }
			// prev--;
			// System.out.println("prev = " + (prev));
			// System.out.println("last = " + (last));
			// System.out
			// .println("prev1 = " + (prev - countFalseNodes(els, prev)));
			// System.out
			// .println("last1 = " + (last - countFalseNodes(els, last)));
			last = (last - countFalseNodes(els, last));
			prev = (prev - countFalseNodes(els, prev));
			// newMatr[prev][last] = 1;
			newMatr[last][prev] = 1;
		}
		// newMatr[newMatr.length - 1][newMatr.length - 1] = 0;
		return newMatr;
	}

	private int[][] next_arrUp(int up, int[][] matr) {
		int[][] newMatr = matr;
		for (int down = 0; down < els.size(); down++) {
			if (els.get(down).getLbl().getText().substring(0, 1).equals("↓"))
				if (els.get(down)
						.getLbl()
						.getText()
						.substring(1, els.get(down).getLbl().getText().length())
						.equals(els
								.get(up)
								.getLbl()
								.getText()
								.substring(1,
										els.get(up).getLbl().getText().length()))) {
					// System.out.println("↑" + up + "  ↓" + down);
					if (down < up) {
						// System.out.println("countFalseNodes(els, k) = "
						// + countFalseNodes(els, up - 1));
						// System.out.println("countFalseNodes(els, j) = "
						// + countFalseNodes(els, findNextRealNode(down)));

						// int indJ = (down + countFalseNodes(els,
						// findNextRealNode(down))-1);
						int indJ = findNextRealNode(down)
								- countFalseNodes(els, findNextRealNode(down));
						int indK = (up - countFalseNodes(els, up - 1));
						// System.out.println("indJ=" + indJ);
						// System.out.println("indK=" + indK);
						newMatr[indJ][indK - 1] = 1;
						// newMatr[indK - 1][indJ - 1] = 1;
					} else {
						// System.out.println("countFalseNodes(els, up) = "
						// + countFalseNodes(els, up - 1));
						// System.out.println("countFalseNodes(els, down) = "
						// + countFalseNodes(els, findNextRealNode(down)));

						int indJ = findNextRealNode(down)
								- countFalseNodes(els, findNextRealNode(down));
						int indK = (up - countFalseNodes(els, up - 1));
						newMatr[indJ][indK - 1] = 1;
						// newMatr[indK - 1][indJ + 1] = 1;
					}

				}
		}
		return newMatr;
	}

	private int[][] next_Y_X_K(int i, int[][] matr) {
		int[][] newMatr = matr;
		int ind = (i - countFalseNodes(els, i));
		// System.out.println("ind = " + ind);
		// newMatr[ind][ind + 1] = 1;
		newMatr[ind + 1][ind] = 1;
		return newMatr;
	}

	private int findNextRealNode(int i) {
		int index = i;
		for (int j = i; j < els.size(); j++) {
			if (els.get(j).getLbl().getText().substring(0, 1).equals("↓")
					|| els.get(j).getLbl().getText().substring(0, 1)
							.equals("↑")) {
				index++;
			} else {
				break;
			}
		}
		return index;
	}

	private void printMatr(int[][] matr) {
		System.out.println("\n Node matrix:");
		System.out.print("    ");
		for (int i = 0; i < matr.length; i++) {
			System.out.print(i + 1 + ".\t");
			if (i == matr.length - 1) {
				System.out.println();
			}
		}
		System.out.println();
		for (int i = 0; i < matr.length; i++) {
			System.out.print(i + 1 + ".  ");
			for (int j = 0; j < matr[0].length; j++) {
				System.out.print(matr[i][j] + "\t");
			}
			System.out.println("\n");
		}
	}

	private int countRealNodes(ArrayList<OneElement> arr) {
		int c = 0;
		for (int i = 0; i < arr.size(); i++) {
			if (!arr.get(i).getLbl().getText().contains("↑")
					&& !arr.get(i).getLbl().getText().contains("↓")) {
				c++;
			}
		}
		return c;
	}

	private int countFalseNodes(ArrayList<OneElement> arr, int n) {
		int c = 0;
		for (int i = 0; i < n; i++) {
			if (arr.get(i).getLbl().getText().contains("↑")
					|| arr.get(i).getLbl().getText().contains("↓")) {
				c++;
			}
		}
		return c;
	}

	// check if it's beginning of program
	private void beginCheck() {
		if (els.isEmpty()) {
			OneElement e = new OneElement("П");
			e.getSignals().add("↑" + curArrUp);
			e.getLbl().addMouseListener(mouseList);
			els.add(e);
			invAll();
		}
	}

	private int findSelected(ArrayList<OneElement> ar) {
		int s = -1;
		for (int i = 0; i < ar.size(); i++) {
			if (ar.get(i).getLbl().getIcon().toString().equals("1p.png")) {
				s = i;
			}
		}
		return s;
	}

	public void invAll() {
		checkAll();

		DrawPanel.removeAll();
		for (int i = 0; i < els.size(); i++) {
			DrawPanel.add(els.get(i).getLbl());
		}

		DrawPanel.updateUI();
		Panel_Buttons_Right.updateUI();
		Panel_Buttons_Left.updateUI();
		Panel_Buttons.updateUI();
		updateUI();

		DrawPanel.repaint();
		Panel_Buttons_Right.repaint();
		Panel_Buttons_Left.repaint();
		Panel_Buttons.repaint();
		repaint();
	}

	private void checkAll() {
		if (els.get(els.size() - 1).getLbl().getText().equals("K")) {
			x.setEnabled(false);
			y.setEnabled(false);
			ArrowUp.setEnabled(false);
		}
		if (curArrUp <= curArrDown)
			ArrowDown.setEnabled(false);
		else
			ArrowDown.setEnabled(true);
	}
}
