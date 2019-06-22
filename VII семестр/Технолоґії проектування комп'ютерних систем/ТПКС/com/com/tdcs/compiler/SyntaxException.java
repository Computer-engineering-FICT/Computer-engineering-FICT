package com.tdcs.compiler;

import com.tdcs.document.Hint;

public class SyntaxException extends Exception {

	private static final long serialVersionUID = 1L;
	private Hint hint;

	public SyntaxException(Hint hint) {
		super("Syntax error: " + hint.toString());
		this.setHint(hint);
	}

	public Hint getHint() {
		return hint;
	}

	public void setHint(Hint hint) {
		this.hint = hint;
	}
}
