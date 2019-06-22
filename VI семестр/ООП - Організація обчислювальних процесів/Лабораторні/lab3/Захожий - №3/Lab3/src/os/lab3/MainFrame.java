package os.lab3;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;

public class MainFrame extends JFrame {

    private JTabbedPane tabbedPane;

    public MainFrame() {
        super();
        setTitle("Лабораторная работа №3 - Алгоритм Корбато");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setMinimumSize(new Dimension(800, 600));
        setExtendedState(JFrame.MAXIMIZED_BOTH);
        tabbedPane = new JTabbedPane();
        JPanel vPanel = new VisualizationPanel();
        WaitTimePanel g1Panel = new WaitTimePanel();
        CPUDowntimePanel g2Panel = new CPUDowntimePanel();
        PriorityPanel g3Panel = new PriorityPanel();
        tabbedPane.add("Потактовая визуализация", vPanel);
        tabbedPane.add("График среднего времени ожидания от интенсивности", g1Panel);
        tabbedPane.add("График процента простоя ресурса от интенсивности", g2Panel);
        tabbedPane.add("График среднего времени ожидания от приоритета", g3Panel);
        tabbedPane.setSelectedIndex(0);
        add(tabbedPane);
    }

    private class VisualizationPanel extends JPanel {

        private JTextField lambdaField;
        private JTextField minLpField;
        private JTextField maxLpField;
        private JTextField tkField;
        private JTextField ltkField;
        private JTextField queuesCountField;
        private JTextField stepsField;
        private JTextArea consoleArea;
        private JButton clearButton;

        private Corbato corbato;
        private int step;

        public VisualizationPanel() {
            super();
            setLayout(new BorderLayout());
            JPanel parametersPanel = new JPanel();
            parametersPanel.setLayout(new GridLayout(8, 1));
            JPanel tempPanel = new JPanel();
            tempPanel.setLayout(new FlowLayout(FlowLayout.RIGHT));
            tempPanel.add(new JLabel("Интенсивность входного потока заявок"));
            lambdaField = new JTextField();
            lambdaField.setColumns(10);
            tempPanel.add(lambdaField);
            parametersPanel.add(tempPanel);
            tempPanel = new JPanel();
            tempPanel.setLayout(new FlowLayout(FlowLayout.RIGHT));
            tempPanel.add(new JLabel("Минимальная длина программы"));
            minLpField = new JTextField();
            minLpField.setColumns(10);
            tempPanel.add(minLpField);
            parametersPanel.add(tempPanel);
            tempPanel = new JPanel();
            tempPanel.setLayout(new FlowLayout(FlowLayout.RIGHT));
            tempPanel.add(new JLabel("Максимальная длина программы"));
            maxLpField = new JTextField();
            maxLpField.setColumns(10);
            tempPanel.add(maxLpField);
            parametersPanel.add(tempPanel);
            tempPanel = new JPanel();
            tempPanel.setLayout(new FlowLayout(FlowLayout.RIGHT));
            tempPanel.add(new JLabel("Время Tk"));
            tkField = new JTextField();
            tkField.setColumns(10);
            tempPanel.add(tkField);
            parametersPanel.add(tempPanel);
            tempPanel = new JPanel();
            tempPanel.setLayout(new FlowLayout(FlowLayout.RIGHT));
            tempPanel.add(new JLabel("Количество байт, переданных за время Tk"));
            ltkField = new JTextField();
            ltkField.setColumns(10);
            tempPanel.add(ltkField);
            parametersPanel.add(tempPanel);
            tempPanel = new JPanel();
            tempPanel.setLayout(new FlowLayout(FlowLayout.RIGHT));
            tempPanel.add(new JLabel("Количество очередей"));
            queuesCountField = new JTextField();
            queuesCountField.setColumns(10);
            tempPanel.add(queuesCountField);
            parametersPanel.add(tempPanel);
            tempPanel = new JPanel();
            tempPanel.setLayout(new FlowLayout(FlowLayout.RIGHT));
            tempPanel.add(new JLabel("Количество тактов при моделировании"));
            stepsField = new JTextField();
            stepsField.setColumns(10);
            tempPanel.add(stepsField);
            parametersPanel.add(tempPanel);
            tempPanel = new JPanel();
            tempPanel.setLayout(new FlowLayout(FlowLayout.RIGHT));
            clearButton = new JButton(new AbstractAction() {
                public void actionPerformed(ActionEvent event) {
                    lambdaField.setEnabled(true);
                    minLpField.setEnabled(true);
                    maxLpField.setEnabled(true);
                    tkField.setEnabled(true);
                    ltkField.setEnabled(true);
                    queuesCountField.setEnabled(true);
                    consoleArea.setText("");
                    ((JButton)event.getSource()).setEnabled(false);
                    corbato = null;
                }
            });
            clearButton.setText("Остановить");
            clearButton.setEnabled(false);
            tempPanel.add(clearButton);
            JButton stepButton = new JButton(new AbstractAction() {
                public void actionPerformed(ActionEvent event) {
                    if (corbato == null) {
                        lambdaField.setEnabled(false);
                        minLpField.setEnabled(false);
                        maxLpField.setEnabled(false);
                        tkField.setEnabled(false);
                        ltkField.setEnabled(false);
                        queuesCountField.setEnabled(false);
                        clearButton.setEnabled(true);
                        step = 0;
                        corbato = new Corbato(
                                Integer.valueOf(queuesCountField.getText()),
                                Integer.valueOf(tkField.getText()),
                                Integer.valueOf(ltkField.getText()),
                                Double.valueOf(lambdaField.getText()),
                                Integer.valueOf(minLpField.getText()),
                                Integer.valueOf(maxLpField.getText()));
                    }
                    consoleArea.setText(consoleArea.getText() + "Такт " +
                            String.valueOf(step + 1) + ":\n" + corbato.tactWithLog() + "\n");
                    step++;
                }
            });
            stepButton.setText("Такт");
            tempPanel.add(stepButton);
            JButton modellingButton = new JButton(new AbstractAction() {
                public void actionPerformed(ActionEvent event) {
                    if (corbato == null) {
                        lambdaField.setEnabled(false);
                        minLpField.setEnabled(false);
                        maxLpField.setEnabled(false);
                        tkField.setEnabled(false);
                        ltkField.setEnabled(false);
                        queuesCountField.setEnabled(false);
                        clearButton.setEnabled(true);
                        step = 0;
                        corbato = new Corbato(
                                Integer.valueOf(queuesCountField.getText()),
                                Integer.valueOf(tkField.getText()),
                                Integer.valueOf(ltkField.getText()),
                                Double.valueOf(lambdaField.getText()),
                                Integer.valueOf(minLpField.getText()),
                                Integer.valueOf(maxLpField.getText()));
                    }
                    int prevStep = step;
                    for (step = step; step < (prevStep + Integer.valueOf(stepsField.getText())); step++) {
                        consoleArea.setText(consoleArea.getText() + "Такт " +
                                String.valueOf(step + 1) + ":\n" + corbato.tactWithLog() + "\n");
                    }
                }
            });
            modellingButton.setText("Моделирование");
            tempPanel.add(modellingButton);
            parametersPanel.add(tempPanel);
            add(parametersPanel, BorderLayout.WEST);
            consoleArea = new JTextArea();
            consoleArea.setBackground(Color.DARK_GRAY);
            Font consoleFont = new Font("Monospaced", Font.PLAIN, 14);
            consoleArea.setEditable(false);
            consoleArea.setAutoscrolls(true);
            consoleArea.setFont(consoleFont);
            consoleArea.setForeground(Color.WHITE);
            JScrollPane consolePane = new JScrollPane(consoleArea); 
            add(consolePane);
            corbato = null;
            step = 0;
        }

    }

    private class WaitTimePanel extends JPanel {

        private Corbato corbato;
        private GraphPanel graph;
        private JTextField maxLambdaField;
        private JTextField minLambdaField;
        private JTextField lambdaStepField;
        private JTextField stepCountField;

        public WaitTimePanel() {
            setLayout(new BorderLayout());
            JPanel optionsPanel = new JPanel();
            optionsPanel.setLayout(new GridLayout(5, 1));
            JPanel tempPanel = new JPanel();
            minLambdaField = new JTextField();
            minLambdaField.setColumns(10);
            tempPanel.add(new JLabel("Минимальная интенсивность входного потока заявок"));
            tempPanel.add(minLambdaField);
            optionsPanel.add(tempPanel);
            tempPanel = new JPanel();
            maxLambdaField = new JTextField();
            maxLambdaField.setColumns(10);
            tempPanel.add(new JLabel("Максимальная интенсивность входного потока заявок"));
            tempPanel.add(maxLambdaField);
            optionsPanel.add(tempPanel);
            tempPanel = new JPanel();
            lambdaStepField = new JTextField();
            lambdaStepField.setColumns(10);
            tempPanel.add(new JLabel("Шаг изменения интенсивности"));
            tempPanel.add(lambdaStepField);
            optionsPanel.add(tempPanel);
            tempPanel = new JPanel();
            stepCountField = new JTextField();
            stepCountField.setColumns(10);
            tempPanel.add(new JLabel("Количество шагов"));
            tempPanel.add(stepCountField);
            optionsPanel.add(tempPanel);
            JButton generateButton = new JButton();
            generateButton.setAction(new AbstractAction() {
                public void actionPerformed(ActionEvent event) {
                    double intensity = Double.valueOf(minLambdaField.getText());
                    graph.setModel(new GraphModel("График среднего времени ожидания от интенсивности",
                            "Интенсивность", "Среднее время ожидания"));
                    while (intensity <= Double.valueOf(maxLambdaField.getText())) {
                        corbato = new Corbato(10, 10, 100, intensity, 1, 10000);
                        for (int i = 0; i < Integer.valueOf(stepCountField.getText()); i++) {
                            corbato.tact();
                        }
                        graph.getModel().add(intensity, corbato.getAverageWaitTime());
                        intensity += Double.valueOf(lambdaStepField.getText());
                    }
                }
            });
            generateButton.setText("Построить");
            tempPanel = new JPanel();
            tempPanel.add(generateButton);
            optionsPanel.add(tempPanel);
            add(optionsPanel, BorderLayout.NORTH);
            graph = new GraphPanel();
            graph.setModel(new GraphModel("График среднего времени ожидания от интенсивности",
                    "Интенсивность", "Среднее время ожидания"));
            add(graph);
        }

    }

    private class CPUDowntimePanel extends JPanel {

        private Corbato corbato;
        private GraphPanel graph;
        private JTextField maxLambdaField;
        private JTextField minLambdaField;
        private JTextField lambdaStepField;
        private JTextField stepCountField;

        public CPUDowntimePanel() {
            setLayout(new BorderLayout());
            JPanel optionsPanel = new JPanel();
            optionsPanel.setLayout(new GridLayout(5, 1));
            JPanel tempPanel = new JPanel();
            minLambdaField = new JTextField();
            minLambdaField.setColumns(10);
            tempPanel.add(new JLabel("Минимальная интенсивность входного потока заявок"));
            tempPanel.add(minLambdaField);
            optionsPanel.add(tempPanel);
            tempPanel = new JPanel();
            maxLambdaField = new JTextField();
            maxLambdaField.setColumns(10);
            tempPanel.add(new JLabel("Максимальная интенсивность входного потока заявок"));
            tempPanel.add(maxLambdaField);
            optionsPanel.add(tempPanel);
            tempPanel = new JPanel();
            lambdaStepField = new JTextField();
            lambdaStepField.setColumns(10);
            tempPanel.add(new JLabel("Шаг изменения интенсивности"));
            tempPanel.add(lambdaStepField);
            optionsPanel.add(tempPanel);
            tempPanel = new JPanel();
            stepCountField = new JTextField();
            stepCountField.setColumns(10);
            tempPanel.add(new JLabel("Количество шагов"));
            tempPanel.add(stepCountField);
            optionsPanel.add(tempPanel);
            JButton generateButton = new JButton();
            generateButton.setAction(new AbstractAction() {
                public void actionPerformed(ActionEvent event) {
                    double intensity = Double.valueOf(minLambdaField.getText());
                    graph.setModel(new GraphModel("График процента простоя ресурса от интенсивности",
                            "Интенсивность", "Процент простоя ресурса"));
                    while (intensity <= Double.valueOf(maxLambdaField.getText())) {
                        corbato = new Corbato(10, 10, 100, intensity, 1, 10000);
                        for (int i = 0; i < Integer.valueOf(stepCountField.getText()); i++) {
                            corbato.tact();
                        }
                        graph.getModel().add(intensity, corbato.getCPUdowntimePercent());
                        intensity += Double.valueOf(lambdaStepField.getText());
                    }
                }
            });
            generateButton.setText("Построить");
            tempPanel = new JPanel();
            tempPanel.add(generateButton);
            optionsPanel.add(tempPanel);
            add(optionsPanel, BorderLayout.NORTH);
            graph = new GraphPanel();
            graph.setModel(new GraphModel("График процента простоя ресурса от интенсивности",
                    "Интенсивность", "Процент простоя ресурса"));
            add(graph);
        }

    }

    private class PriorityPanel extends JPanel {

        private Corbato corbato;
        private GraphPanel graph;
        private JTextField lambdaField;
        private JTextField stepCountField;

        public PriorityPanel() {
            setLayout(new BorderLayout());
            JPanel optionsPanel = new JPanel();
            optionsPanel.setLayout(new GridLayout(3, 1));
            JPanel tempPanel = new JPanel();
            lambdaField = new JTextField();
            lambdaField.setColumns(10);
            tempPanel.add(new JLabel("Интенсивность входного потока заявок"));
            tempPanel.add(lambdaField);
            optionsPanel.add(tempPanel);
            tempPanel = new JPanel();
            stepCountField = new JTextField();
            stepCountField.setColumns(10);
            tempPanel.add(new JLabel("Количество шагов"));
            tempPanel.add(stepCountField);
            optionsPanel.add(tempPanel);
            JButton generateButton = new JButton();
            generateButton.setAction(new AbstractAction() {
                public void actionPerformed(ActionEvent event) {
                    double intensity = Double.valueOf(lambdaField.getText());
                    graph.setModel(new GraphModel("График среднего времени ожидания от приоритета",
                            "Приоритет заявки", "Среднее время ожидания"));
                    for (int priority = 1; priority < 10000; priority++) {
                    	corbato = new Corbato(10, 10, 100, intensity, priority, priority);
                    	for (int i = 0; i < Integer.valueOf(stepCountField.getText()); i++) {
                    		corbato.tact();
                    	}
                    	graph.getModel().add(priority, corbato.getAverageWaitTime());
                    }
                }
            });
            generateButton.setText("Построить");
            tempPanel = new JPanel();
            tempPanel.add(generateButton);
            optionsPanel.add(tempPanel);
            add(optionsPanel, BorderLayout.NORTH);
            graph = new GraphPanel();
            graph.setModel(new GraphModel("График среднего времени ожидания от приоритета",
                    "Приоритет заявки", "Среднее время ожидания"));
            add(graph);
        }

    }

}
