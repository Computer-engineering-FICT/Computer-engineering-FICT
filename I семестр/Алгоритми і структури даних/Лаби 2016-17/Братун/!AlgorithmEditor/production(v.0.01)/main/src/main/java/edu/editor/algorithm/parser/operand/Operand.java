package edu.editor.algorithm.parser.operand;

import java.io.Serializable;

public class Operand implements Serializable{

	private static final long serialVersionUID = 173584813481248974L;
	private String value="";
	public String getValue(){
		return value;
	}
	public void setValue(String value){
		this.value = value;
	}
	
	public void testPrint(){
		System.out.print(value);
	}

    public void addToValue(String str) {
        value += str;
    }
	
	/*public String getPascalCode(){
		return value;
	}*/
}
 