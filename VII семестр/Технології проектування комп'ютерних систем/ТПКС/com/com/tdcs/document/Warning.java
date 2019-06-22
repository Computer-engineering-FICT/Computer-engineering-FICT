package com.tdcs.document;

import java.awt.Color;

import javax.swing.text.BadLocationException;
import javax.swing.text.DefaultHighlighter;
import javax.swing.text.Highlighter;

public class Warning implements Hint {
	private int begin, end;
	private String text;

	public Warning(String text, int begin, int end) {
		this.begin = begin;
		this.end = end;
		this.setText(text);
	}

	@Override
	public void mark(Highlighter h) {
		try {
			h.addHighlight(
					begin,
					end,
					new DefaultHighlighter.DefaultHighlightPainter(Color.yellow));
		} catch (BadLocationException e) {
			e.printStackTrace();
		}

	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	@Override
	public String getMessage() {
		return "Warning: " + text;
	}

}
