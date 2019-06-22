package edu.editor.algorithm.language;

import edu.editor.algorithm.parser.operand.Operand;

public interface Translator {
	public String translate (Operand op);
}
