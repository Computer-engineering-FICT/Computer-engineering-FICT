package l4;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;


import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.LineBorder;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

public class Plot {
	
	public Plot(Logic l) {
		XYSeries series1 = new XYSeries("y = x^3-2*x^2+7");
		for (double j = -10; j <= 10; j += 0.01){
		      series1.add(j, l.func(j)); 
		}
		
		XYSeries series2 = new XYSeries("y = x^3-2*x^2+7");
		for (double j = Logic.getA(); j <= Logic.getB(); j += 0.01){
		      series2.add(j, l.func(j)); 
		}
		
		XYSeriesCollection data = new XYSeriesCollection(series1);
		XYSeriesCollection data2 = new XYSeriesCollection(series2);
		
		for (int i = 0; i < l.getK() * 2; i += 2) {
			XYSeries h = new XYSeries("Хорда " + (i / 2 + 1));
			XYSeries d = new XYSeries("Дотична " + (i / 2 + 1));
			h.add(l.horda[0][i], l.horda[0][i+1]);
			h.add(l.horda[1][i], l.horda[1][i+1]);
			d.add(l.dotuchna[0][i], l.dotuchna[0][i + 1]);
			d.add(l.dotuchna[1][i], l.dotuchna[1][i + 1]);
			data2.addSeries(h);
			data2.addSeries(d);
		}
		
		JFreeChart chart1 = ChartFactory.createXYLineChart(
	    		"Функція f(x)=x^3-2*x^2+7", 
	    		"x", "y", 
	    		data, 
	    		PlotOrientation.VERTICAL, 
	    		true, true, true);
		
		JFreeChart chart2 = ChartFactory.createXYLineChart(
				"Візуалізація покрокового знаходження кореня", 
				"x", "y", 
				data2, 
				PlotOrientation.VERTICAL, 
				true, true, true);
		
	    ChartPanel chartPanel1 = new ChartPanel(chart1);
	    ChartPanel chartPanel2 = new ChartPanel(chart2);

		JInternalFrame f = new JInternalFrame();
	    f.setLayout(new BorderLayout()); 
	    f.add(chartPanel1, BorderLayout.WEST);
	    f.add(chartPanel2, BorderLayout.EAST);
	    
	    JPanel panel = new JPanel();
		panel.setBorder(new LineBorder(new Color(0, 0, 0)));
		f.getContentPane().add(panel);
		panel.setLayout(new GridLayout(2, 0));
		panel.add(new JLabel("x = " + (Math.round(l.x / l.e) * l.e), JLabel.CENTER));
		panel.add(new JLabel("k = " + l.getK(), JLabel.CENTER));
		
	    f.add(panel, BorderLayout.SOUTH);
	    
	    f.pack();
	    f.setVisible(true);
	    f.setDefaultCloseOperation(JInternalFrame.EXIT_ON_CLOSE);
	}
}
