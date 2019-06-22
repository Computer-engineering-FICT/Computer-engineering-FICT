package com.tdcs.ui;

import java.awt.CardLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JSeparator;
import javax.swing.JTabbedPane;

import com.tdcs.document.Document;

public class MainWindow {

	private JFrame frame;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainWindow window = new MainWindow();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public MainWindow() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setTitle("Редактор логічних схем алгоритмів (ЛСА)");
		frame.setBounds(100, 100, 640, 480);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		JMenuBar menuBar = new JMenuBar();
		frame.setJMenuBar(menuBar);
		
		JMenu mnFile = new JMenu("File");
		menuBar.add(mnFile);
		
		JMenuItem mntmNewMenuItem = new JMenuItem("New");
		mntmNewMenuItem.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Document.INSTANCE.docNew(frame);
			}
		});
		mnFile.add(mntmNewMenuItem);
		
		JSeparator separator = new JSeparator();
		mnFile.add(separator);
		
		JMenuItem mntmNewMenuItem_1 = new JMenuItem("Open");
		mntmNewMenuItem_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Document.INSTANCE.docOpen(frame);
			}
		});
		mnFile.add(mntmNewMenuItem_1);
		
		JSeparator separator_1 = new JSeparator();
		mnFile.add(separator_1);
		
		JMenuItem mntmSave = new JMenuItem("Save");
		mntmSave.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Document.INSTANCE.docSave(frame);
			}
		});
		mnFile.add(mntmSave);
		
		JMenuItem mntmSaveAs = new JMenuItem("Save as...");
		mntmSaveAs.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Document.INSTANCE.docSaveAs(frame);
			}
		});
		mnFile.add(mntmSaveAs);
		
		JSeparator separator_2 = new JSeparator();
		mnFile.add(separator_2);
		
		JMenuItem mntmClose = new JMenuItem("Close");
		mntmClose.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Document.INSTANCE.docClose(frame);
			}
		});
		
		JMenuItem mntmImportMatrix = new JMenuItem("Import matrix...");
		mntmImportMatrix.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Document.INSTANCE.docImport(frame);
			}
		});
		mnFile.add(mntmImportMatrix);
		
		JMenuItem mntmExportMatrix = new JMenuItem("Export matrix...");
		mntmExportMatrix.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Document.INSTANCE.docExport(frame);
			}
		});
		mnFile.add(mntmExportMatrix);
		
		JMenu mnGraph = new JMenu("Graph");
		mnFile.add(mnGraph);
		
		JMenuItem mntmImport = new JMenuItem("Import");
		mntmImport.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Document.INSTANCE.docGraphImport(frame);
			}
		});
		mnGraph.add(mntmImport);
		
		JMenuItem mntmExport = new JMenuItem("Export");
		mntmExport.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Document.INSTANCE.docGraphExport(frame);
			}
		});
		mnGraph.add(mntmExport);
		
		JSeparator separator_6 = new JSeparator();
		mnFile.add(separator_6);
		
		JSeparator separator_3 = new JSeparator();
		mnFile.add(separator_3);
		mnFile.add(mntmClose);
		
		JMenuItem mntmQuit = new JMenuItem("Quit");
		mntmQuit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Document.INSTANCE.Quit(frame);
			}
		});
		mnFile.add(mntmQuit);
		
		JMenu mnNewMenu = new JMenu("Build");
		menuBar.add(mnNewMenu);
		
		JMenuItem mntmNewMenuItem_2 = new JMenuItem("Check syntax");
		mntmNewMenuItem_2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Document.INSTANCE.docCheckSyntax(frame);
			}
		});
		mnNewMenu.add(mntmNewMenuItem_2);
		
		JMenuItem mntmNewMenuItem_3 = new JMenuItem("Compile");
		mntmNewMenuItem_3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Document.INSTANCE.docCompile(frame);
			}
		});
		mnNewMenu.add(mntmNewMenuItem_3);
		
		JSeparator separator_4 = new JSeparator();
		mnNewMenu.add(separator_4);
		
		JMenuItem mntmValidate = new JMenuItem("Validate");
		mntmValidate.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Document.INSTANCE.docValidate(frame);
			}
		});
		mnNewMenu.add(mntmValidate);
		
		JMenuItem mntmFindAllPath = new JMenuItem("Find all path");
		mntmFindAllPath.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Document.INSTANCE.docFindAllPaths(frame);
			}
		});
		mnNewMenu.add(mntmFindAllPath);
		
		JSeparator separator_5 = new JSeparator();
		mnNewMenu.add(separator_5);
		
		JMenu mnStateMachine = new JMenu("State machine");
		mnNewMenu.add(mnStateMachine);
		
		JMenuItem mntmDoCoding = new JMenuItem("Do coding");
		mntmDoCoding.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Document.INSTANCE.docDoCoding(frame);
			}
		});
		mnStateMachine.add(mntmDoCoding);
		
		JMenuItem mntmBuildGraph = new JMenuItem("Build graph");
		mntmBuildGraph.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				Document.INSTANCE.docDoGraph(frame);
			}
		});
		mnStateMachine.add(mntmBuildGraph);
		frame.getContentPane().setLayout(new CardLayout(0, 0));
		
		JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
		frame.getContentPane().add(tabbedPane, "name_14628380031611");
		
		LogicAlgorithmEditor logicAlgorithmEditor = new LogicAlgorithmEditor();
		tabbedPane.addTab("Logic algorithm", null, logicAlgorithmEditor, null);
		
		FlowchartView flowChartPanel = new FlowchartView();
		tabbedPane.addTab("Flow chart", null, flowChartPanel, null);
		
		GraphView graphPanel = new GraphView ();
		tabbedPane.addTab("Graph", null, graphPanel, null);
	}
}
