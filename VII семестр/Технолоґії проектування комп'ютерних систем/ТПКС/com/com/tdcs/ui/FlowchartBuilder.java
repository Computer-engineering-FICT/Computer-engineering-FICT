package com.tdcs.ui;

import java.util.List;

import com.mxgraph.view.mxGraph;
import com.tdcs.model.Condition;
import com.tdcs.model.Node;
import com.tdcs.model.NodeMatrix;
import com.tdcs.model.Operator;

public class FlowchartBuilder {

	public static void build(mxGraph graph, List<Node> nodes) {
		Object[] verts = new Object[nodes.size()];
		int[] ys = new int[nodes.size()];

		graph.removeCells(graph.getChildVertices(graph.getDefaultParent()));

		NodeMatrix matrix = NodeMatrix.build(nodes);
		List<List<Integer>> paths = matrix.findAllPaths();

		for (int i = 0; i < paths.size(); i++) {
			for (int j = 0; j < paths.size() - 1; j++) {
				int s1 = paths.get(j).size();
				int s2 = paths.get(j + 1).size();

				if (s2 > s1) {
					List<Integer> tmp = paths.get(j + 1);
					paths.set(j + 1, paths.get(j));
					paths.set(j, tmp);
				}

			}
		}


		Object parent = graph.getDefaultParent();
		graph.getModel().beginUpdate();
		try {

			for (int x = 0; x < paths.size(); x++) {
				int y = 0;

				for (Integer tmp : paths.get(x)) {
					if (verts[tmp] == null) {

						ys[tmp] =  y;

						y++;
					}
				}
			}
			int x = 0;
			for (int i = paths.size() - 1; i >= 0; i--) {
				for (Integer tmp : paths.get(i)) {
					if (verts[tmp] == null) {
						Node node = nodes.get(tmp);
						String style = "OPERATOR";

						if (node.getIndex() < 0)
							style = "TERMINATION";
						else if (node instanceof Condition)
							style = "DECISION";

						verts[tmp] = graph.insertVertex(parent, null, node,
								40 + x * 130, 30 + ys[tmp] * 80, 80, 30,
								style);

					}
				}
				x++;
			}

			for (int i = 0; i < nodes.size(); i++) {
				Node node = nodes.get(i);
				String code;

				if (node instanceof Condition) {

					Node next = node.getNextNode();

					if (next.getIndex() == -2)
						code = " (z1)";
					else
						code = "";

					graph.insertEdge(parent, null, "   0" + code, verts[i],
							verts[nodes.lastIndexOf(next)]);

					next = node.getNextNodeAlt();

					if (next.getIndex() == -2)
						code = " (z1)";
					else
						code = "";

					graph.insertEdge(parent, null, "   1" + code, verts[i],
							verts[nodes.lastIndexOf(next)]);
				} else {
					Node next = node.getNextNode();

					if (next != null)
						graph.insertEdge(parent, null,
								"      (z" + ((Operator) node).getCode()+")", verts[i],
								verts[nodes.lastIndexOf(next)]);

				}
			}

		} finally {
			graph.getModel().endUpdate();
		}
	}
}
