package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.StatementParser;
import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.Statement;

public class AddDivMulStatement implements Action{

	public void doSmth(char c, Thinker thinker) throws Exception {
		if (((StatementParser)thinker).getFirst()==thinker.getCurrent()){
			new AddStatementToCurrent().doSmth(c, thinker);
		}else{
			char[] ca = new char[1];
			ca[0]=c;
			String val = new String(ca);
			Statement tmp=((StatementParser)thinker).getStatementBefore(thinker.getCurrent());

			while(tmp != null && tmp != ((StatementParser)thinker).getFirst()
					&&(tmp.getValue().equals("*") || tmp.getValue().equals("&")||
					tmp.getValue().equals("/") || tmp.getValue().equals("%"))){
				tmp = ((StatementParser)thinker).getStatementBefore(tmp);
			};
			if (tmp==null){
				throw new Exception("I don't know, what it is (Add division failed)");
			}
			
			
			Statement div = new Statement(tmp.getRight(),val);
			if (tmp ==((StatementParser)thinker).getFirst()&&(tmp.getValue().equals("*") ||
					tmp.getValue().equals("/") || tmp.getValue().equals("%") || tmp.getValue().equals("&"))){
				div = new Statement(tmp,val);
				((StatementParser)thinker).setFirst(div);
				
			}else{
				tmp.setRight(div);
			}
			thinker.setCurrentManually(div.getRight());
			
		}
	}

}
