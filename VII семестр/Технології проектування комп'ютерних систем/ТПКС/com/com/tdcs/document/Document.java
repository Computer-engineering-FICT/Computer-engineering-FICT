package com.tdcs.document;

import java.awt.Component;
import java.awt.FlowLayout;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.filechooser.FileNameExtensionFilter;

import com.tdcs.compiler.AlgorithmException;
import com.tdcs.compiler.LogicAlgorithmParser;
import com.tdcs.compiler.ModelCompiler;
import com.tdcs.compiler.SyntaxException;
import com.tdcs.model.Element;
import com.tdcs.model.Node;
import com.tdcs.model.NodeMatrix;
import com.tdcs.model.fsm.FsmCompiler;
import com.tdcs.model.fsm.State;

public class Document implements DocumentListener {
	public static final Document INSTANCE = new Document();

	private String algorithmString = "";
	private File file = null;
	private HashSet<DocumentListener> listeners;
	private FileNameExtensionFilter matrixFilter;
	private JFileChooser matrixFileChooser;
	private FileNameExtensionFilter strFilter;
	private JFileChooser strFileChooser;
	private List<Hint> hints = new ArrayList<Hint>();

	private List<Node> nodes = null;
	private boolean nodesUptodate = false;

	private List<State> states = null;

	public List<Node> getNodes() {
		if (!nodesUptodate)
			compile();
		return nodes;
	}

	private Document() {
		listeners = new HashSet<DocumentListener>();
		strFilter = new FileNameExtensionFilter("Algorithm matrix files", "alm");
		strFileChooser = new JFileChooser();
		strFileChooser.setFileFilter(strFilter);

		matrixFilter = new FileNameExtensionFilter("Algorithm matrix files",
				"mtx");
		matrixFileChooser = new JFileChooser();
		matrixFileChooser.setFileFilter(matrixFilter);
	}

	public void addDocumentListener(DocumentListener listener) {
		listeners.add(listener);
	}

	public String getAlgorithmString() {
		return algorithmString;
	}

	public void setAlgorithmString(String algorithmString) {
		this.algorithmString = algorithmString;
		nodesUptodate = false;
	}

	public void docNew(Component c) {
		algorithmString = "";
		file = null;
		update(this, "New");
	}

	public void docOpen(Component c) {
		strFileChooser.setDialogTitle("Specify a file to open");
		if (strFileChooser.showOpenDialog(c) == JFileChooser.APPROVE_OPTION) {
			file = strFileChooser.getSelectedFile();
			open();
		}
	}

	public void docSave(Component c) {
		if (file == null)
			docSaveAs(c);
		save();
	}

	public void docSaveAs(Component c) {
		strFileChooser.setDialogTitle("Specify a file to save");
		if (strFileChooser.showSaveDialog(c) == JFileChooser.APPROVE_OPTION) {
			file = strFileChooser.getSelectedFile();
			save();
		}
	}

	public void docClose(Component c) {
		algorithmString = "";
		file = null;
		update(this, "Close");
	}

	public void Quit(Component c) {
		docClose(c);
		c.setVisible(false);
		System.exit(0);
	}

	@Override
	public void update(Object sender, String msg) {
		for (DocumentListener listener : listeners) {
			if (!listener.equals(sender))
				listener.update(sender, msg);
		}

	}

	private void save() {
		if (file != null) {
			FileWriter writer;
			try {
				writer = new FileWriter(file);
				writer.write(algorithmString);
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}

	private void open() {
		if (file != null) {
			try {
				FileReader fileReader = new FileReader(file);
				BufferedReader reader = new BufferedReader(fileReader);
				algorithmString = reader.readLine();
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

			update(this, "New");
		}

	}

	public synchronized void docCheckSyntax(Component c) {
		hints.clear();

		try {
			LogicAlgorithmParser.parse(algorithmString);
		} catch (SyntaxException e) {
			hints.add(e.getHint());
			showHints("Syntax check");
			update(this, "Error0");
			return;
		}

		showMessage("Syntax check", "Syntax check completed!");
	}

	private void compile() {
		nodesUptodate = true;
		List<Element> elements = null;
		nodes = null;

		hints.clear();

		try {
			elements = LogicAlgorithmParser.parse(algorithmString);
		} catch (SyntaxException e) {
			hints.add(e.getHint());
			showHints("Compilation");
			update(this, "Error0");
		}

		try {
			nodes = ModelCompiler.compile(elements);
		} catch (AlgorithmException e) {
			hints.add(e.getH());
			showHints("Compilation");
			update(this, "Error1");

		}
	}

	public synchronized void docCompile(Component c) {
		compile();
		if (nodes != null)
			showMessage("Compilation", "Compiled!");

		update(this, "Build1");
	}

	public synchronized void docValidate(Component c) {
		List<Element> elements = null;
		NodeMatrix matrix = null;
		hints.clear();

		try {
			elements = LogicAlgorithmParser.parse(algorithmString);
		} catch (SyntaxException e) {
			hints.add(e.getHint());
			showHints("Syntax check");
			update(this, "Error0");
			return;
		}

		try {
			nodes = ModelCompiler.compile(elements);
		} catch (AlgorithmException e) {
			hints.add(e.getH());
			showHints("Compilation");
			update(this, "Error1");
			return;
		}

		matrix = NodeMatrix.build(nodes);

		hints.addAll(matrix.validate(elements));

		update(this, "Build1");

		if (hints.size() == 0)
			showMessage("Validation", "Validated!");
		else {
			showHints("Validation");
		}
	}

	private synchronized void showMessage(String tile, String msg) {
		JDialog dialog = new JDialog();
		JLabel label = new JLabel(msg);
		dialog.setLayout(new FlowLayout());
		dialog.setTitle(tile);
		dialog.add(label);
		dialog.setBounds(100, 100, 320, 240);
		dialog.setVisible(true);
	}

	private synchronized void showHints(String tile) {
		JDialog dialog = new JDialog();
		dialog.setLayout(new FlowLayout());
		dialog.setTitle(tile);

		for (Hint h : hints) {
			if (h != null)
				dialog.add(new JLabel(h.getMessage() + ";"));
		}

		dialog.setBounds(100, 100, 320, 240);
		dialog.setVisible(true);
	}

	public synchronized void docImport(Component c) {
		matrixFileChooser.setDialogTitle("Specify a file to open");
		if (matrixFileChooser.showOpenDialog(c) == JFileChooser.APPROVE_OPTION) {
			String str = "";
			try {
				FileReader fileReader = new FileReader(
						matrixFileChooser.getSelectedFile());

				BufferedReader reader = new BufferedReader(fileReader);
				String tmp;
				while ((tmp = reader.readLine()) != null) {
					str += tmp + "\n";
				}
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
				return;
			}

			NodeMatrix matrix;
			List<Node> nodes;

			try {
				matrix = NodeMatrix.parse(str);
				nodes = matrix.buildNodes();
			} catch (Exception e) {
				showMessage("Matrix import", "Matrix file incorrect!");
				return;
			}

			List<Element> elements = ModelCompiler.decompile(nodes);
			algorithmString = LogicAlgorithmParser.print(elements);

			this.nodes = nodes;
			nodesUptodate = true;

			update(this, "New");
		}

	}

	public synchronized void docExport(Component c) {
		NodeMatrix matrix = null;

		compile();

		if (nodes != null) {

			matrix = NodeMatrix.build(nodes);

			matrixFileChooser.setDialogTitle("Specify a file to save");
			if (matrixFileChooser.showSaveDialog(c) == JFileChooser.APPROVE_OPTION) {

				FileWriter writer;
				try {
					writer = new FileWriter(matrixFileChooser.getSelectedFile());
					writer.write(matrix.print());
					writer.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	public synchronized List<Hint> getHints() {
		return hints;
	}

	public synchronized void setHints(List<Hint> hints) {
		this.hints = hints;
	}

	public synchronized void  docFindAllPaths(Component c) {
		NodeMatrix matrix = null;

		compile();

		if (nodes != null) {

			matrix = NodeMatrix.build(nodes);
			List<List<Integer>> paths = matrix.findAllPaths();
			for (List<Integer> path : paths) {
				if (!NodeMatrix.isCycle(path))
					System.out.print("Path: ");
				else
					System.out.print("Cycle: ");
				for (Integer tmp : path) {
					System.out.print(nodes.get(tmp) + "(" + tmp + ")->");
				}

				System.out.println();
			}
		}
	}

	public synchronized void docDoCoding(Component c) {
		compile();
		if (nodes != null) {
			ModelCompiler.coding(nodes);
			update(this, "Build1");
		}
	}

	public synchronized void docDoGraph(Component c) {
		compile();
		if (nodes != null) {
			ModelCompiler.coding(nodes);
			states = FsmCompiler.buildFSM(nodes);
			update(this, "Build1");
			update(this, "Build2");
		}
	}

	public synchronized List<State> getStates() {
		return states;
	}

	@SuppressWarnings("unchecked")
	public synchronized void docGraphImport(Component c) {
		ObjectInput input;
		try {
			input = new ObjectInputStream(new BufferedInputStream(
					new FileInputStream("graph.grf")));
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}

		try {
			Object o = input.readObject();
			if (o instanceof List<?>)
				states = (List<State>) o;
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		update(this, "Build2");

		try {
			input.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public  synchronized void docGraphExport(Component c) {

		compile();
		if (nodes != null) {
			ModelCompiler.coding(nodes);
			states = FsmCompiler.buildFSM(nodes);
			update(this, "Build2");

			ObjectOutput output = null;

			try {
				output = new ObjectOutputStream(new BufferedOutputStream(
						new FileOutputStream("graph.grf")));
			} catch (IOException e) {
				e.printStackTrace();
				return;
			}

			try {
				output.writeObject(states);
			} catch (IOException e1) {
				e1.printStackTrace();
			}

			try {
				output.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
}
