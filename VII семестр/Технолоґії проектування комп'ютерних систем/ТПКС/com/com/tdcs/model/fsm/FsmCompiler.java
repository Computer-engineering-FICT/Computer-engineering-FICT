package com.tdcs.model.fsm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.tdcs.model.Node;
import com.tdcs.model.NodeMatrix;
import com.tdcs.model.Operator;

public class FsmCompiler {
	public static List<State> buildFSM(List<Node> nodes) {
		HashMap<Integer, State> states = new HashMap<Integer, State>();
		ArrayList<State> ret = new ArrayList<>();
		for (Node node : nodes) {
			if (node instanceof Operator) {
				Operator op = (Operator) node;
				if (op.getIndex() != -2) {
					State state = new State(op.getCode());
					states.put(state.getIndex(), state);
					ret.add(state);
				}
			}
		}

		List<List<Integer>> paths = NodeMatrix.build(nodes).findAllPaths();

		/* Make all paths end with operator */
		for (List<Integer> path : paths) {
			int last = path.get(path.size() - 1);
			Node lastNode = nodes.get(last);
			if (lastNode instanceof com.tdcs.model.Condition) {
				int begin = 0;
				for (int i = 0; i < path.size(); i++)
					if (path.get(i) == last) {
						begin = i;
						break;
					}

				for (int i = begin + 1; i < path.size(); i++) {
					int tmp = path.get(i);
					path.add(tmp);

					if (nodes.get(tmp) instanceof Operator)
						break;
				}
			}
		}

		for (List<Integer> path : paths) {
			Transistion transition = null;
			State lastState = null;
		
			for (int i = 0; i < path.size(); i++) {
				Node node = nodes.get(path.get(i));

				if (node instanceof Operator) {
					Operator op = (Operator) node;
					State state = states.get(op.getCode());
					if (lastState != null) {
						lastState.addTransistion(transition);
						transition.setNext(state);
						transition.setSignal(op.getIndex());
						//System.out.println(transition);
					}
					transition = new Transistion(state);
					transition.setSignal(op.getIndex());
					lastState = state;
				} else {
					com.tdcs.model.Condition c = (com.tdcs.model.Condition) node;
					Node nextNode = nodes.get(path.get(i + 1));

					Condition condition = new Condition(c.getIndex());

					condition.setCondition(c.getS2() == nextNode);

					transition.getConditions().add(condition);
				}
			}
		}
		
		
		
		FsmCoder.code(ret, ret.size()+1);

		return ret;
	}
}
