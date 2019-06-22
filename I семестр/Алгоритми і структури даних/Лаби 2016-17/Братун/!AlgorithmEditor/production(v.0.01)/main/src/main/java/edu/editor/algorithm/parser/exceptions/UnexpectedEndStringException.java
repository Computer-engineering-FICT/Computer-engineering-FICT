package edu.editor.algorithm.parser.exceptions;

public class UnexpectedEndStringException extends Exception{

	private static final long serialVersionUID = 3855255546984132013L;
	public UnexpectedEndStringException (String s){
		super(s);
	}
}
