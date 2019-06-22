package com.tdcs.compiler;

import com.tdcs.document.Hint;

public class AlgorithmException extends Exception {

	private static final long serialVersionUID = 1L;

	private Hint h;
	
	public AlgorithmException(String text) {
		super(text);
	}

	public AlgorithmException(String text, Hint h) {
		super(text);
		this.setH(h);
	}

	public Hint getH() {
		return h;
	}

	public void setH(Hint h) {
		this.h = h;
	}

	
}
