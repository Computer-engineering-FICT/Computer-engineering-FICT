package lab4;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JRootPane;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

public class mFrame extends JFrame {
	private JPanel panel;
	private JPanel butPan;
	private JButton but10 = new JButton("N=10");
	private JButton but15 = new JButton("N=15");
	private JButton but20 = new JButton("N=20");
	private JButton but25 = new JButton("N=25");
	private JButton but30 = new JButton("N=30");
	start t;

	public mFrame() {
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		this.setTitle("Lab 4");
		this.setUndecorated(true);
		this.getRootPane().setWindowDecorationStyle(JRootPane.FRAME);
		this.setBounds(300, 200, 700, 500);
		this.setResizable(false);
		this.setLayout(new BorderLayout());
		panel = new JPanel();
		add(panel, BorderLayout.NORTH);
		butPan = new JPanel();
		add(butPan, BorderLayout.SOUTH);
		butPan.setLayout(new FlowLayout());
		butPan.add(but10);
		but10.addActionListener(a);
		butPan.add(but15);
		but15.addActionListener(a);
		butPan.add(but20);
		but20.addActionListener(a);
		butPan.add(but25);
		but25.addActionListener(a);
		butPan.add(but30);
		but30.addActionListener(a);
	}

	public void addChart(ArrayList<Double> x, ArrayList<Double> y, String name,
			String namex, String namey) {
		XYSeries series = new XYSeries(namey);
		for (int i = 0; i < x.size(); i++) {
			series.add(x.get(i), y.get(i));
		}
		XYDataset xyDataset = new XYSeriesCollection(series);
		JFreeChart chart = ChartFactory.createXYAreaChart(name, namex, namey,
				xyDataset, PlotOrientation.VERTICAL, true, true, true);
		panel.add(new ChartPanel(chart));
	}

	ActionListener a = new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent e) {
			String but_Text = ((JButton) e.getSource()).getText();
			int index = Integer.parseInt(but_Text.substring(2));
			t = new start(index);
			dispose();
		}
	};
}
