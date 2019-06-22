package com.tdcs.compiler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import com.tdcs.document.Error;
import com.tdcs.model.Condition;
import com.tdcs.model.Element;
import com.tdcs.model.Jump;
import com.tdcs.model.Link;
import com.tdcs.model.Node;
import com.tdcs.model.Operator;
import com.tdcs.model.Reference;

public class ModelCompiler {
	private static final int INDEX_BEGIN = -1;
	private static final int INDEX_END = -2;

	public static List<Node> compile(List<Element> elements)
			throws AlgorithmException {
		Element tmp;

		if (elements.size() < 2)
			throw new AlgorithmException(
					"Algorithm must have atleast first and last operator!");

		/* Check first and last elements */
		tmp = elements.get(0);
		if (tmp instanceof Operator) {
			Operator y = (Operator) tmp;
			if (y.getIndex() != INDEX_BEGIN)
				throw new AlgorithmException(
						"Invalid index of first operator (" + tmp.getIndex()
								+ ") !", new Error(
								"Invalid index of first operator",
								y.getTextBegin(), y.getTextEnd()));
		} else
			throw new AlgorithmException("Fist expression must be operator!");

		tmp = elements.get(elements.size() - 1);
		if (tmp instanceof Operator) {
			Operator y = (Operator) tmp;
			if (y.getIndex() != INDEX_END)
				throw new AlgorithmException("Invalid index of last operator ("
						+ tmp.getIndex() + ") !", new Error(
						"Invalid index of last operator", y.getTextBegin(),
						y.getTextEnd()));
		} else
			throw new AlgorithmException("Last expression must be operator!");

		/* Link all references */

		HashMap<Integer, Reference> references = new HashMap<Integer, Reference>();
		for (Element element : elements) {
			if (element instanceof Reference) {
				Reference ref = (Reference) element;

				if (references.put(ref.getIndex(), ref) == null) {
					/* Find first operator or condition after reference */
					int i = elements.lastIndexOf(ref);
					Element next;

					do {
						i++;
						next = elements.get(i);
					} while (!((next instanceof Condition) || (next instanceof Operator)));

					ref.setElement(next);
				} else
					throw new AlgorithmException("Dublicated ↓ index ("
							+ +element.getIndex() + ") !");
			}
		}

		/* Link conditions and Jumps */

		for (int i = 0; i < elements.size(); i++) {
			Element element = elements.get(i);
			if (element instanceof Condition) {
				Condition condition = (Condition) element;

				tmp = elements.get(i + 1);

				if (tmp instanceof Link) {
					Link link = (Link) tmp;
					Reference ref = references.get(link.getIndex());
					if (ref != null)
						condition.setS2(ref.getElement());
					else
						throw new AlgorithmException("Invalid ↑ index ("
								+ link.getIndex() + ") !");
				} else
					throw new AlgorithmException(
							"↑ must folow after condition index ("
									+ element.getIndex() + ") !");

				int j = i + 1;
				Element next;

				do {
					j++;
					next = elements.get(j);
				} while (!(next instanceof Node));

				condition.setS1(next);
			}

			if (element instanceof Jump) {
				Jump jump = (Jump) element;

				tmp = elements.get(i + 1);

				if (tmp instanceof Link) {
					Link link = (Link) tmp;
					Reference ref = references.get(link.getIndex());
					if (ref != null)
						jump.setNext(ref.getElement());
					else
						throw new AlgorithmException("Invalid ↑ index ("
								+ link.getIndex() + ") !");
				} else
					throw new AlgorithmException(
							"↑ must folow after condition index ("
									+ element.getIndex() + ") !");
			}
		}

		/* Link operators */
		for (int i = 0; i < elements.size(); i++) {
			Element element = elements.get(i);
			if (element instanceof Operator) {
				Operator operator = (Operator) element;

				if (operator.getIndex() != INDEX_END) {
					/* Find next Vertex or Jump */
					int j = i;
					Element next;

					do {
						j++;
						next = elements.get(j);
					} while (!((next instanceof Node) || (next instanceof Jump)));

					if (next instanceof Node)
						operator.setNext(next);
					else
						operator.setNext(((Jump) next).getNext());
				}
			}
		}

		List<Node> compiled = new ArrayList<Node>();

		for (Element element : elements) {
			if (element instanceof Node) {
				compiled.add((Node) element);
			}
		}

		return compiled;
	}

	public static List<Element> decompile(List<Node> nodes) {
		int linkCounter = 1;
		LinkedList<Element> decompiled = new LinkedList<Element>(nodes);

		for (Node node : nodes) {
			if (node instanceof Condition) {
				Condition condition = (Condition) node;

				int refpos = decompiled.lastIndexOf(condition.getS2()) - 1;

				if (decompiled.get(refpos) instanceof Reference) {
					Reference ref = (Reference) decompiled.get(refpos);

					decompiled.add(decompiled.lastIndexOf(condition) + 1,
							new Link(ref.getIndex()));

				} else {
					Reference ref = new Reference(linkCounter);

					decompiled.add(decompiled.lastIndexOf(condition) + 1,
							new Link(linkCounter));

					decompiled.add(decompiled.lastIndexOf(condition.getS2()),
							ref);
					linkCounter++;
				}
			} else

			if (node instanceof Operator) {
				Operator operator = (Operator) node;
				Element next = operator.getNext();

				if ((next != null)
						&& (next != nodes.get(nodes.lastIndexOf(operator) + 1))) {
					int linkIndex;

					int refpos = decompiled.lastIndexOf(operator.getNext()) - 1;

					if (decompiled.get(refpos) instanceof Reference) {
						Reference ref = (Reference) decompiled.get(refpos);

						linkIndex = ref.getIndex();

					} else {
						Reference ref = new Reference(linkCounter);

						decompiled.add(
								decompiled.lastIndexOf(operator.getNext()),

								ref);
						linkIndex = linkCounter;

						linkCounter++;
					}

					int tmp = decompiled.lastIndexOf(operator);

					decompiled.add(tmp + 1, new Jump());

					decompiled.add(tmp + 2, new Link(linkIndex));
				}
			}
		}

		return decompiled;
	}

	public static void coding(List<Node> nodes) {
		int z = 1;
		for (Node node : nodes) {
			if (node instanceof Operator) {
				Operator op = (Operator) node;
				if (op.getIndex() != -2)
					op.setCode(z);
				else
					op.setCode(1);
				z++;
			}

		}
	}
	

	public static void print(List<Node> nodes) {
		for (Node element : nodes) {
			if (element instanceof Operator) {
				Operator operator = (Operator) element;
				Element next = operator.getNext();
				if (next != null)
					System.out.println(operator.toString() + "->"
							+ operator.getNext().toString());
				else
					System.out.println(operator.toString());
			}

			if (element instanceof Condition) {
				Condition condition = (Condition) element;
				System.out.println(condition.toString() + "->("
						+ condition.getS1().toString() + "; "
						+ condition.getS2().toString() + ")");
			}
		}
	}

}
