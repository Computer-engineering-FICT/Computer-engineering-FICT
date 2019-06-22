package face;

import automat.functions.Function;
import automat.functions.FunctionsWorker;
import automat.moore.*;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 20.10.2010
 * Time: 1:17:35
 * To change this template use File | Settings | File Templates.
 */
class BuildFrame extends JDialog {

    private MainFrame mainFrame;

    private JTabbedPane tabbedPane;
    private GraphPanel graphPanel;
    private CodedGraphPanel codedGraphPanel;
    private JButton codeGraphButton;
    private AutomatTableModel tableModel;
    private JButton buildTableButton;
    private String functionsString;
    private ArrayList<Function> functions;
    private JButton buildFunctionsButton;
    private ArrayList<Function> minimizedFunctions;
    private String minimizedFunctionsString;
    private JButton minimizeFunctionsButton;

    public BuildFrame(MainFrame frame, Rectangle bounds, MooreAutomat automat) {
        super(frame);
        mainFrame = frame;
        setBounds(bounds);
        setMinimumSize(bounds.getSize());
        setResizable(true);
        setModal(true);
        setTitle("Building");
        tabbedPane = new JTabbedPane();
        add(tabbedPane);
        JPanel mooreGraphPanel = new JPanel();
        mooreGraphPanel.setLayout(new BorderLayout());
        graphPanel = new GraphPanel(new GraphModel(automat));
        JPanel mooreGraphButtonsPanel = new JPanel();
        JButton saveGraphButton = new JButton(new SaveGraphAction(this));
        saveGraphButton.setText("Save Graph");
        codeGraphButton = new JButton(new CodeGraphAction(this));
        codeGraphButton.setText("Code Graph");
        JButton closeButton = new JButton(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                setVisible(false);
            }
        });
        closeButton.setText("Close");
        mooreGraphButtonsPanel.add(saveGraphButton);
        mooreGraphButtonsPanel.add(codeGraphButton);
        mooreGraphButtonsPanel.add(closeButton);
        mooreGraphPanel.add(mooreGraphButtonsPanel, BorderLayout.SOUTH);
        mooreGraphPanel.add(graphPanel);
        tabbedPane.addTab("Graph Of Moore Automat", mooreGraphPanel);
    }

    public BuildFrame(MainFrame frame, Rectangle bounds, CodedMooreAutomat automat) {
        super(frame);
        mainFrame = frame;
        setBounds(bounds);
        setMinimumSize(bounds.getSize());
        setResizable(true);
        setModal(true);
        setTitle("Building");
        tabbedPane = new JTabbedPane();
        add(tabbedPane);
        JPanel mooreCodedGraphPanel = new JPanel();
        mooreCodedGraphPanel.setLayout(new BorderLayout());
        codedGraphPanel = new CodedGraphPanel(new GraphModel(automat));
        JPanel mooreGraphButtonsPanel = new JPanel();
        JButton saveCodedGraphButton = new JButton(new SaveCodedGraphAction(this));
        saveCodedGraphButton.setText("Save Graph");
        buildTableButton = new JButton(new BuildTableAction(this));
        buildTableButton.setText("Build Table Of Transitions");
        JButton closeButton = new JButton(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                setVisible(false);
            }
        });
        closeButton.setText("Close");
        mooreGraphButtonsPanel.add(saveCodedGraphButton);
        mooreGraphButtonsPanel.add(buildTableButton);
        mooreGraphButtonsPanel.add(closeButton);
        mooreCodedGraphPanel.add(mooreGraphButtonsPanel, BorderLayout.SOUTH);
        mooreCodedGraphPanel.add(codedGraphPanel);
        tabbedPane.addTab("Coded Graph Of Moore Automat", mooreCodedGraphPanel);
    }

    private class SaveGraphAction extends AbstractAction {

        private BuildFrame frame;

        public SaveGraphAction(BuildFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JFileChooser chooser = mainFrame.getChooser();
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new GraphFileFilter());
            int result = chooser.showSaveDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                if (!chooser.getSelectedFile().getName().endsWith(GraphFileFilter.GRAPH_EXTENSION)) {
                    chooser.setSelectedFile(new File(chooser.getSelectedFile().getAbsolutePath() + GraphFileFilter.GRAPH_EXTENSION));
                }
                try {
                    MooreAutomat.writeToFile(chooser.getSelectedFile(), graphPanel.getModel().getAutomat());
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Can't create file.",
                            "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    }

    private class SaveCodedGraphAction extends AbstractAction {

        private BuildFrame frame;

        public SaveCodedGraphAction(BuildFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JFileChooser chooser = mainFrame.getChooser();
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new CodedGraphFileFilter());
            int result = chooser.showSaveDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                if (!chooser.getSelectedFile().getName().endsWith(CodedGraphFileFilter.CODED_GRAPH_EXTENSION)) {
                    chooser.setSelectedFile(new File(chooser.getSelectedFile().getAbsolutePath() + CodedGraphFileFilter.CODED_GRAPH_EXTENSION));
                }
                try {
                    CodedMooreAutomat.writeToFile(chooser.getSelectedFile(), (CodedMooreAutomat) codedGraphPanel.getModel().getAutomat());
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Can't create file.",
                            "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    }

    private class CodeGraphAction extends AbstractAction {

        private BuildFrame frame;

        public CodeGraphAction(BuildFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JPanel mooreCodedGraphPanel = new JPanel();
            mooreCodedGraphPanel.setLayout(new BorderLayout());
            codedGraphPanel = new CodedGraphPanel(new GraphModel(graphPanel.getModel().getAutomat()));
            JPanel mooreGraphButtonsPanel = new JPanel();
            JButton saveCodedGraphButton = new JButton(new SaveCodedGraphAction(frame));
            saveCodedGraphButton.setText("Save Graph");
            buildTableButton = new JButton(new BuildTableAction(frame));
            buildTableButton.setText("Build Table Of Transitions");
            JButton closeButton = new JButton(new AbstractAction() {
                public void actionPerformed(ActionEvent e) {
                    setVisible(false);
                }
            });
            closeButton.setText("Close");
            mooreGraphButtonsPanel.add(saveCodedGraphButton);
            mooreGraphButtonsPanel.add(buildTableButton);
            mooreGraphButtonsPanel.add(closeButton);
            mooreCodedGraphPanel.add(mooreGraphButtonsPanel, BorderLayout.SOUTH);
            mooreCodedGraphPanel.add(codedGraphPanel);
            tabbedPane.addTab("Coded Graph Of Moore Automat", mooreCodedGraphPanel);
            tabbedPane.setSelectedIndex(1);
            codeGraphButton.setEnabled(false);
        }

    }

    private class SaveTableAction extends AbstractAction {

        private BuildFrame frame;

        public SaveTableAction(BuildFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JFileChooser chooser = mainFrame.getChooser();
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new TextFileFilter());
            int result = chooser.showSaveDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                if (!chooser.getSelectedFile().getName().endsWith(TextFileFilter.TEXT_FILE_EXTENSION)) {
                    chooser.setSelectedFile(new File(chooser.getSelectedFile().getAbsolutePath() + TextFileFilter.TEXT_FILE_EXTENSION));
                }
                try {
                    tableModel.writeToFile(chooser.getSelectedFile());
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Can't create file.",
                            "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    }

    private class BuildTableAction extends AbstractAction {

        private BuildFrame frame;

        public BuildTableAction(BuildFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JPanel tablePanel = new JPanel();
            tablePanel.setLayout(new BorderLayout());
            tableModel = new AutomatTableModel((CodedMooreAutomat) codedGraphPanel.getModel().getAutomat());
            JTable table = new JTable(tableModel);
            JPanel tableButtonsPanel = new JPanel();
            JButton saveTableButton = new JButton(new SaveTableAction(frame));
            saveTableButton.setText("Save Table");
            buildFunctionsButton = new JButton(new BuildFunctionsAction(frame));
            buildFunctionsButton.setText("Build Functions");
            JButton closeButton = new JButton(new AbstractAction() {
                public void actionPerformed(ActionEvent e) {
                    setVisible(false);
                }
            });
            closeButton.setText("Close");
            tableButtonsPanel.add(saveTableButton);
            tableButtonsPanel.add(buildFunctionsButton);
            tableButtonsPanel.add(closeButton);
            tablePanel.add(tableButtonsPanel, BorderLayout.SOUTH);
            tablePanel.add(table);
            tabbedPane.addTab("Table Of Transitions", tablePanel);
            tabbedPane.setSelectedIndex(tabbedPane.getTabCount() - 1);
            buildTableButton.setEnabled(false);
        }

    }

    private class SaveFunctionsAction extends AbstractAction {

        private BuildFrame frame;

        public SaveFunctionsAction(BuildFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JFileChooser chooser = mainFrame.getChooser();
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new TextFileFilter());
            int result = chooser.showSaveDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                if (!chooser.getSelectedFile().getName().endsWith(TextFileFilter.TEXT_FILE_EXTENSION)) {
                    chooser.setSelectedFile(new File(chooser.getSelectedFile().getAbsolutePath() + TextFileFilter.TEXT_FILE_EXTENSION));
                }
                try {
                    PrintWriter output = new PrintWriter(new FileWriter(chooser.getSelectedFile()));
                    output.print(functionsString);
                    output.close();
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Can't create file.",
                            "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }
        
    }

    private class BuildFunctionsAction extends AbstractAction {

        private BuildFrame frame;

        public BuildFunctionsAction(BuildFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JPanel functionsPanel = new JPanel();
            functionsPanel.setLayout(new BorderLayout());
            JTextArea functionsArea = new JTextArea();
            functionsArea.setEditable(false);
            functions = FunctionsWorker.getFunctions(tableModel);
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < functions.size(); i++) {
                builder.append(functions.get(i).toString());
                builder.append("\n");
            }
            functionsString = builder.toString();
            functionsArea.setText(functionsString);
            JPanel functionsButtonPanel = new JPanel();
            JButton saveFunctionsButton = new JButton(new SaveFunctionsAction(frame));
            saveFunctionsButton.setText("Save Functions");
            minimizeFunctionsButton = new JButton(new MinimizeFunctionsAction(frame));
            minimizeFunctionsButton.setText("Minimize Functions");
            JButton closeButton = new JButton(new AbstractAction() {
                public void actionPerformed(ActionEvent e) {
                    setVisible(false);
                }
            });
            closeButton.setText("Close");
            functionsButtonPanel.add(saveFunctionsButton);
            functionsButtonPanel.add(minimizeFunctionsButton);
            functionsButtonPanel.add(closeButton);
            functionsPanel.add(functionsButtonPanel, BorderLayout.SOUTH);
            functionsPanel.add(new JScrollPane(functionsArea));
            tabbedPane.addTab("Functions", functionsPanel);
            tabbedPane.setSelectedIndex(tabbedPane.getTabCount() - 1);
            buildFunctionsButton.setEnabled(false);
        }
        
    }

    private class SaveMinimizedFunctionsAction extends AbstractAction {

        private BuildFrame frame;

        public SaveMinimizedFunctionsAction(BuildFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JFileChooser chooser = mainFrame.getChooser();
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new TextFileFilter());
            int result = chooser.showSaveDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                if (!chooser.getSelectedFile().getName().endsWith(TextFileFilter.TEXT_FILE_EXTENSION)) {
                    chooser.setSelectedFile(new File(chooser.getSelectedFile().getAbsolutePath() + TextFileFilter.TEXT_FILE_EXTENSION));
                }
                try {
                    PrintWriter output = new PrintWriter(new FileWriter(chooser.getSelectedFile()));
                    output.print(minimizedFunctionsString);
                    output.close();
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Error! Can't create file.",
                            "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    }

    private class MinimizeFunctionsAction extends AbstractAction {

        private BuildFrame frame;

        public MinimizeFunctionsAction(BuildFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JPanel minimizedFunctionsPanel = new JPanel();
            minimizedFunctionsPanel.setLayout(new BorderLayout());
            JTextArea minimizedFunctionsArea = new JTextArea();
            minimizedFunctionsArea.setEditable(false);
            minimizedFunctions = FunctionsWorker.minimizeFunctions(FunctionsWorker.prepareFunctionsToMinimization(functions));
            StringBuilder builder = new StringBuilder();
            for (int i = 0; i < minimizedFunctions.size(); i++) {
                builder.append(minimizedFunctions.get(i).toString());
                builder.append("\n");
            }
            minimizedFunctionsString = builder.toString();
            minimizedFunctionsArea.setText(minimizedFunctionsString);
            JPanel minimizedFunctionsButtonPanel = new JPanel();
            JButton saveMinimizedFunctionsButton = new JButton(new SaveMinimizedFunctionsAction(frame));
            saveMinimizedFunctionsButton.setText("Save Minimized Functions");
            JButton analyzeButton = new JButton(new AbstractAction() {
                public void actionPerformed(ActionEvent e) {
                    JOptionPane.showMessageDialog(frame, FunctionsWorker.analyzeMinimization(functions, minimizedFunctions).toString(),
                                                  "Analysys Of Efficiency Of Minimization", JOptionPane.INFORMATION_MESSAGE);
                }
            });
            analyzeButton.setText("Analyze Minimization");
            JButton closeButton = new JButton(new AbstractAction() {
                public void actionPerformed(ActionEvent e) {
                    setVisible(false);
                }
            });
            closeButton.setText("Close");
            minimizedFunctionsButtonPanel.add(saveMinimizedFunctionsButton);
            minimizedFunctionsButtonPanel.add(analyzeButton);
            minimizedFunctionsButtonPanel.add(closeButton);
            minimizedFunctionsPanel.add(minimizedFunctionsButtonPanel, BorderLayout.SOUTH);
            minimizedFunctionsPanel.add(new JScrollPane(minimizedFunctionsArea));
            tabbedPane.addTab("Minimized Functions", minimizedFunctionsPanel);
            tabbedPane.setSelectedIndex(tabbedPane.getTabCount() - 1);
            minimizeFunctionsButton.setEnabled(false);
        }

    }

}