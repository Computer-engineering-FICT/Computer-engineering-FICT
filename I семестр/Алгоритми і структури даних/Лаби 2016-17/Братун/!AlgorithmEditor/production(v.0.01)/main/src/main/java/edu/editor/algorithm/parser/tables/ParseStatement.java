package edu.editor.algorithm.parser.tables;

import edu.editor.algorithm.parser.actions.Action;
import edu.editor.algorithm.parser.actions.AddDivMulStatement;
import edu.editor.algorithm.parser.actions.AddStatementToCurrent;
import edu.editor.algorithm.parser.actions.AddStatementToRoot;
import edu.editor.algorithm.parser.actions.BeginBracket;
import edu.editor.algorithm.parser.actions.BeginNumber;
import edu.editor.algorithm.parser.actions.BeginString;
import edu.editor.algorithm.parser.actions.BeginVariable;
import edu.editor.algorithm.parser.actions.ConvertAssignToCheckEquality;
import edu.editor.algorithm.parser.actions.DoNothing;
import edu.editor.algorithm.parser.exceptions.DuplicateAssignException;
import edu.editor.algorithm.parser.exceptions.UnexpectedEndStringException;
import edu.editor.algorithm.parser.exceptions.UnexpectedSymbolException;

public class ParseStatement implements Initiator{

	public Action[] fillActions() {
		Action [] actions = {new DoNothing(),new BeginVariable(), new BeginNumber(),
				new BeginString(), new AddStatementToRoot(), new AddStatementToCurrent(),
				new ConvertAssignToCheckEquality(), new BeginBracket(), new AddDivMulStatement()};
		return actions;
	}

	public int[] fillClassTable() {
		int [] classTable = new int[257];
		classTable['_']=1;
		for(int i='A'; i<='Z'; i++){
			classTable[i]=1;
		}
		for(int i='a'; i<='z'; i++){
			classTable[i]=1;
		}
		
		for (int i='0'; i<='9'; i++){
			classTable[i]=2;
		}
		classTable['.']=2;
		
		classTable[' ']=3;
		
		classTable['"']=4;
		classTable['\'']=4; /*byASD*/

		classTable['+']=5;
		classTable['-']=5;
		
		classTable['|']=6;
		classTable['>']=6;
		classTable['<']=6;
		
		classTable['&']=7;
		classTable['*']=7;
		classTable['/']=7;
		classTable['%']=7;
		
		classTable['(']=8;
		
		classTable[';']=9;
		classTable['\n']=9;
//ASD	classTable[0] = 9;
		classTable[0] = 3;
		classTable[']'] = 3;

		classTable['='] = 10;
		return classTable;
	}

	public Exception[] fillErrors() {
		Exception[] exceptions = {new UnexpectedSymbolException("Unexpected symbol"),
				new DuplicateAssignException("Duplicate assign in statement"),
				new UnexpectedEndStringException("Unexpected end of string.")};
		return exceptions;
	}

	
	public int[][][] fillTable() {
		int [][][] table = {
								//0 	  1 	 2 		3 		4 
			/*other*/			{{6,0}, {6,0}, {6,0}, {6,0}, {6,0}},
			/*letter or _*/		{{1,1}, {6,0}, {3,1}, {6,0}, {7,0}},
			/*digit*/			{{1,2}, {6,0}, {3,2}, {6,0}, {7,0}},
//!ASD		/*space*/			{{0,0}, {1,0}, {2,0}, {3,0}, {4,0}},
			/*space*/			{{0,0}, {0,0}, {2,0}, {3,0}, {4,0}}, //+ empty character + ']' (byASD)
			/* " */				{{1,3}, {6,0}, {3,3}, {6,0}, {7,0}},
			/* + -*/			{{1,2}, {0,4}, {3,2}, {2,4}, {6,0}},			
			/* | > <*/			{{6,0}, {0,4}, {6,0}, {2,4}, {6,0}},
			/* &  * / % */		{{6,0}, {0,8}, {6,0}, {2,8}, {6,0}},			
			/* ( */				{{1,7}, {6,0}, {3,7}, {6,0}, {6,0}},
			/* ; enter end*/	{{8,0}, {5,0}, {8,0}, {5,0}, {8,0}},
//!ASD		/* = */				{{6,0}, {2,4}, {0,6}, {4,4}, {2,6}} 
			/* = */				{{2,4}, {2,4}, {0,6}, {4,4}, {2,6}}	//!NO GOOD (statement can start from '=')
		};
		return table;
	}

}
