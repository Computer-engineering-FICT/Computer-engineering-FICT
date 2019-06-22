package edu.editor.algorithm.language;

public class TransparentLanguage implements IntLanguage{
	
	@Override
	public String IOInterpreter(String value) {
		return value;
	}
}
