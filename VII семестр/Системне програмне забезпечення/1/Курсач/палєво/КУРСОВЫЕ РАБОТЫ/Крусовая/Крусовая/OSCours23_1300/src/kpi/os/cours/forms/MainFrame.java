package kpi.os.cours.forms;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import javax.swing.ScrollPaneConstants;

import kpi.os.cours.editor.SchemEditor;
import kpi.os.cours.emulating.Controller;
import kpi.os.cours.graph.ClusterPool;
import kpi.os.cours.graph.Task;
import kpi.os.cours.graph.TaskGraph;


@SuppressWarnings("serial")
public class MainFrame extends JFrame {       
	private JTabbedPane tabbedPane;
	private static JTextArea console;
	private Diagram diagram;
	
    public MainFrame() {
        super("OS Scheduler");            
        
        int inset = 100;
        Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize(); 
        setBounds(inset, inset,
                  screenSize.width  - inset*2,
                  screenSize.height - inset*2);
        
        tabbedPane = new JTabbedPane();                              
        add(tabbedPane);                                          

        SchemEditor graph = new SchemEditor(this);
        tabbedPane.addTab("Graph", null, graph, "");
        
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
        
        DiagramData diagData = contr.start();
        diagram = new Diagram(diagData);
        
        JScrollPane diagScroll = new JScrollPane(diagram);
        diagScroll.setHorizontalScrollBarPolicy(
        		ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
        
        tabbedPane.addTab("Gantt", null, diagScroll, "");  
    }
}
