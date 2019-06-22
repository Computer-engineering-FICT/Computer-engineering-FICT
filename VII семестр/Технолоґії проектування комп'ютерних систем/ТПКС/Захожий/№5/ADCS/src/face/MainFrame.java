package face;

import automat.moore.CodedGraphFileFilter;
import automat.moore.CodedMooreAutomat;
import automat.moore.GraphFileFilter;
import automat.moore.MooreAutomat;
import gsa.*;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.concurrent.Executor;

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
    private OpenMooreAutomatGraphAction openMooreAutomatGraphAction;
    private OpenCodedMooreAutomatGraphAction openCodedMooreAutomatGraphAction;
    private ExitAction exitAction;
    private FindAllWaysAndLoopsAction findAllWaysAndLoopsAction;
    private CheckForInfiniteLoopsAction checkForInfiniteLoopsAction;
    private MarkMooreAutomatAction markMooreAutomatAction;
    private BuildMooreAutomatGraphAction buildMooreAutomatGraphAction;
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
        openMooreAutomatGraphAction = new OpenMooreAutomatGraphAction(this);
        openCodedMooreAutomatGraphAction = new OpenCodedMooreAutomatGraphAction(this);
        exitAction = new ExitAction(this);
        findAllWaysAndLoopsAction = new FindAllWaysAndLoopsAction(this);
        checkForInfiniteLoopsAction = new CheckForInfiniteLoopsAction(this);
        markMooreAutomatAction = new MarkMooreAutomatAction(this);
        buildMooreAutomatGraphAction = new BuildMooreAutomatGraphAction(this);
        aboutAction = new AboutAction(this);
        addWindowListener(new WindowHandler(exitAction));
        menuBar = new JMenuBar();
        JMenu fileMenu = new JMenu("File");
        JMenu analyzeMenu = new JMenu("Analyze");
        JMenu executeMenu = new JMenu("Execute");
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
        tempItem = new JMenuItem(openMooreAutomatGraphAction);
        tempItem.setText("Open Graph Of Moore Automat...");
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(openCodedMooreAutomatGraphAction);
        tempItem.setText("Open Coded Graph Of Moore Automat...");
        fileMenu.add(tempItem);
        fileMenu.addSeparator();
        tempItem = new JMenuItem(exitAction);
        tempItem.setText("Exit");
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(findAllWaysAndLoopsAction);
        tempItem.setText("Find All Ways And Loops...");
        analyzeMenu.add(tempItem);
        tempItem = new JMenuItem(checkForInfiniteLoopsAction);
        tempItem.setText("Check GSA For Infinite Loops");
        analyzeMenu.add(tempItem);
        tempItem = new JMenuItem(markMooreAutomatAction);
        tempItem.setText("Mark Algorithm for Moore Automat");
        executeMenu.add(tempItem);
        tempItem = new JMenuItem(buildMooreAutomatGraphAction);
        tempItem.setText("Build Graph of Moore Automat...");
        executeMenu.add(tempItem);
        tempItem = new JMenuItem(aboutAction);
        tempItem.setText("About...");
        helpMenu.add(tempItem);
        menuBar.add(fileMenu);
        menuBar.add(analyzeMenu);
        menuBar.add(executeMenu);
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
        chooser.setMultiSelectionEnabled(false);
        openedFile = null;
    }

    public JFileChooser getChooser() {
        return chooser;
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
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new GSAFileFilter());
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
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new GSAFileFilter());
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

    private class OpenMooreAutomatGraphAction extends AbstractAction {

        private MainFrame frame;

        public OpenMooreAutomatGraphAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new GraphFileFilter());
            int result = chooser.showOpenDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                Rectangle bounds = new Rectangle(getX() + getWidth() / 12, getY() + getHeight() / 12,
                        getWidth() / 12 * 10, getHeight() / 12 * 10);
                BuildFrame dialog = null;
                try {
                    dialog = new BuildFrame(frame, bounds, MooreAutomat.readFromFile(chooser.getSelectedFile()));
                    dialog.setVisible(true);
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Can't open selected file.", "Error"
                            , JOptionPane.ERROR_MESSAGE);
                } catch (ClassNotFoundException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Selected file doesn't contain graph of Moore automat.", "Error"
                            , JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    }

    private class OpenCodedMooreAutomatGraphAction extends AbstractAction {

        private MainFrame frame;

        public OpenCodedMooreAutomatGraphAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new CodedGraphFileFilter());
            int result = chooser.showOpenDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                Rectangle bounds = new Rectangle(getX() + getWidth() / 12, getY() + getHeight() / 12,
                        getWidth() / 12 * 10, getHeight() / 12 * 10);
                BuildFrame dialog = null;
                try {
                    dialog = new BuildFrame(frame, bounds, CodedMooreAutomat.readFromFile(chooser.getSelectedFile()));
                    dialog.setVisible(true);
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Can't open selected file.", "Error"
                            , JOptionPane.ERROR_MESSAGE);
                } catch (ClassNotFoundException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Selected file doesn't contain graph of Moore automat.", "Error"
                            , JOptionPane.ERROR_MESSAGE);
                }
            }
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

    private class FindAllWaysAndLoopsAction extends AbstractAction {

        private MainFrame frame;

        private FindAllWaysAndLoopsAction(MainFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            GSAWorker worker = new GSAWorker(gsaPanel.getModel().getNodesType(),
                    gsaPanel.getModel().getConnectionMatrix(), gsaPanel.getModel().getSignalMatrix());
            try {
                worker.findWaysAndLoops();
                Rectangle bounds = new Rectangle(getX() + getWidth() / 8, getY() + getHeight() / 8,
                        getWidth() / 4 * 3, getHeight() / 4 * 3);
                WaysAndLoopsFrame dialog = new WaysAndLoopsFrame(frame, bounds, worker.getWays(), worker.getLoops());
                dialog.setVisible(true);
            } catch (BeginEndNodesNotFoundException e1) {
                JOptionPane.showMessageDialog(frame, e1.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }

    }

    private class CheckForInfiniteLoopsAction extends AbstractAction {

        private MainFrame frame;

        public CheckForInfiniteLoopsAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            GSAWorker worker = new GSAWorker(gsaPanel.getModel().getNodesType(),
                    gsaPanel.getModel().getConnectionMatrix(), gsaPanel.getModel().getSignalMatrix());
            try {
                worker.findWaysAndLoops();
                if ((worker.getWays().isEmpty()) && (!worker.getLoops().isEmpty())) {
                    ArrayList<ArrayList<Integer>> loopsNodes = worker.getLoopsNodes();
                    ArrayList<Integer> nodesInLoops = new ArrayList<Integer>();
                    for (int i = 0; i < loopsNodes.size(); i++) {
                        for (int j = 0; j < loopsNodes.get(i).size(); j++) {
                            nodesInLoops.add(loopsNodes.get(i).get(j));
                        }
                    }
                    gsaPanel.getModel().setNodesInInfiniteCycles(nodesInLoops);
                    gsaPanel.repaint();
                    JOptionPane.showMessageDialog(frame, "Error! There are infinite loops in GSA.", "Error"
                            , JOptionPane.ERROR_MESSAGE);
                } else {
                    ArrayList<ArrayList<Integer>> waysNodes = worker.getWaysNodes();
                    ArrayList<ArrayList<Integer>> loopsNodes = worker.getLoopsNodes();
                    ArrayList<Integer> nodesInLoops = new ArrayList<Integer>();
                    for (int j = 0; j < loopsNodes.size(); j++) {
                        boolean isInfiniteLoop = true;
                        for (int k = 0; k < loopsNodes.get(j).size(); k++) {
                            for (int z = 0; z < waysNodes.size(); z++) {
                                if (waysNodes.get(z).contains(loopsNodes.get(j).get(k))) {
                                    isInfiniteLoop = false;
                                }
                            }
                        }
                        if (isInfiniteLoop) {
                            for (int i = 0; i < loopsNodes.get(j).size(); i++) {
                                nodesInLoops.add(loopsNodes.get(j).get(i));
                            }
                        }
                    }
                    if (!nodesInLoops.isEmpty()) {
                        gsaPanel.getModel().setNodesInInfiniteCycles(nodesInLoops);
                        gsaPanel.repaint();
                        JOptionPane.showMessageDialog(frame, "Error! There are infinite loops in GSA.", "Error"
                                , JOptionPane.ERROR_MESSAGE);
                    } else {
                        gsaPanel.getModel().setChecked(true);
                        JOptionPane.showMessageDialog(frame, "Success! GSA has not infinite loops.", "Success"
                                , JOptionPane.PLAIN_MESSAGE);
                    }
                }
            } catch (BeginEndNodesNotFoundException e1) {
                JOptionPane.showMessageDialog(frame, e1.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
        }

    }

    private class MarkMooreAutomatAction extends AbstractAction {

        private MainFrame frame;

        public MarkMooreAutomatAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            if (gsaPanel.getModel().isChecked()) {
                gsaPanel.getModel().markForMooreAuromat();
                gsaPanel.repaint();
            }
            else {
                JOptionPane.showMessageDialog(frame, "Error! At first you must check your algorithm.", "Error"
                        , JOptionPane.ERROR_MESSAGE);
            }
        }

    }

    private class BuildMooreAutomatGraphAction extends AbstractAction {

        private MainFrame frame;

        public BuildMooreAutomatGraphAction(MainFrame frame) {
            super();
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            if (gsaPanel.getModel().isMarkedForMooreAutomat()) {
                Rectangle bounds = new Rectangle(getX() + getWidth() / 12, getY() + getHeight() / 12,
                        getWidth() / 12 * 10, getHeight() / 12 * 10);
                BuildFrame dialog = new BuildFrame(frame, bounds, new MooreAutomat(gsaPanel.getModel()));
                dialog.setVisible(true);
            }
            else {
                JOptionPane.showMessageDialog(frame, "Error! At first you must mark your algorithm for Moore automat.", "Error"
                        , JOptionPane.ERROR_MESSAGE);
            }
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
