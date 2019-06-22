package com.tdcs.model;

import java.io.Serializable;

public interface Node extends Element, Serializable{
	public Node getNextNode();
	public Node getNextNodeAlt();
}
