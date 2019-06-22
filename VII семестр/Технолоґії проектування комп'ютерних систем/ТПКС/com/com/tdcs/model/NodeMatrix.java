package com.tdcs.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;

import com.tdcs.document.Hint;
import com.tdcs.document.Warning;

public class NodeMatrix {
	private int[][] adjacency;
	private int[] signals;
	private int size;

	private NodeMatrix() {
	}

	public static NodeMatrix build(List<Node> nodes) {
		NodeMatrix matrix = new NodeMatrix();
		matrix.size = nodes.size();

		matrix.adjacency = new int[matrix.size][matrix.size];
		matrix.signals = new int[matrix.size];

		for (int i = 0; i < nodes.size(); i++) {
			Node node = nodes.get(i);
			if (node instanceof Condition) {
				Condition condition = (Condition) node;
				matrix.adjacency[i][nodes.lastIndexOf(condition.getS1())] = 1;
				matrix.adjacency[i][nodes.lastIndexOf(condition.getS2())] = 2;
			} else {
				Operator operator = (Operator) node;
				if (operator.getIndex() != -2)
					matrix.adjacency[i][nodes.lastIndexOf(operator.getNext())] = 1;
			}
		}

		for (int i = 0; i < nodes.size(); i++) {
			matrix.signals[i] = nodes.get(i).getIndex();
		}

		return matrix;
	}

	public static NodeMatrix parse(String s) throws Exception {
		NodeMatrix matrix = new NodeMatrix();
		String[] a = s.split("[\\t\\s]+");

		try {
			matrix.size = Integer.parseInt(a[0]);
		} catch (RuntimeException e) {
			throw new Exception("");
		}

		matrix.adjacency = new int[matrix.size][matrix.size];
		matrix.signals = new int[matrix.size];

		int p = 1;

		for (int i = 0; i < matrix.size; i++) {
			for (int j = 0; j < matrix.size; j++)
				try {
					matrix.adjacency[i][j] = Integer.parseInt(a[p++]);
				} catch (RuntimeException e) {
					throw new Exception("");
				}
		}

		for (int i = 0; i < matrix.size; i++) {
			try {
				matrix.signals[i] = Integer.parseInt(a[p++]);
			} catch (RuntimeException e) {
				throw new Exception("");
			}
		}

		return matrix;
	}

	public String print() {
		String s = size + "\n";
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++)
				s += adjacency[i][j] + " ";
			s += "\n";
		}
		for (int i = 0; i < signals.length; i++) {
			s += signals[i] + "\n";
		}
		return s;
	}

	public List<Node> buildNodes() throws Exception {
		List<Node> nodes = new ArrayList<Node>(size);

		for (int i = 0; i < size; i++) {
			if (isCondition(i)) {
				nodes.add(i, new Condition(signals[i], 0, 0));
			} else {
				nodes.add(i, new Operator(signals[i], 0, 0));
			}
		}

		try {

			for (int i = 0; i < size; i++) {
				Node node = nodes.get(i);
				if (node instanceof Condition) {
					Condition condition = (Condition) node;
					condition.setS1(nodes.get(findLink(i, true)));
					condition.setS2(nodes.get(findLink(i, false)));
				} else {
					Operator operator = (Operator) node;
					if (operator.getIndex() != -2)
						operator.setNext(nodes.get(findLink(i, true)));
				}
			}
		} catch (Exception e) {
			throw new Exception("Matrix corrupted!");
		}

		return nodes;
	}

	private boolean isCondition(int index) {
		int adj = 0;
		for (int i = 0; i < size; i++) {
			if (adjacency[index][i] != 0) {
				if (++adj > 1)
					return true;
			}
		}

		return false;
	}

	private int findLink(int index, boolean first) throws Exception {
		int tmp = first ? 1 : 2;

		for (int i = 0; i < size; i++)
			if (adjacency[index][i] == tmp)
				return i;

		throw new Exception();
	}

	private int numberOfEntrance(int index) {
		int tmp = 0;

		for (int i = 0; i < size; i++)
			if (adjacency[i][index] != 0)
				tmp++;

		return tmp;
	}

	private int numberOfExtrance(int index) {
		int tmp = 0;

		for (int i = 0; i < size; i++)
			if (adjacency[index][i] != 0)
				tmp++;

		return tmp;
	}

	private Element getByNumber(List<Element> elements, int number) {
		int index = signals[number];
		boolean condition = isCondition(number);
		for (Element tmp : elements) {
			if (tmp.getIndex() == index) {
				if ((tmp instanceof Condition) && condition)
					return tmp;
				else if ((tmp instanceof Operator) && !condition)
					return tmp;
			}

		}

		return null;
	}

	public List<Integer> checkIn() {
		List<Integer> nodes = new ArrayList<Integer>();
		for (int i = 1; i < size; i++) {
			if (numberOfEntrance(i) == 0) {
				nodes.add(i);
			}
		}
		return nodes;
	}

	public List<Integer> checkOut() {
		List<Integer> nodes = new ArrayList<Integer>();
		for (int i = 0; i < size - 1; i++) {
			if (numberOfExtrance(i) == 0) {
				nodes.add(i);
			}
		}
		return nodes;
	}

	public List<Hint> validate(List<Element> elements) {
		List<Hint> hints = new ArrayList<Hint>();
		List<Integer> tmp = checkIn();
		for (Integer i : tmp) {
			Element el = getByNumber(elements, i);
			hints.add(new Warning("No entrance for node " + el.toString(), el
					.getTextBegin(), el.getTextEnd()));
		}
		tmp = checkOut();
		for (Integer i : tmp) {
			Element el = getByNumber(elements, i);
			hints.add(new Warning("No extrance for node " + el.toString(), el
					.getTextBegin(), el.getTextEnd()));
		}
		return hints;
	}

	private List<List<Integer>> paths;

	public List<List<Integer>> findAllPaths() {
		LinkedList<Integer> root = new LinkedList<Integer>();
		root.add(0);
		paths = new ArrayList<List<Integer>>();
		paths.add(root);
		findAllPathsFromNode(0, root);
		return paths;
	}

	private void findAllPathsFromNode(int node, List<Integer> pathToNode) {
		boolean multiple = false;

		List<Integer> tmp = new LinkedList<Integer>(pathToNode);

		for (int i = 0; i < size; i++) {
			if (adjacency[node][i] != 0) {
				if (multiple) {
					tmp.add(i);
					paths.add(tmp);

					if (!isCycleOp(tmp))
						findAllPathsFromNode(i, tmp);
				} else {
					pathToNode.add(i);

					if (!isCycleOp(pathToNode)) {
						findAllPathsFromNode(i, pathToNode);
					}
				}

				multiple = true;
			}
		}
	}

	public static boolean isCycle(List<Integer> path) {
		HashSet<Integer> tmp = new HashSet<Integer>();
		for (Integer i : path)
			if (!tmp.add(i))
				return true;

		return false;
	}

	public boolean isCycleOp(List<Integer> path) {
		HashSet<Integer> tmp = new HashSet<Integer>();
		for (Integer i : path)
			if (!isCondition(i))
				if (!tmp.add(i))
					return true;

		return false;
	}
}
