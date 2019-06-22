package Lab3;

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
 
    public XYSeriesDemo(int n) {

    	
        super("Інтерполяція");
        Lagr lagr = new Lagr();
        lagr.countTable(0, 5, n);
        double functValues [][] = lagr.getFunctValues();
        final XYSeries series = new XYSeries("Відомі значення функції");
        for (int i = 0; i < functValues.length; i++) {
			series.add(functValues[i][0], functValues[i][1]);
		}
        final XYSeries series2 = new XYSeries("Результат інтерполяції");
        double step = 0.05;
        for (int i = 0; i < 100; i++) {
			series2.add(step*i, lagr.lagr(0, 5, step*i, n));
		}
    //    lagr.countTable(0, 5, n);
  //      lagr.showTable();
    //    lagr.countTable(0, 5, 10);
        final XYSeriesCollection data = new XYSeriesCollection(series);
        data.addSeries(series2);
        final JFreeChart chart = ChartFactory.createXYLineChart(
            "Інтерполяція",
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
    public static void main(final String[] args) {

 //       final XYSeriesDemo demo = new XYSeriesDemo();
    //    demo.
 //       RefineryUtilities.centerFrameOnScreen(demo);
      //  demo.

    }

}