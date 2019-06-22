package com.tdcs.ui;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.swing.BoxLayout;
import javax.swing.JPanel;

import com.mxgraph.swing.mxGraphComponent;
import com.mxgraph.util.mxConstants;
import com.mxgraph.view.mxGraph;
import com.mxgraph.view.mxStylesheet;
import com.tdcs.document.Document;
import com.tdcs.document.DocumentListener;
import com.tdcs.model.fsm.State;

public class GraphView extends JPanel implements DocumentListener {

	private static final long serialVersionUID = -2707712944901661771L;
	private mxGraph graph;

	public GraphView() {
		super();
		Document.INSTANCE.addDocumentListener(this);

		graph = new mxGraph();

		mxStylesheet stylesheet = graph.getStylesheet();

		Map<String, Object> style = new Hashtable<String, Object>();
		style =  graph.getStylesheet().getDefaultVertexStyle();
		style.put(mxConstants.STYLE_SHAPE, mxConstants.SHAPE_ELLIPSE);
		stylesheet.setDefaultVertexStyle(style);

		style = graph.getStylesheet().getDefaultEdgeStyle();
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
		if (msg.equals("Build2")) {
			List<State> nodes = Document.INSTANCE.getStates();
			GraphBuilder.build(graph, nodes);
		}
	}
}
