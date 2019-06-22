package com.tdcs.document;

import javax.swing.text.Highlighter;

public interface Hint {
	public void mark(Highlighter h);

	public String getMessage();
}
