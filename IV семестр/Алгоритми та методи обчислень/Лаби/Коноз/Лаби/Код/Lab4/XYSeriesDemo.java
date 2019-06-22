package Lab4;

import javax.swing.JFrame;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import org.jfree.ui.ApplicationFrame;
import org.jfree.ui.RefineryUtilities;

public class XYSeriesDemo extends ApplicationFrame {

	double arg = Math.PI*0.25;
	public double function(double x){
		return x*x - Math.cos(Math.PI*x);
	}
 
    public XYSeriesDemo() {

    	
        super("Ãðàô³ê");
//       
        final XYSeries series = new XYSeries("");
        double step  = 20/200;
        double min = -10.0;
        for (int i = 0; i < 200; i++) {
			series.add(min + step*i, function(min + step*i));
		}
       
        final XYSeriesCollection data = new XYSeriesCollection(series);
 
        final JFreeChart chart = ChartFactory.createXYLineChart(
            "",
            "X", 
            "Y", 
            data,
            PlotOrientation.VERTICAL,
            true,
            true,
            false
        );

        final ChartPanel chartPanel = new ChartPanel(chart);
        chartPanel.setPreferredSize(new java.awt.Dimension(900, 600));
        setContentPane(chartPanel);
        pack();
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setVisible(true);

    }
  

}