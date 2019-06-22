package com.tdcs.ui;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.swing.JPanel;

import com.mxgraph.swing.mxGraphComponent;
import com.mxgraph.util.mxConstants;
import com.mxgraph.view.mxEdgeStyle;
import com.mxgraph.view.mxGraph;
import com.mxgraph.view.mxStylesheet;
import com.tdcs.document.Document;
import com.tdcs.document.DocumentListener;
import com.tdcs.model.Node;

import javax.swing.BoxLayout;

public class FlowchartView extends JPanel implements DocumentListener {

	private static final long serialVersionUID = -2707712944901661771L;
	private mxGraph graph;

	public FlowchartView() {
		super();
		Document.INSTANCE.addDocumentListener(this);

		graph = new mxGraph();

		mxStylesheet stylesheet = graph.getStylesheet();

		Map<String, Object> style = new Hashtable<String, Object>();
		style.put(mxConstants.STYLE_SHAPE, mxConstants.SHAPE_RHOMBUS);
		stylesheet.putCellStyle("DECISION", style);

		style = new Hashtable<String, Object>();
		style.put(mxConstants.STYLE_SHAPE, mxConstants.SHAPE_ELLIPSE);
		stylesheet.putCellStyle("TERMINATION", style);
		
		style = new Hashtable<String, Object>();
		style.put(mxConstants.STYLE_SHAPE, mxConstants.SHAPE_RECTANGLE);
		stylesheet.putCellStyle("OPERATOR", style);
		

		style = graph.getStylesheet().getDefaultEdgeStyle();
		style.put(mxConstants.STYLE_EDGE, mxEdgeStyle.SegmentConnector);
		style.put(mxConstants.STYLE_LABEL_POSITION, mxConstants.ALIGN_LEFT);
		stylesheet.setDefaultEdgeStyle(style);
		
		graph.setStylesheet(stylesheet);

		graph.setCellsEditable(false);
		graph.setAllowDanglingEdges(false);
		graph.setAllowLoops(false);
		graph.setCellsCloneable(false);
		graph.setCellsDisconnectable(false);
		graph.setDropEnabled(false);
		graph.setSplitEnabled(false);
		graph.setCellsBendable(false);
		setLayout(new BoxLayout(this, BoxLayout.X_AXIS));

		mxGraphComponent graphComponent = new mxGraphComponent(graph);

		add(graphComponent);
	}

	@Override
	public void update(Object sender, String msg) {
		if (msg.equals("Build1")) {
			List<Node> nodes = Document.INSTANCE.getNodes();
			FlowchartBuilder.build(graph, nodes);
			System.out.println("Flowchart");
		}
	}
}
