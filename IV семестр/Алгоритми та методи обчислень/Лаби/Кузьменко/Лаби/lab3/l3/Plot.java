package l3;

import java.awt.BorderLayout;

import javax.swing.JFrame;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;

/**
 * Візуалізація полінома і функції
 * @author Aruy
 */
public class Plot {

	public Plot(Logic l) {
		XYSeries series1 = new XYSeries("y = 1 / (0.5 + x^2)");
		XYSeries series2 = new XYSeries("поліном");
		XYSeries series3 = new XYSeries("похибка");
		
		for (double j = l.a; j <= l.b; j += 0.01){
		      series1.add(j, l.func(j)); 
		      series2.add(j, l.polinom(j));
		      series3.add(j, l.mistake(j));
		}	
			
		XYSeriesCollection data = new XYSeriesCollection(series1);
		data.addSeries(series2);
		
		XYSeriesCollection data2 = new XYSeriesCollection(series3);
		

	    JFreeChart chart1 = ChartFactory.createXYLineChart("", "x", "y", data, PlotOrientation.VERTICAL, true, true, true);
	    JFreeChart chart2 = ChartFactory.createXYLineChart("", "x", "y", data2, PlotOrientation.VERTICAL, true, true, true);
	    
	    ChartPanel chartPanel1 = new ChartPanel(chart1);
	    ChartPanel chartPanel2 = new ChartPanel(chart2);
	    
	    JFrame frame = new JFrame("");	 
	    
	    frame.setLayout(new BorderLayout()); 
	    frame.add(chartPanel1, BorderLayout.WEST);
	    frame.add(chartPanel2, BorderLayout.EAST);
	    frame.pack();
	    frame.setVisible(true);
	    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}
