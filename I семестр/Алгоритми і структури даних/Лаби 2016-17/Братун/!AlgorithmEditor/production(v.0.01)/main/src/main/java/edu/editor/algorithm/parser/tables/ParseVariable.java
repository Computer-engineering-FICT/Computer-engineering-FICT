package edu.editor.algorithm.parser.tables;

import edu.editor.algorithm.parser.actions.Action;
import edu.editor.algorithm.parser.actions.AddFunction;
import edu.editor.algorithm.parser.actions.AddSymbol;
import edu.editor.algorithm.parser.actions.DecrementPosition;
import edu.editor.algorithm.parser.actions.DoNothing;
import edu.editor.algorithm.parser.exceptions.UnexpectedEndStringException;
import edu.editor.algorithm.parser.exceptions.UnexpectedSymbolException;

public class ParseVariable implements Initiator{

	public Action[] fillActions() {
		Action [] actions = {new DoNothing(), new AddSymbol(), 
				new AddFunction(), new DecrementPosition()};
		return actions;
	}

	public int[] fillClassTable() {
		int[] table = new int [257];
		table ['_']=1;
/*ASD!*/table [' ']=1;
/*ASD!*/table [',']=1;
		for(int i='A'; i<='Z'; i++){
			table[i]=1;
		}
		for(int i='a'; i<='z'; i++){
			table[i]=1;
		}
		for (int i='0'; i<='9'; i++){
			table[i]=2;
		}
		table['.']=3;
/*ASD!*/table['[']=1/*4*/;
/*ASD!*/table[']']=1/*5*/;
		table[0] = 6;
		table[';']=6;
		table['\n']=6;
		table['(']=7;		
		return table;
	}


	public Exception[] fillErrors() {
		Exception [] errors = {new UnexpectedSymbolException("Unexpected symbol"),
				new UnexpectedEndStringException("Unexpected end of string.")};
		return errors;
	}

	@Override
	public int[][][] fillTable() {
		int [][][] table = 
		{						// 0 	  1 	 2	 	3 	   4
		/*other*/				{{6,0}, {5,3}, {6,0}, {5,3}, {4,0}},
/*!*/	/*letter _ */			{{1,1}, {1,1}, {3,1}, {3,1}, {4,0}}, //plus space and comma [byASD]
		/*digit*/				{{6,0}, {1,1}, {6,0}, {3,1}, {4,0}},		
		/* . */					{{6,0}, {2,1}, {6,0}, {2,1}, {4,0}},
		/* [ */					{{6,0}, {4,0}, {6,0}, {4,0}, {4,0}},
		/* ] */					{{6,0}, {6,0}, {6,0}, {6,0}, {5,0}},
		/* end */				{{7,0}, {5,3}, {7,0}, {5,3}, {7,0}},
		/* ( */					{{6,0}, {5,2}, {6,0}, {5,2}, {4,0}}	
		};
		return table;
	}

}
