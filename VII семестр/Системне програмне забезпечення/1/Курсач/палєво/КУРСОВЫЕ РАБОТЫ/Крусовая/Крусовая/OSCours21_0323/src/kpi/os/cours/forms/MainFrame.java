package kpi.os.cours.forms;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;

import kpi.os.cours.editor.SchemEditor;
import kpi.os.cours.emulating.Controller;
import kpi.os.cours.graph.ClusterPool;
import kpi.os.cours.graph.Task;
import kpi.os.cours.graph.TaskGraph;


@SuppressWarnings("serial")
public class MainFrame extends JFrame {       
	private JTabbedPane tabbedPane;
	private static JTextArea console;
	
    public MainFrame() {
        super("OS Scheduler");            
        
        int inset = 100;
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize(); 
        setBounds(inset, inset,
                  screenSize.width  - inset*2,
                  screenSize.height - inset*2);
        
        tabbedPane = new JTabbedPane();                              
        add(tabbedPane);                                          
        
    	ArrayList<Interval> inter = new ArrayList<Interval>();
    	
    	inter.add(new Interval(0, 5, IntervalType.PROCESSING, "2"));
    	inter.add(new Interval(6, 15, IntervalType.PROCESSING, "23"));
    	inter.add(new Interval(2, 3, IntervalType.SENDING, "4"));
    	inter.add(new Interval(12, 20, IntervalType.RECEIVING, "11"));
    	
    	DiagramLineData data1 = new DiagramLineData("Proc 1", inter);
    	DiagramLineData data2 = new DiagramLineData("Proc 2", inter);
    	ArrayList<DiagramLineData> diagDat = new ArrayList<DiagramLineData>();
    	diagDat.add(data1);
    	diagDat.add(data2);
        
        DiagramData diagData = new DiagramData(50, 1, diagDat);
        JPanel panel = new Diagram(diagData);
                        
        SchemEditor graph = new SchemEditor(this);
        
        tabbedPane.addTab("Graph", null, graph, "");
        tabbedPane.addTab("Gantt", null, panel, "");       
        
        console = new JTextArea(7, 3);
        console.setEditable(false);
        JScrollPane scrollpane = new JScrollPane(console);
        graph.add(scrollpane, BorderLayout.SOUTH);
        
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        this.setMinimumSize(new Dimension(700, 450));

        setVisible(true);
    }
    
    public void consolePrint(String str) {
    	console.append(str);
    }
    
    public void startProcess(ArrayList<Task> nodes) {
        TaskGraph gr = new TaskGraph(nodes);
        System.out.println(gr);
        
        gr.processStaticLevel();
        System.out.println("Critical path = " + 
        		gr.getCriticalPass(new ClusterPool()));
        
        System.out.println(gr);
        
        ClusterPool pool = gr.makeReduction();
        
        consolePrint("Critical path = " + gr.getCriticalPass(pool) + "\n");
        consolePrint("Clusters:\n" + pool.toString());
        
        Controller contr = new Controller(gr, pool);
    }
}
