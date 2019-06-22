package kpi.os.cours.editor;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;

import javax.swing.AbstractAction;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JToolBar;
import javax.swing.filechooser.FileNameExtensionFilter;

import kpi.os.cours.forms.MainFrame;
import kpi.os.cours.graph.Edge;
import kpi.os.cours.graph.Task;

import org.w3c.dom.Document;

import com.mxgraph.io.mxCodec;
import com.mxgraph.model.mxCell;
import com.mxgraph.model.mxGraphModel;
import com.mxgraph.swing.mxGraphComponent;
import com.mxgraph.swing.util.mxGraphTransferable;
import com.mxgraph.util.mxEvent;
import com.mxgraph.util.mxEventObject;
import com.mxgraph.util.mxUndoManager;
import com.mxgraph.util.mxUndoableEdit;
import com.mxgraph.util.mxUtils;
import com.mxgraph.util.mxEventSource.mxIEventListener;
import com.mxgraph.view.mxGraph;

/**
 * @author Pustovit Michael, pustovitm@gmail.com
 * Компонент включающий в себя поле отрисовки графа, палитру доступных фигур, 
 * и панель инструментов.
 */
@SuppressWarnings("serial")
public class SchemEditor extends JPanel {
    private Graph graph;
    private mxGraphComponent graphComponent;
    private mxUndoManager undoManager;
    private MainFrame mainframe;
    
    private final static String ELLIPSE_VERTEX_STYLE  = "ellipse";

    private final static String ALGO_FILE_EXTENSION   = "tsg";
    
    public SchemEditor(MainFrame pmainframe) {        
        graph = new Graph();
        graphComponent = new GraphComponent(graph);
        setLayout(new BorderLayout());
        add(graphComponent, BorderLayout.CENTER);        
        
        mainframe = pmainframe;
        
        graphComponent.setEnterStopsCellEditing(true);
        graph.setCellsResizable(false);
        
        //========= Создание палитры доступных компонентов =========
        EditorPalette palette = new EditorPalette();

        // Изменение стиля связей, при выборе типа в палитре
        palette.addListener(mxEvent.SELECT, new mxIEventListener()
        {
            public void invoke(Object sender, mxEventObject evt)
            {
                Object tmp = evt.getProperty("transferable");

                if (tmp instanceof mxGraphTransferable)
                {
                    mxGraphTransferable t = (mxGraphTransferable) tmp;
                    Object cell = t.getCells()[0];

                    if (graph.getModel().isEdge(cell))
                    {
                        graph.setEdgeTemplate(cell);
                    }
                }
            }

        });

        int stwidth = 40;
        int stheigth = (int) (1.5 * stwidth);
        
        // Наполнение палитры
        palette.addTemplate("Node",
                        new ImageIcon(SchemEditor.class
                                        .getResource("/images/ellipse.png")),
                        ELLIPSE_VERTEX_STYLE, stheigth, stwidth, "");
        palette.addEdgeTemplate("Straight",
                        new ImageIcon(SchemEditor.class
                                        .getResource("/images/straight.png")),
                        "straight", 120, 120, "");
        palette.addEdgeTemplate("Horizontal Connector",
                        new ImageIcon(SchemEditor.class
                                        .getResource("/images/connect.png")),
                        null, 100, 100, "");
        palette.addEdgeTemplate(
                        "Vertical Connector",
                        new ImageIcon(SchemEditor.class
                                        .getResource("/images/vertical.png")),
                        "vertical", 100, 100, "");               
        
        add(palette, BorderLayout.WEST);
        palette.setPreferredWidth(200);        
        
        //========= Добавление тулбара =========
        JToolBar toolBar = new JToolBar();
        
        toolBar.add(actionOpen);
        toolBar.add(actionSave);
        toolBar.addSeparator();
        toolBar.add(actionDelete);
        toolBar.addSeparator();
        toolBar.add(actionUndo);
        toolBar.add(actionRedo);
        toolBar.addSeparator();
        toolBar.add(actionNumber);
        
        add(toolBar, BorderLayout.NORTH);       
        
        undoManager = createUndoManager(graph);

        //!!!FOR TESTING PURPOSE ONLY!!!
        try {
            File file = new File("test3.tsg");
        	ObjectInputStream in = new ObjectInputStream(
                    new BufferedInputStream(new FileInputStream(file)));

            mxGraphModel graphModel = (mxGraphModel) graph.getModel();
            graphModel.setRoot(in.readObject());

            in.close();
        } catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		//========================================
    }   
       
    private ArrayList<Task> numberEdges() {
    	ArrayList<Task> nodes = new ArrayList<Task>();
    	mxCell parent = (mxCell) graph.getModel().getRoot();
    	parent = (mxCell) parent.getChildAt(0);
    	
    	int count = 0;
    	
    	mxCell cell;
        for (int i = 0; i < parent.getChildCount(); i++) {
            cell = (mxCell) parent.getChildAt(i);
            if (cell.isVertex()) {
            	Task n = new Task(count, Integer.valueOf((String)cell.getValue()));
            	nodes.add(n);
            	cell.setValue(n);
            	count++;
            }
        }
        
        //Обходим все ноды
        for (int i = 0; i < parent.getChildCount(); i++) {
            cell = (mxCell) parent.getChildAt(i);
            
            //Если нод является вершиной - создаем соответствующую задачу
            if (cell.isVertex()) {
            	Task selfNode = (Task) cell.getValue();
            	
            	//Рассматриваем все ребра смежные с вершиной
            	for (int j = 0; j < cell.getEdgeCount(); j++) {
            		mxCell edge = (mxCell) cell.getEdgeAt(j); 
            		
            		//Вершина из которой выходит ребро
            		mxCell target = (mxCell)	edge.getTarget();
            		//Вершина в которую входит ребро
            		mxCell source = (mxCell)	edge.getSource();

            		//Вес ребра
            		int num = 0;
            		if (((String) edge.getValue()).length() > 0) {
            			num = Integer.valueOf((String) edge.getValue());
            		}
            		
                	if (source == cell) {                		
            			selfNode.addOutEdge(new Edge(num, 
            					(Task) target.getValue()));
            		}  else {
            			selfNode.addInEdge(new Edge(num, 
            					(Task) source.getValue()));
            		}
            		
            	}
            }
        }        
    	
        
        graphComponent.refresh();
        return nodes;
    }
    
    //============= Действия панели управления =============
    
    /**
     * Нумерация вершин и составление модели графа
     */
    public AbstractAction actionNumber = new AbstractAction("Start") {        
        {
            putValue(SHORT_DESCRIPTION, "Number edges and start " +
            		"scheduling process");
        }
        
        @Override
        public void actionPerformed(ActionEvent arg0) {
            ArrayList<Task> nodes = numberEdges();
        	
            graph.refresh();
            
            mainframe.startProcess(nodes);
        }
    };
    
    public AbstractAction actionDelete = new AbstractAction("Delete") {        
        {
            putValue(LARGE_ICON_KEY,
                    new ImageIcon(SchemEditor.class
                            .getResource("/images/delete.gif")));
            putValue(SHORT_DESCRIPTION, "Delete selected item");
        }
        
        @Override
        public void actionPerformed(ActionEvent arg0) {
            graph.removeCells();            
        }
    };              
    
    public AbstractAction actionUndo = new AbstractAction("Undo") {
        {
          putValue(LARGE_ICON_KEY,
              new ImageIcon(SchemEditor.class.getResource("/images/undo.gif")));
          putValue(SHORT_DESCRIPTION, "Undo last action");
        }

        @Override
        public void actionPerformed(ActionEvent e)
        {
          undoManager.undo();
        }
      };

      public AbstractAction actionRedo = new AbstractAction("Redo") {
        {
          putValue(LARGE_ICON_KEY,
              new ImageIcon(SchemEditor.class.getResource("/images/redo.gif")));
          putValue(SHORT_DESCRIPTION, "Redo last action");
        }

        @Override
        public void actionPerformed(ActionEvent e)
        {
          undoManager.redo();
        }
      };
    
    /**
     * @author mih
     * Компонент отрисовки графа (View). Он же отвечает за подгрузку стилей
     * отрисовки из внешнего xml-файла
     */
    private class GraphComponent extends mxGraphComponent {
        public GraphComponent(mxGraph graph) {
            super(graph);
            
            // Loads the defalt stylesheet from an external file
            mxCodec codec = new mxCodec();
            Document doc = mxUtils.loadDocument(SchemEditor.class.getResource(
                    "/basic-style.xml").toString());
            codec.decode(doc.getDocumentElement(), graph.getStylesheet());
            
            // Sets the background to white
            getViewport().setOpaque(false);
            setBackground(Color.WHITE);     
        }
    }
   
    /**
     * Создание undo менеджера
     * @param graph
     * @return
     */
    private static mxUndoManager createUndoManager(mxGraph graph)
    {
      final mxUndoManager undoManager = new mxUndoManager();
      graph.getModel().addListener(mxEvent.UNDO, new mxIEventListener() {
        @Override
        public void invoke(Object sender, mxEventObject evt)
        {
          undoManager.undoableEditHappened((mxUndoableEdit) evt
            .getProperty("edit"));
        }
      });
      return undoManager;
    }
    
    /**
     * Вывод сообщения об ошибке
     * @param message Выводимое сообщение
     */
    private void showErrorDialog(String message)
    {
      JOptionPane.showMessageDialog(this, message, "Error",
          JOptionPane.ERROR_MESSAGE | JOptionPane.OK_OPTION);
    }        
    
    public void setEnabledGraph(Boolean zn) {
        graphComponent.setEnabled(zn);
    }
    
    //============= Работа с файлами ============= 
    /**
     * Диалог открытия файла модели
     */
    public AbstractAction actionOpen = new AbstractAction("Open algorithm") {
        {
            putValue(
                    LARGE_ICON_KEY,
                    new ImageIcon(SchemEditor.class
                            .getResource("/images/open.gif")));
            putValue(SHORT_DESCRIPTION, "Open scheme file");
        }

        @Override
        public void actionPerformed(ActionEvent event) {
            JFileChooser fileDialog = new JFileChooser();
            FileNameExtensionFilter filter = new FileNameExtensionFilter(
                    "Tasks graph (*.tsg)", ALGO_FILE_EXTENSION);
            fileDialog.setFileFilter(filter);
            int retValue = fileDialog.showOpenDialog(SchemEditor.this);
            if (retValue == JFileChooser.APPROVE_OPTION) {
                File file = fileDialog.getSelectedFile();
                try {
                    ObjectInputStream in = new ObjectInputStream(
                            new BufferedInputStream(new FileInputStream(file)));

                    mxGraphModel graphModel = (mxGraphModel) graph.getModel();
                    graphModel.setRoot(in.readObject());

                    in.close();
                } catch (FileNotFoundException e) {
                    showErrorDialog("File not found");
                } catch (IOException e) {
                    showErrorDialog("IO problem");
                } catch (ClassNotFoundException e) {
                    showErrorDialog("File is invalid");
                }
            }
        }
    };

    /**
     * Диалог сохранения модели JGraph
     */
    public AbstractAction actionSave = new AbstractAction("Save algorithm") {
        {
            putValue(
                    LARGE_ICON_KEY,
                    new ImageIcon(SchemEditor.class
                            .getResource("/images/save.gif")));
            putValue(SHORT_DESCRIPTION, "Save scheme to file");
        }

        @Override
        public void actionPerformed(ActionEvent e) {
            JFileChooser fileDialog = new JFileChooser();
            FileNameExtensionFilter filter = new FileNameExtensionFilter(
                    "Tasks graph (*.tsg)", ALGO_FILE_EXTENSION);
            fileDialog.setFileFilter(filter);
            int retValue = fileDialog.showSaveDialog(SchemEditor.this);
            if (retValue == JFileChooser.APPROVE_OPTION) {
                File file = fileDialog.getSelectedFile();
                
                if (!file.getAbsolutePath().endsWith("." + ALGO_FILE_EXTENSION)) {
                    file = new File(file.getAbsolutePath().concat("." + ALGO_FILE_EXTENSION)); 
                }
                
                try {
                    ObjectOutputStream out = new ObjectOutputStream(
                            new BufferedOutputStream(new FileOutputStream(file)));
                    mxGraphModel graphModel = (mxGraphModel) graph.getModel();
                    out.writeObject(graphModel.getRoot());
                    out.close();
                } catch (FileNotFoundException e1) {
                    showErrorDialog("Can't save to selected file");
                } catch (IOException e1) {
                    e1.printStackTrace();
                    showErrorDialog("IO Exception while writing to file");
                }
            }
        }
    };

}
