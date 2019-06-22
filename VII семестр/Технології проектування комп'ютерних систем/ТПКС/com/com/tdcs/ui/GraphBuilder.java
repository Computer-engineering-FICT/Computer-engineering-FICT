package com.tdcs.ui;

import java.util.List;

import com.mxgraph.view.mxGraph;
import com.tdcs.model.fsm.State;
import com.tdcs.model.fsm.Transistion;

public class GraphBuilder {
	public static void build(mxGraph graph, List<State> states) {
		int size = states.size();
		int r = 25 * size;

		Object[] v = new Object[size];

		graph.removeCells(graph.getChildVertices(graph.getDefaultParent()));

		Object parent = graph.getDefaultParent();
		graph.getModel().beginUpdate();
		try {
			for (int i = 0; i < size; i++) {
				State state = states.get(i);
				int x, y;
				double ph = i * 2 * Math.PI / size;

				x = (int) (Math.sin(ph) * r);
				y = -(int) (Math.cos(ph) * r);

				v[i] = graph.insertVertex(parent, null, state, 30 + r + x, 30
						+ r + y, 30, 30);
			}

			for (int i = 0; i < size; i++) {
				State state = states.get(i);

				for (Transistion t : state.getTransistions()) {
					State next = t.getNext();
					int nextV = states.lastIndexOf(next);
					String signal = "0";
					
					if (t.getSignal() >= 0)
						signal = "Y" + t.getSignal();
					
					graph.insertEdge(parent, null, t.printConditions() + "/"
							+ signal, v[i], v[nextV]);
				}

			}

		} finally {
			graph.getModel().endUpdate();
		}
	}
}
