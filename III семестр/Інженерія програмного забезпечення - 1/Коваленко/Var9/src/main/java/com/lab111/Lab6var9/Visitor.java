package com.lab111.Lab6var9;

/**
 * Interface Visitor - declaration of methods for price calculation
 * @author A
 * @version 6.9
 */
public interface Visitor {
	public void visit(Cable c);
	public void visit(Server s);
	public void visit(WorkStation ws);


}
