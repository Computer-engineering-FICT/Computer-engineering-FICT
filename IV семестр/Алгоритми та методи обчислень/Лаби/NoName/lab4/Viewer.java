package sample;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Formatter;
import java.util.LinkedList;

public class Viewer {

    public static int FRAME_WIDTH = 400;
    public static int FRAME_HEIGHT = 600;

    JPanel panel1 = new JPanel();
    GridLayout g1 = new GridLayout(12, 2);
    JPanel panel2 = new JPanel();
    GridLayout g2 = new GridLayout(2, 1);
    JPanel panel3 = new JPanel();
    GridLayout g3 = new GridLayout(1, 1);

    JLabel label1 = new JLabel("Рівняння");
    //JLabel label2 = new JLabel("2*lgx - (x/2) + 1 = 0");
    JLabel label2 = new JLabel("x*x - sin(PI*x) = 0");
    JLabel label3 = new JLabel("Границя a");
    JTextField field3 = new JTextField(10);
    JLabel label4 = new JLabel("Границя b");
    JTextField field4 = new JTextField(10);
    JLabel label5 = new JLabel("Точність");
    JTextField field5 = new JTextField(10);
    JButton task1 = new JButton("Обчислити");

    JLabel label6 = new JLabel("");
    JLabel label7 = new JLabel("");
    JLabel label7A = new JLabel("");
    JLabel label8 = new JLabel("Результати");
    JTextField field8 = new JTextField(10);

    XYSeriesCollection data = new XYSeriesCollection();

    XYSeries series1 = new XYSeries("Графік рівняння");


    public Viewer() {

        //створюємо вкладку
        JFrame frame = new JFrame();
        frame.setTitle("Лабораторна №4 Сулима О.С.");
        frame.setSize(FRAME_WIDTH, FRAME_HEIGHT);

        panel1.setBackground(Color.white);
        panel1.setLayout(g1);
        panel2.setBackground(Color.white);
        panel2.setLayout(g2);
        panel1.add(label1);
        panel1.add(label2);
        panel1.add(label3);
        panel1.add(field3);
        panel1.add(label4);
        panel1.add(field4);
        panel1.add(label5);
        panel1.add(field5);
        panel1.add(task1);
        panel1.add(label6);
        panel1.add(label7);
        panel1.add(label7A);
        panel1.add(label8);
        panel1.add(field8);


        task1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {

                series1.clear();
                String result = new String();
                double a = Double.parseDouble(field3.getText());
                double b = Double.parseDouble(field4.getText());
                double e = Double.parseDouble(field5.getText());


                Solver solv = new Solver(a, b, e);
                LinkedList<Double> out = solv.getSolution();
                if (out.size() > 0) {
                    Formatter fmt = new Formatter();
                    for (int i = 0; i < out.size(); i++) {
                        fmt.format("%10.5f", out.get(i));
                        result = result + fmt + "; ";
                        // result = result + out.get(i) + "; ";

                    }

                } else {
                    result = "На даному проміжку рішень немає ";
                }

                double a1 = a - (b - a) * 0.2;
                double b1 = b + (b - a) * 0.2;
                int count = 1000;
                double step = (b1 - a1) / count;
                series1.clear();
                Function function = new Function();
                for (int i = 0; i <= (count); i++) {
                    series1.add(a1, function.getValue(a1));
                    a1 += step;
                }
                field8.setText(result);

            }
        });

        data.addSeries(series1);

        JFreeChart chart = ChartFactory.createXYLineChart(
                "Графік рівняння",
                "X",
                "Y",
                data,
                PlotOrientation.VERTICAL,
                true,
                true,
                false);
        final ChartPanel chartPanel = new ChartPanel(chart);

        chartPanel.setPreferredSize(new java.awt.Dimension(300, 400));
        panel2.add(panel1);
        panel2.add(chartPanel);
        frame.add(panel2);
        frame.setVisible(true);
    }
}

