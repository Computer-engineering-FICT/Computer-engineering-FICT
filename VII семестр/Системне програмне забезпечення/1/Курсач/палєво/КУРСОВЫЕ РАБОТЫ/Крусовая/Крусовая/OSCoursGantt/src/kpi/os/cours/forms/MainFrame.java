package kpi.os.cours.forms;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.util.Date;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.SymbolAxis;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYBarRenderer;
import org.jfree.data.gantt.Task;
import org.jfree.data.gantt.TaskSeries;
import org.jfree.data.gantt.TaskSeriesCollection;
import org.jfree.data.gantt.XYTaskDataset;
import org.jfree.data.xy.IntervalXYDataset;

@SuppressWarnings("serial")
public class MainFrame extends JFrame {       
	private static JFreeChart createChart(IntervalXYDataset paramIntervalXYDataset)
	{
		JFreeChart localJFreeChart = ChartFactory.createXYBarChart(
				"Grantt diagram", 
				"Time", 
				false, 
				"Time", 
				paramIntervalXYDataset, 
				PlotOrientation.HORIZONTAL, true, false, false);	
		
		XYPlot localXYPlot = (XYPlot) localJFreeChart.getPlot();
		SymbolAxis localSymbolAxis = new SymbolAxis("Processors", 
				new String[] {"Team A", "Team B"});
		
		localXYPlot.setDomainAxis(localSymbolAxis);
		
		XYBarRenderer localXYBarRenderer = (XYBarRenderer)localXYPlot.getRenderer();
		localXYBarRenderer.setUseYInterval(true);

		//localXYPlot.setRangeAxis(new DateAxis("Timing"));
		
		ChartUtilities.applyCurrentTheme(localJFreeChart);
		return localJFreeChart;
	}

	public static JPanel createDemoPanel()
	{
		return new ChartPanel(createChart(createDataset()));
	}

	private static IntervalXYDataset createDataset()
	{
		return new XYTaskDataset(createTasks());
	}

	private static TaskSeriesCollection createTasks()
	{
		TaskSeriesCollection localTaskSeriesCollection = new TaskSeriesCollection();

		TaskSeries localTaskSeries1 = new TaskSeries("Proc A");
		localTaskSeries1.add(new Task("T1a", new Date(1000), new Date(2000)));
		localTaskSeries1.add(new Task("T1a", new Date(4000), new Date(6000)));
		
		TaskSeries localTaskSeries2 = new TaskSeries("Proc B");
		localTaskSeries2.add(new Task("T2a", new Date(1000), new Date(4000)));
		localTaskSeries2.add(new Task("T2a", new Date(2000), new Date(3000)));

		localTaskSeriesCollection.add(localTaskSeries1);
		localTaskSeriesCollection.add(localTaskSeries2);

		return localTaskSeriesCollection;
	}
	
	private JTabbedPane tabbedPane;
    
    public MainFrame() {
        super("APCSLabs");            
        
        int inset = 100;
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize(); 
        setBounds(inset, inset,
                  screenSize.width  - inset*2,
                  screenSize.height - inset*2);
        
        tabbedPane = new JTabbedPane();                              
        add(tabbedPane);                                          
        
        JPanel panel = createDemoPanel();
                
        tabbedPane.addTab("Gantt", null, panel, "");
        
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        this.setMinimumSize(new Dimension(700, 450));

        setVisible(true);
    }   
}
