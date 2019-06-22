package edu.editor.algorithm.parser.tables;

import edu.editor.algorithm.parser.actions.Action;
import edu.editor.algorithm.parser.actions.AddSpecialSymbol;
import edu.editor.algorithm.parser.actions.AddSymbol;
import edu.editor.algorithm.parser.actions.DoNothing;
import edu.editor.algorithm.parser.exceptions.UnexpectedEndStringException;
import edu.editor.algorithm.parser.exceptions.UnexpectedSymbolException;

public class ParseText implements Initiator{

	public Action[] fillActions() {
		Action [] actions = {new DoNothing(), new AddSymbol(), new AddSpecialSymbol()};
		return actions;
	}

	public int[] fillClassTable() {
		int [] table = new int[257];
		table['"'] = 1;
		table['\''] = 1; /*byASD*/
		table['\\'] = 2;
		table['n']=3;
		table['t']=3;
		table[0]=4;
		table['\n']=4;
		table[';']=4;
		return table;
	}

	public Exception[] fillErrors() {
		Exception [] errors = {new UnexpectedSymbolException("Wrong string constant"),
				new UnexpectedEndStringException("Unexpected end of string")};
		return errors;
	}

	public int[][][] fillTable() {
		int [][][] table = {
						//	   0	  1		 2
				/*other*/	{{4,0}, {1,1}, {4,0}},
				/* " */		{{1,0}, {3,0}, {1,2}},
				/* \ */		{{4,0}, {2,0}, {1,2}},
				/* n t */	{{4,0}, {1,1}, {1,2}},
				/* end */	{{5,0}, {5,0}, {5,0}}
		};
		return table;
	}

}
