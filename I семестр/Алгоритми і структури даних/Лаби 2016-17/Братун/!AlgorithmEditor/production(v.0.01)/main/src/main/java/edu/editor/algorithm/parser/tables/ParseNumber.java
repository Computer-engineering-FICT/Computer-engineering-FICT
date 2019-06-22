package edu.editor.algorithm.parser.tables;

import edu.editor.algorithm.parser.actions.Action;
import edu.editor.algorithm.parser.actions.AddSymbol;
import edu.editor.algorithm.parser.actions.ConvertIntToDouble;
import edu.editor.algorithm.parser.actions.DecrementPosition;
import edu.editor.algorithm.parser.actions.DoNothing;
import edu.editor.algorithm.parser.exceptions.UnexpectedEndStringException;
import edu.editor.algorithm.parser.exceptions.UnexpectedSymbolException;

public class ParseNumber implements Initiator{

	public Action[] fillActions() {
		Action[] actions = {new DoNothing(), new AddSymbol(),
				new ConvertIntToDouble(), new DecrementPosition()}; 
		return actions; 
	}

	public int[] fillClassTable() {
		int [] table = new int [257];
		table[0] = 3;
		for (int i='0'; i<='9'; i++){
			table[i] = 1;
		}
		table['.']=2;
		table['+']=3;
		table['-']=3;
		table['\n'] = 4;
		table[';'] = 4;

/*ASD*/ table[']'] = 1;
		return table;
	}

	public Exception[] fillErrors() {
		Exception[] errors = {new UnexpectedEndStringException("Unexpected end of string parsing number."),
				new UnexpectedSymbolException("Unexpected symbol parsing number")};
		return errors;
	}


	public int[][][] fillTable() {
		int [][][] table = {
							// 0 	  1		 2      3
			/*other*/		{{6,0}, {4,3}, {4,3}, {4,3}},			
/*ASD*/		/*digit*/		{{2,1}, {2,1}, {2,1}, {3,1}}, // plus ']'
			/* . */			{{3,2}, {3,2}, {3,2}, {6,0}},
			/*+ -*/			{{1,1}, {6,0}, {4,3}, {4,3}},
			/* end */		{{5,0}, {5,0}, {4,3}, {4,3}},
		};
		return table;
	}

}
