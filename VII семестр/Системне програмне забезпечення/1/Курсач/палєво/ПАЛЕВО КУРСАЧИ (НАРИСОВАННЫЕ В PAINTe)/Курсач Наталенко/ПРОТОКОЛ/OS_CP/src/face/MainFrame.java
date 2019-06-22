package face;

import graph.GraphFileFilter;
import graph.GraphPanel;
import scheduler.Scheduler;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.io.*;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 26.12.10
 * Time: 16:43
 * To change this template use File | Settings | File Templates.
 */
public class MainFrame extends JFrame {

    private JMenuBar menuBar;
    private JTabbedPane tabbedPane;
    private JLabel statusLabel;
    private GraphPanel graphPanel;
    private JFileChooser chooser;
    private File openedFile;
    private JTable table;

    private NewAction newAction;
    private OpenAction openAction;
    private SaveAction saveAction;
    private SaveAsAction saveAsAction;
    private CloseAction closeAction;
    private ExitAction exitAction;
    private LoadAction loadAction;
    private AboutAction aboutAction;

    public MainFrame(Rectangle bounds) {
        super();
        setBounds(bounds);
        setMinimumSize(bounds.getSize());
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setTitle("Операционные системы - Курсовой проект");
        setLayout(new BorderLayout());
        newAction = new NewAction(this);
        openAction = new OpenAction(this);
        saveAction = new SaveAction(this);
        saveAsAction = new SaveAsAction(this);
        closeAction = new CloseAction(this);
        exitAction = new ExitAction(this);
        loadAction = new LoadAction(this);
        aboutAction = new AboutAction(this);
        chooser = new JFileChooser();
        chooser.setCurrentDirectory(new File("."));
        chooser.setMultiSelectionEnabled(false);
        menuBar = new JMenuBar();
        JMenu fileMenu = new JMenu("Файл");
        JMenu actionMenu = new JMenu("Действия");
        JMenu helpMenu = new JMenu("Справка");
        JMenuItem tempItem = new JMenuItem(newAction);
        tempItem.setText("Создать граф");
        tempItem.setMnemonic('N');
        tempItem.setAccelerator(KeyStroke.getKeyStroke('N', KeyEvent.CTRL_MASK));
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(openAction);
        tempItem.setText("Открыть граф...");
        tempItem.setMnemonic('O');
        tempItem.setAccelerator(KeyStroke.getKeyStroke('O', KeyEvent.CTRL_MASK));
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(saveAction);
        tempItem.setText("Сохранить граф");
        tempItem.setMnemonic('S');
        tempItem.setAccelerator(KeyStroke.getKeyStroke('S', KeyEvent.CTRL_MASK));
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(saveAsAction);
        tempItem.setText("Сохранить граф как...");
        tempItem.setMnemonic('S');
        tempItem.setAccelerator(KeyStroke.getKeyStroke('S', (KeyEvent.CTRL_MASK | KeyEvent.SHIFT_MASK)));
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(closeAction);
        tempItem.setText("Закрыть граф");
        tempItem.setMnemonic('W');
        tempItem.setAccelerator(KeyStroke.getKeyStroke('W', KeyEvent.CTRL_MASK));
        fileMenu.add(tempItem);
        fileMenu.addSeparator();
        tempItem = new JMenuItem(exitAction);
        tempItem.setText("Выход");
        tempItem.setMnemonic('E');
        tempItem.setAccelerator(KeyStroke.getKeyStroke('E', KeyEvent.CTRL_MASK));
        fileMenu.add(tempItem);
        tempItem = new JMenuItem(loadAction);
        tempItem.setText("Погрузить граф...");
        tempItem.setMnemonic('L');
        tempItem.setAccelerator(KeyStroke.getKeyStroke('L', KeyEvent.CTRL_MASK));
        actionMenu.add(tempItem);
        tempItem = new JMenuItem(aboutAction);
        tempItem.setText("О программе...");
        helpMenu.add(tempItem);
        menuBar.add(fileMenu);
        menuBar.add(actionMenu);
        menuBar.add(helpMenu);
        setJMenuBar(menuBar);
        tabbedPane = new JTabbedPane();
        graphPanel = new GraphPanel();
        addGraphTab();
        add(tabbedPane);
    }

    private void addGraphTab() {
        JPanel graphEditorPanel = new JPanel();
        graphEditorPanel.setLayout(new BorderLayout());
        JToolBar toolBar = new JToolBar(JToolBar.VERTICAL);
        toolBar.setFloatable(false);
        toolBar.setRollover(true);
        JButton tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                graphPanel.setAction((byte) 0);
                statusLabel.setText("Перемещение вершин");
            }
        });
        tempButton.setToolTipText("Перемещение вершин");
        tempButton.setIcon(new ImageIcon("img/no_action.png"));
        tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                graphPanel.setAction((byte) 1);
                statusLabel.setText("Добавление вершины");
            }
        });
        tempButton.setToolTipText("Добавление вершины");
        tempButton.setIcon(new ImageIcon("img/add_vertex.png"));
        tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                graphPanel.setAction((byte) 2);
                statusLabel.setText("Добавление ребра");
            }
        });
        tempButton.setToolTipText("Добавление ребра");
        tempButton.setIcon(new ImageIcon("img/add_connection.png"));
        tempButton = toolBar.add(new AbstractAction() {
            public void actionPerformed(ActionEvent e) {
                graphPanel.setAction((byte) 3);
                statusLabel.setText("Удаление вершины");
            }
        });
        tempButton.setToolTipText("Удаление вершины");
        tempButton.setIcon(new ImageIcon("img/delete_vertex.png"));
        graphEditorPanel.add(BorderLayout.WEST, toolBar);
        statusLabel = new JLabel(" ");
        graphEditorPanel.add(BorderLayout.SOUTH, statusLabel);
        graphEditorPanel.add(graphPanel);
        tabbedPane.addTab("Граф", graphEditorPanel);
    }

    private void addTableTab() {
        JPanel tablePanel = new JPanel();
        tablePanel.setLayout(new BorderLayout());
        tablePanel.add(new JScrollPane(table));
        tabbedPane.addTab("Погружение", tablePanel);
        tabbedPane.setSelectedIndex(tabbedPane.getTabCount() - 1);
    }

    private class NewAction extends AbstractAction {

        private MainFrame frame;

        public NewAction(MainFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            closeAction.actionPerformed(e);
            graphPanel = new GraphPanel();
            openedFile = null;
            addGraphTab();
        }

    }

    private class OpenAction extends AbstractAction {

        private MainFrame frame;

        public OpenAction(MainFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new GraphFileFilter());
            int result = chooser.showOpenDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                try {
                    closeAction.actionPerformed(e);
                    ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream(chooser.getSelectedFile()));
                    graphPanel = (GraphPanel) inputStream.readObject();
                    inputStream.close();
                    openedFile = new File(chooser.getSelectedFile().getName());
                    addGraphTab();
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Произошла ошибка при открытии файла.", "Ошибка",
                            JOptionPane.ERROR_MESSAGE);
                } catch (ClassNotFoundException e1) {
                    JOptionPane.showMessageDialog(frame, "Файл имеет не совместимый формат.", "Ошибка",
                            JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    }

    private class SaveAction extends AbstractAction {

        private MainFrame frame;

        public SaveAction(MainFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            if (openedFile == null) {
                saveAsAction.actionPerformed(e);
            }
            else {
                if (graphPanel.isModified()) {
                    try {
                        ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream(openedFile));
                        graphPanel.setModified(false);
                        outputStream.writeObject(graphPanel);
                        outputStream.close();
                    } catch (IOException e1) {
                        JOptionPane.showMessageDialog(frame, "Произошла ошибка при записи в файл.", "Ошибка",
                                JOptionPane.ERROR_MESSAGE);
                    }
                }
            }
        }

    }

    private class SaveAsAction extends AbstractAction {

        private MainFrame frame;

        public SaveAsAction(MainFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            chooser.resetChoosableFileFilters();
            chooser.addChoosableFileFilter(new GraphFileFilter());
            int result = chooser.showSaveDialog(frame);
            if (result == JFileChooser.APPROVE_OPTION) {
                if (!chooser.getSelectedFile().getName().toLowerCase().endsWith(GraphFileFilter.GRAPH_EXTENSION)) {
                    chooser.setSelectedFile(new File(chooser.getSelectedFile().getAbsolutePath() +
                            GraphFileFilter.GRAPH_EXTENSION));
                }
                try {
                    ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream(chooser.getSelectedFile()));
                    graphPanel.setModified(false);
                    outputStream.writeObject(graphPanel);
                    outputStream.close();
                    openedFile = new File(chooser.getSelectedFile().getName());
                } catch (IOException e1) {
                    JOptionPane.showMessageDialog(frame, "Произошла ошибка при создании файла.", "Ошибка",
                            JOptionPane.ERROR_MESSAGE);
                }
            }
        }

    }

    private class CloseAction extends AbstractAction {

        private MainFrame frame;

        public CloseAction(MainFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            if ((graphPanel != null) && (graphPanel.isModified())) {
                int result = JOptionPane.showConfirmDialog(frame,
                        "Граф содержит несохраненные изменения. Желаете сохранить их перед закрытием?",
                        "Подтверждение", JOptionPane.YES_NO_OPTION);
                if (result == JOptionPane.YES_OPTION) {
                    if (openedFile != null) {
                        saveAction.actionPerformed(e);
                    }
                    else {
                        saveAsAction.actionPerformed(e);
                    }
                }
            }
            openedFile = null;
            graphPanel = null;
            while (tabbedPane.getTabCount() > 0) {
                tabbedPane.remove(0);
            }
        }

    }

    private class ExitAction extends AbstractAction {

        private MainFrame frame;

        public ExitAction(MainFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            closeAction.actionPerformed(e);
            System.exit(0);
        }

    }

    private class LoadAction extends AbstractAction {

        private MainFrame frame;

        public LoadAction(MainFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            if (graphPanel == null) {
                 JOptionPane.showMessageDialog(frame, "Сначала необходимо создать граф для погружения.", "Ошибка",
                            JOptionPane.ERROR_MESSAGE);
            } else {
                String processorsCountString = JOptionPane.showInputDialog(frame,
                        "Введите количество процессоров в вычислительной системе:");
                int processorsCount = Integer.valueOf(processorsCountString);
                Scheduler scheduler = new Scheduler(processorsCount);
                if (tabbedPane.getTabCount() > 1) {
                    tabbedPane.remove(tabbedPane.getTabCount() - 1);
                    table = null;
                }
                table = new JTable(scheduler.loadGraph(graphPanel.getConnectionMatrix(), graphPanel.getVertexesWeightVector(),
                        graphPanel.getVertexesNameVector()));
                table.setFont(new Font("Sans Serif", Font.BOLD, 14));
                addTableTab();
            }
        }

    }

    private class AboutAction extends AbstractAction {

        private MainFrame frame;

        public AboutAction(MainFrame frame) {
            this.frame = frame;
        }

        public void actionPerformed(ActionEvent e) {
            JOptionPane.showMessageDialog(frame,
                    "Операционные системы - Курсовой проект\nCopyright (c) 2011 Захожий Игорь",
                    "О программе", JOptionPane.INFORMATION_MESSAGE);
        }

    }

}
