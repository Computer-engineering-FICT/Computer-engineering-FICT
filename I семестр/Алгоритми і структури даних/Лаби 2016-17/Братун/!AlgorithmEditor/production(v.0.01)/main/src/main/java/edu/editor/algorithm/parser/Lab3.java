package edu.editor.algorithm.parser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import edu.editor.algorithm.parser.operand.Operand;
import edu.editor.algorithm.parser.operand.OperandWrapper;
import edu.editor.algorithm.parser.operand.Statement;
import edu.editor.algorithm.parser.tables.ParseStatement;

public class Lab3 {
	public static void main(String[] args) {
		BufferedReader bin = new BufferedReader(new InputStreamReader(System.in));
		try {
			String s = bin.readLine();
			OperandWrapper ow = new OperandWrapper(s);
			StatementParser thinker = new StatementParser(new ParseStatement(), ow);
			try {
				ow = thinker.parse();
				System.out.println("Before");
				ow.operand.testPrint();
				System.out.println("After");
				
				/*JFrame frame1 = new JFrame("Tree");
				frame1.setBounds(100,100,400, 600);
				frame1.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
				frame1.getContentPane().add(new TreeApplet(ow.operand));
				frame1.setVisible(true);*/
				Calculator calc = new Calculator(ow.operand);
				//calc.clearTree().testPrint();
				Statement first = (Statement) calc.first;
				/*Paraleller par = new Paraleller(first);
				first = (Statement) par.parallel();*/
				first.testPrint();
				System.out.println("After");
				
				Commutator comm = new Commutator(first);
				ArrayList<Operand> var = comm.doIt();
				System.out.println("res");
				for (Operand op : var){
					op.testPrint();
					System.out.println();
				}
				/*Paraleller par = new Paraleller(calc.first);
				System.out.println();
				System.out.println("Parallel form");
				par.parallel().testPrint();
				JFrame frame = new JFrame("Tree");
				frame.setBounds(100,100,400, 600);
				frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
				frame.getContentPane().add(new TreeApplet(par.first));
				frame.setVisible(true);*/

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
