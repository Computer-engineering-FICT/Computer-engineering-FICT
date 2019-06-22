package com.tdcs.ui;

import java.util.List;

import com.tdcs.compiler.AlgorithmException;
import com.tdcs.compiler.LogicAlgorithmParser;
import com.tdcs.compiler.ModelCompiler;
import com.tdcs.compiler.SyntaxException;
import com.tdcs.model.Element;
import com.tdcs.model.Node;
import com.tdcs.model.NodeMatrix;

public class Test {

	/**
	 * @param args
	 * @throws Exception
	 */
	public static void main(String[] args) throws Exception {
		List<Element> elements = null;
		List<Node> nodes = null;

		try {
			elements = LogicAlgorithmParser.parse("Ybx1↑1Y1↓1x2↑2Y2w↑1Y3x3↑2Y4↓2Y5Ye");
		} catch (SyntaxException e) {
			e.printStackTrace();
		}

		System.out.println(LogicAlgorithmParser.print(elements));
		try {
			nodes = ModelCompiler.compile(elements);
		} catch (AlgorithmException e) {
			e.printStackTrace();
		}

		 ModelCompiler.print(nodes);

		NodeMatrix m = NodeMatrix.build(nodes);
		String ms = m.print();
		System.out.println(ms);

		NodeMatrix m1 = NodeMatrix.parse(ms);

		nodes = m1.buildNodes();
		 ModelCompiler.print(nodes);
		elements =  ModelCompiler.decompile(nodes);

		System.out.println(LogicAlgorithmParser.print(elements));

	}

}
