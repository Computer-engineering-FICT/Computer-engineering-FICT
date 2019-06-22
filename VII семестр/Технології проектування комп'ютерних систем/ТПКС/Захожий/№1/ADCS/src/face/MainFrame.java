package face;

import gsa.GSAFileFilter;
import gsa.GSAModel;
import gsa.GSAPanel;
import gsa.IllegalNodeException;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.*;
import java.util.Scanner;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 12.09.2010
 * Time: 1:57:43
 * To change this template use File | Settings | File Templates.
 */
public class MainFrame extends JFrame {

    private JMenuBar menuBar;
    private JToolBar toolBar;
    private GSAPanel gsaPanel;
    private JLabel statusLabel;
    private JFileChooser chooser;

    private NewAction newAction;
    private OpenAction openAction;
    private SaveAction saveAction;
    private SaveAsAction saveAsAction;
    private CloseAction closeAction;
    private ExitAction exitAction;
    private AboutAction aboutAction;

    private File openedFile;

    public MainFrame(Rectangle bounds) {
        super();
        setBounds(bounds);
        setTitle("Computer-aided Designing of Computer Systems");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        newAction = new NewAction(this);
        openAction = new OpenAction(this);
        saveAction = new SaveAction(this);
        saveAsAction = new SaveAsAction(this);
        closeAction = new CloseAction(this);
        exitAction = new ExitAction(this);
        aboutAction = new AboutAction(this);
        addWindowListener(new WindowHandler(exitAction));
        menuBar = new JMenuBar();
        JMenu fileMenu = new JMenu("File");
        JMenu helpMenu = new JMenu("Help");
        JMenuItem tempItem = new JMenuItem(newAction);
        tempItem.setText("New");
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(openAction);
        tempItem.setText("Open...");
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(saveAction);
        tempItem.setText("Save");
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(saveAsAction);
        tempItem.setText("Save As...");
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(closeAction);
        tempItem.setText("Close");
        fileMenu.add(tempItem);
        fileMenu.addSeparator();
        tempItem = new JMenuItem(exitAction);
        tempItem.setText("Exit");
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(aboutAction);
        tempItem.setText("About...");
        helpMenu.add(tempItem);
        menuBar.add(fileMenu);
        menuBar.add(helpMenu);
        setJMenuBar(menuBar);
        setLayout(new BorderLayout());
        toolBar = new JToolBar(JToolBar.VERTICAL);
        toolBar.setFloatable(false);
        toolBar.setRollover(true);
        JButton tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                gsaPanel.getModel().setActionType(0);
                statusLabel.setText(" ");
            }
        });
        tempButton.setIcon(new ImageIcon("img/no_action.png"));
        tempButton.setToolTipText("No action");
        toolBar.addSeparator();
        tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                gsaPanel.getModel().setActionType(1);
                statusLabel.setText("Adding Begin Node");
            }
        });
        tempButton.setIcon(new ImageIcon("img/begin_node.png"));
        tempButton.setToolTipText("Begin Node");
        tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                gsaPanel.getModel().setActionType(2);
                statusLabel.setText("Adding Operator Node");
            }
        });
        tempButton.setIcon(new ImageIcon("img/operator_node.png"));
        tempButton.setToolTipText("Operator Node");
        tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                gsaPanel.getModel().setActionType(3);
                statusLabel.setText("Adding Logic Node");
            }
        });
        tempButton.setIcon(new ImageIcon("img/logic_node.png"));
        tempButton.setToolTipText("Logic Node");
        tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                gsaPanel.getModel().setActionType(4);
                statusLabel.setText("Adding End Node");
            }
        });
        tempButton.setIcon(new ImageIcon("img/end_node.png"));
        tempButton.setToolTipText("End Node");
        tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                gsaPanel.getModel().setActionType(6);
                statusLabel.setText("Connecting nodes");
            }
        });
        tempButton.setIcon(new ImageIcon("img/line.png"));
        tempButton.setToolTipText("Connect nodes");
        toolBar.addSeparator();
        tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                gsaPanel.getModel().setActionType(5);
                statusLabel.setText("Deleting");
            }
        });
        tempButton.setIcon(new ImageIcon("img/delete_node.png"));
        tempButton.setToolTipText("Delete");
        add(toolBar, BorderLayout.WEST);
        statusLabel = new JLabel(" ");
        add(statusLabel, BorderLayout.SOUTH);
        gsaPanel = new GSAPanel(new GSAModel(), this);
        add(new JScrollPane(gsaPanel));
        chooser = new JFileChooser();
        chooser.setCurrentDirectory(new File("."));
        chooser.addChoosableFileFilter(new GSAFileFilter());
        chooser.setMultiSelectionEnabled(false);
        openedFile = null;
    }

    private class NewAction extends AbstractAction {

        private MainFrame frame;

        public NewAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            if (gsaPanel.getModel().isChanged()) {
                closeAction.actionPerformed(e);
            }
            gsaPanel.setModel(new GSAModel());
            gsaPanel.setVisible(true);
            statusLabel.setText(" ");
            frame.repaint();
        }

    }

    private class OpenAction extends AbstractAction {

        private MainFrame frame;

        public OpenAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            int result = chooser.showOpenDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                try {
                    Scanner input = new Scanner(new BufferedReader(new FileReader(chooser.getSelectedFile())));
                    int n = input.nextInt();
                    int[] nodesTypeMatrix = new int[n];
                    int[][] boundsMatrix = new int[n][];
                    for (int i = 0; i < boundsMatrix.length; i++) {
                        boundsMatrix[i] = new int[4];
                    }
                    int[][] connectivityMatrix = new int[n][];
                    for (int i = 0; i < connectivityMatrix.length; i++) {
                        connectivityMatrix[i] = new int[n];
                    }
                    int[][] signalMatrix = new int[n][];
                    for (int i = 0; i < nodesTypeMatrix.length; i++) {
                        nodesTypeMatrix[i] = input.nextInt();
                    }
                    for (int i = 0; i < boundsMatrix.length; i++) {
                        for (int j = 0; j < boundsMatrix[i].length; j++) {
                            boundsMatrix[i][j] = input.nextInt();
                        }
                    }
                    for (int i = 0; i < connectivityMatrix.length; i++) {
                        for (int j = 0; j < connectivityMatrix[i].length; j++) {
                            connectivityMatrix[i][j] = input.nextInt();
                        }
                    }
                    for (int i = 0; i < signalMatrix.length; i++) {
                        signalMatrix[i] = new int[input.nextInt()];
                    }
                    for (int i = 0; i < signalMatrix.length; i++) {
                        for (int j = 0; j < signalMatrix[i].length; j++) {
                            signalMatrix[i][j] = input.nextInt();
                        }
                    }
                    try {
                        gsaPanel.getModel().setGSA(nodesTypeMatrix, connectivityMatrix, signalMatrix, boundsMatrix);
                        gsaPanel.setVisible(true);
                        openedFile = chooser.getSelectedFile();
                        input.close();
                        statusLabel.setText(" ");
                        frame.repaint();
                    } catch (IllegalNodeException e1) {
                        JOptionPane.showMessageDialog(frame, "Error! Incorrect GSA.",
                                "Error", JOptionPane.ERROR_MESSAGE);
                    }
                } catch (FileNotFoundException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Can't open selected file.",
                            "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    }

    private class SaveAction extends AbstractAction {

        private MainFrame frame;

        public SaveAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            if (openedFile == null) {
                saveAsAction.actionPerformed(e);
            }
            else {
                openedFile.delete();
                try {
                    PrintWriter output = new PrintWriter(new FileWriter(openedFile));
                    int[] nodesTypeMatrix = gsaPanel.getModel().getNodesType();
                    int[][] boundsMatrix = gsaPanel.getModel().getBoundsMatrix();
                    int[][] connectivityMatrix = gsaPanel.getModel().getConnectionMatrix();
                    int[][] signalMatrix = gsaPanel.getModel().getSignalMatrix();
                    output.println(nodesTypeMatrix.length);
                    output.println();
                    for (int i = 0; i < nodesTypeMatrix.length; i++) {
                        output.print(nodesTypeMatrix[i]);
                        output.print(" ");
                    }
                    output.println();
                    for (int i = 0; i < boundsMatrix.length; i++) {
                        output.println();
                        for (int j = 0; j < boundsMatrix[i].length; j++) {
                            output.print(boundsMatrix[i][j]);
                            output.print(" ");
                        }
                    }
                    output.println();
                    for (int i = 0; i < connectivityMatrix.length; i++) {
                        output.println();
                        for (int j = 0; j < connectivityMatrix[i].length; j++) {
                            output.print(connectivityMatrix[i][j]);
                            output.print(" ");
                        }
                    }
                    output.print("\n\n");
                    for (int i = 0; i < signalMatrix.length; i++) {
                        output.print(signalMatrix[i].length);
                        output.print(" ");
                    }
                    output.println();
                    for (int i = 0; i < signalMatrix.length; i++) {
                        output.println();
                        for (int j = 0; j < signalMatrix[i].length; j++) {
                            output.print(signalMatrix[i][j]);
                            output.print(" ");
                        }
                    }
                    output.close();
                    gsaPanel.getModel().setChanged(false);
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Can't create file.",
                            "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    }

    private class SaveAsAction extends AbstractAction {

        private MainFrame frame;

        public SaveAsAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            int result = chooser.showSaveDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                try {
                    if (!chooser.getSelectedFile().getName().endsWith(GSAFileFilter.GSA_EXTENSION)) {
                        chooser.setSelectedFile(new File(chooser.getSelectedFile().getAbsolutePath() + GSAFileFilter.GSA_EXTENSION));
                    }
                    PrintWriter output = new PrintWriter(new FileWriter(chooser.getSelectedFile()));
                    int[] nodesTypeMatrix = gsaPanel.getModel().getNodesType();
                    int[][] boundsMatrix = gsaPanel.getModel().getBoundsMatrix();
                    int[][] connectivityMatrix = gsaPanel.getModel().getConnectionMatrix();
                    int[][] signalMatrix = gsaPanel.getModel().getSignalMatrix();
                    output.println(nodesTypeMatrix.length);
                    output.println();
                    for (int i = 0; i < nodesTypeMatrix.length; i++) {
                        output.print(nodesTypeMatrix[i]);
                        output.print(" ");
                    }
                    output.println();
                    for (int i = 0; i < boundsMatrix.length; i++) {
                        output.println();
                        for (int j = 0; j < boundsMatrix[i].length; j++) {
                            output.print(boundsMatrix[i][j]);
                            output.print(" ");
                        }
                    }
                    output.println();
                    for (int i = 0; i < connectivityMatrix.length; i++) {
                        output.println();
                        for (int j = 0; j < connectivityMatrix[i].length; j++) {
                            output.print(connectivityMatrix[i][j]);
                            output.print(" ");
                        }
                    }
                    output.print("\n\n");
                    for (int i = 0; i < signalMatrix.length; i++) {
                        output.print(signalMatrix[i].length);
                        output.print(" ");
                    }
                    output.println();
                    for (int i = 0; i < signalMatrix.length; i++) {
                        output.println();
                        for (int j = 0; j < signalMatrix[i].length; j++) {
                            output.print(signalMatrix[i][j]);
                            output.print(" ");
                        }
                    }
                    openedFile = chooser.getSelectedFile();
                    output.close();
                    gsaPanel.getModel().setChanged(false);
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Can't create file.",
                            "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    }

    private class CloseAction extends AbstractAction {

        private MainFrame frame;

        public CloseAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            if (gsaPanel.getModel().isChanged()) {
                int result = JOptionPane.showConfirmDialog(frame,
                        "GSA has unsaved changes. Do you want to save them before closing?", "Warning",
                        JOptionPane.YES_NO_CANCEL_OPTION, JOptionPane.WARNING_MESSAGE);
                if (result == JOptionPane.CANCEL_OPTION) {
                    return;
                }
                else {
                    if (result == JOptionPane.YES_OPTION) {
                        saveAction.actionPerformed(e);
                    }
                }

            }
            gsaPanel.setVisible(false);
            frame.remove(gsaPanel);
            openedFile = null;
            statusLabel.setText(" ");
            frame.repaint();
        }

    }

    private class ExitAction extends AbstractAction {

        private MainFrame frame;

        public ExitAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            if (gsaPanel.getModel().isChanged()) {
                closeAction.actionPerformed(e);
            }
            System.exit(0);
        }

    }

    private class AboutAction extends AbstractAction {

        private MainFrame frame;

        public AboutAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JOptionPane.showMessageDialog(frame,
                    "Computer-aided Designing of Computer Systems\nCopyright (c) 2010 Zakhozhyy Ihor",
                    "About", JOptionPane.INFORMATION_MESSAGE);
        }

    }

    private class WindowHandler extends WindowAdapter {

		private ExitAction exitAction;

		public WindowHandler(ExitAction exitAction) {
			this.exitAction = exitAction;
		}

		public void windowClosing(final WindowEvent e) {
            final ActionEvent e2 = new ActionEvent(this, EXIT_ON_CLOSE, "close");
            exitAction.actionPerformed(e2);
            super.windowClosing(e);
		}

	}

}
