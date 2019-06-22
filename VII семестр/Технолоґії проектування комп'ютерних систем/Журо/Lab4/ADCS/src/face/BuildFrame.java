package face;

import automat.moore.*;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.IOException;

class BuildFrame extends JDialog {

    private MainFrame mainFrame;

    private JTabbedPane tabbedPane;
    private GraphPanel graphPanel;
    private CodedGraphPanel codedGraphPanel;
    private JButton codeGraphButton;

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
        JButton closeButton = new JButton(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                setVisible(false);
            }
        });
        closeButton.setText("Close");
        mooreGraphButtonsPanel.add(saveCodedGraphButton);
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
            JButton closeButton = new JButton(new AbstractAction() {
                public void actionPerformed(ActionEvent e) {
                    setVisible(false);
                }
            });
            closeButton.setText("Close");
            mooreGraphButtonsPanel.add(saveCodedGraphButton);
            mooreGraphButtonsPanel.add(closeButton);
            mooreCodedGraphPanel.add(mooreGraphButtonsPanel, BorderLayout.SOUTH);
            mooreCodedGraphPanel.add(codedGraphPanel);
            tabbedPane.addTab("Coded Graph Of Moore Automat", mooreCodedGraphPanel);
            tabbedPane.setSelectedIndex(1);
            codeGraphButton.setEnabled(false);
        }

    }

}