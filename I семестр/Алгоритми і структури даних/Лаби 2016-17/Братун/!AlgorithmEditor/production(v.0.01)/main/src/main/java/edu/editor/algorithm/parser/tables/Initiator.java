package edu.editor.algorithm.parser.tables;

import edu.editor.algorithm.parser.actions.Action;

public interface Initiator {
	public Action [] fillActions();
	public int [][][] fillTable ();
	public Exception[] fillErrors();
	public int [] fillClassTable();
	
	
}
