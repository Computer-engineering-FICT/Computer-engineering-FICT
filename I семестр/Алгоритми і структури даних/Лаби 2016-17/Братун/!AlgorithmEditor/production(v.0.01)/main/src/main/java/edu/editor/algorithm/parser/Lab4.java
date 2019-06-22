package edu.editor.algorithm.parser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import edu.editor.algorithm.parser.operand.Operand;
import edu.editor.algorithm.parser.operand.OperandWrapper;
import edu.editor.algorithm.parser.operand.Statement;
import edu.editor.algorithm.parser.tables.ParseStatement;

public class Lab4 {
	public static void main(String[] args) {
		BufferedReader bin = new BufferedReader(new InputStreamReader(System.in));
		try {
			String s = bin.readLine();
			OperandWrapper ow = new OperandWrapper(s);
			StatementParser thinker = new StatementParser(new ParseStatement(), ow);
			try {
				ow = thinker.parse();
				System.out.println("Before");
				
				Calculator calc = new Calculator(ow.operand);
				
				Statement first = (Statement) calc.first;
				
				first.testPrint();
				System.out.println("After");
				
				System.out.println("Similar");
				Bracketer b = new Bracketer(first);
				ArrayList<Operand> arr = b.getBracketVariants(b.first);
				arr.get(0).testPrint();
				
				
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
