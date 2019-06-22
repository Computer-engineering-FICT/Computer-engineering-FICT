package com.lab111.Lab6var9;

/**
 * @author A
 * @version 6.9
 */
public class Price implements Visitor{

	/**
	 * @see com.lab111.Lab6var9.Visitor#visit(com.lab111.Lab6var9.Cable)
	 */
	@Override
	public void visit(Cable c) {
		c.setPrice(c.getP());		
	}
	/**
	 * @see com.lab111.Lab6var9.Visitor#visit(com.lab111.Lab6var9.Server)
	 */
	@Override
	public void visit(Server s) {
		s.setPrice(s.getP());		
	}
	/**
	 * @see com.lab111.Lab6var9.Visitor#visit(com.lab111.Lab6var9.WorkStation)
	 */
	@Override
	public void visit(WorkStation ws) {
		ws.setPrice(ws.getP());		
	}
}