package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.Thinker;

public interface Action {
	public void doSmth(char c, Thinker thinker) throws Exception;
}