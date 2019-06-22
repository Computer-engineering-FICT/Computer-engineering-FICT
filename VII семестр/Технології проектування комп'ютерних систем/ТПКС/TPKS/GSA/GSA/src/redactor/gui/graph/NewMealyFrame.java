package redactor.gui.graph;

import com.mxgraph.layout.*;
import com.mxgraph.swing.mxGraphComponent;
import com.mxgraph.util.mxConstants;
import com.mxgraph.view.mxGraph;
import com.mxgraph.view.mxStylesheet;
import redactor.Mediator;
import redactor.Message;
import redactor.gui.graph.marking.BinaryMarkerCreator;
import redactor.gui.graph.marking.TreeVertex;
import redactor.gui.graph.mimimisation.TransitionData;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Nightingale
 * Date: 10/4/12
 * Time: 4:30 PM
 * To change this template use File | Settings | File Templates.
 */
public class NewMealyFrame extends JFrame {

    private JMenuBar menuBar;
    private List<String[]> listOfWays;
    private Mediator mediator;
    private TransitionData transitionData;
    private int counter;


    public NewMealyFrame(List<String[]> list, Mediator mediator1, int counter, TransitionData transitionData1) {


        listOfWays = list;
        this.counter = counter;
        mediator = mediator1;
        transitionData = transitionData1;

        BinaryMarkerCreator binaryMarkerCreator = new BinaryMarkerCreator(listOfWays, counter);
        binaryMarkerCreator.useCreateMarking();
        List<TreeVertex> listOfMarked = binaryMarkerCreator.getTreeVertexList();


        Toolkit kit = Toolkit.getDefaultToolkit();
        Dimension screenSize = kit.getScreenSize();
        setBounds(screenSize.width / 8, screenSize.height / 8, 6 * screenSize.width / 10, 6 * screenSize.height / 10);
        setTitle("Mealy automate");

        menuBar = new JMenuBar();

        JMenu menu = new JMenu("File");
        menuBar.add(menu);


        addMenuItem(menu,"Save Graph", 6);
        addMenuItem(menu,"Show trans table", 30);
        addMenuItem(menu,"Save trans table", 31);
        addMenuItem(menu,"Save as VHDL", 32);
        addMenuItem(menu, "test VHDL", 33);
        menuBar.setEnabled(true);
        setJMenuBar(menuBar);

        mxGraph graph = new mxGraph();
        Object parent = graph.getDefaultParent();

        graph.getModel().beginUpdate();
        try {

            mxStylesheet stylesheet = graph.getStylesheet();
            Hashtable<String, Object> style = new Hashtable<String, Object>();
            style.put(mxConstants.STYLE_SHAPE, mxConstants.SHAPE_ELLIPSE);
        //    style.put(mxConstants.STYLE_EDGE, mxConstants.SHAPE_CONNECTOR);
            style.put(mxConstants.STYLE_OPACITY, 100);
            style.put(mxConstants.STYLE_FONTCOLOR, "#774400");
            stylesheet.putCellStyle("ROUNDED", style);

            Hashtable<String, Object> style2 = new Hashtable<String, Object>();
        //    style2.put(mxConstants.STYLE_SHAPE, mxConstants.SHAPE_TRIANGLE);
            style2.put(mxConstants.STYLE_EDGE, mxConstants.EDGESTYLE_TOPTOBOTTOM);
            style2.put(mxConstants.STYLE_OPACITY, 100);
            style2.put(mxConstants.STYLE_FONTCOLOR, "#774400");
            stylesheet.putCellStyle("ARROW", style2);


            ArrayList<Object> vertexes = new ArrayList<Object>();
            ArrayList<Object> edges = new ArrayList<Object>();

            for (int i = 1; i<=counter; i++){
                Object vertex = graph.insertVertex(parent, null, "Z"+i+"\n"+Integer.toBinaryString(listOfMarked.get(i - 1).getBinaryMarker()), 30, 30, 40, 40, "ROUNDED");
                vertexes.add(vertex);
            }

            for (int i = 0; i<listOfWays.size(); i++){
                String[] way = listOfWays.get(i);
                int begin = Integer.valueOf(way[0].substring(1));
                int end = Integer.valueOf(way[3].substring(1));
                String passageValue = way[1]+"/"+way[2];
                Object edge = graph.insertEdge(parent, null, passageValue, vertexes.get(begin-1), vertexes.get(end-1),"ARROW");
                edges.add(edge);
            }




        } finally {
            graph.getModel().endUpdate();
        }

    //    graph.setCellsDisconnectable(false);
        graph.setCellsEditable(false);
        graph.setCellsResizable(false);
        graph.setCellsBendable(false);
        graph.setConnectableEdges(false);






        //    getContentPane().add(graphLayout);
        //     mxGraphComponent graphComponent = new mxGraphComponent(graphLayout);
        mxGraphComponent graphComponent = new mxGraphComponent(graph);


        getContentPane().add(graphComponent);

        mxGraphLayout graphLayout = new  mxCircleLayout(graph);
        //    graphLayout.setEdgeStyleEnabled(graph,true);
        graphLayout.execute(parent);


        //    mxParallelEdgeLayout edgeLayout = new mxParallelEdgeLayout(graph,10);
        //   edgeLayout.execute(parent);
    }



    public Action createActionForItem(String menuName, final int typeOfMessage){
        return new AbstractAction(menuName) {
            public void actionPerformed(final ActionEvent event) {
                Message message = new Message(typeOfMessage);
                mediator.update(message);
            }
        };
    }

    public void addMenuItem(JMenu m, String menuName, final int typeOfMessage){

        Action action = new AbstractAction(menuName) {
            public void actionPerformed(final ActionEvent event) {
                Message message = new Message(typeOfMessage);
                mediator.update(message);
            }
        };
        JMenuItem item = new JMenuItem(action);
        m.add(item);
    }

}

