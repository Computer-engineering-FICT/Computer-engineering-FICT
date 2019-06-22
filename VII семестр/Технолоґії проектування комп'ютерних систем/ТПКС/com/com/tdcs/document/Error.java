package com.tdcs.document;

import java.awt.Color;

import javax.swing.text.BadLocationException;
import javax.swing.text.DefaultHighlighter;
import javax.swing.text.Highlighter;

public class Error implements Hint {
	private int begin, end;
	private String text;

	public Error(String text, int begin, int end) {
		this.begin = begin;
		this.end = end;
		this.text = text;
	}

	@Override
	public void mark(Highlighter h) {
		try {
			h.addHighlight(begin, end,
					new DefaultHighlighter.DefaultHighlightPainter(Color.red));
		} catch (BadLocationException e) {
			e.printStackTrace();
		}
	}

	public String toString() {
		return "(" + begin + ":" + end + "): " + text;
	}

	@Override
	public String getMessage() {
		return "Error: " + text;
	}
}
