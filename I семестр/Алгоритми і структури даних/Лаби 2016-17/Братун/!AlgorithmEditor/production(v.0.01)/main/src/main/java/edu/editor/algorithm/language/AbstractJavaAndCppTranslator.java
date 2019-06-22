package edu.editor.algorithm.language;

import edu.editor.algorithm.parser.operand.Function;
import edu.editor.algorithm.parser.operand.Operand;
import edu.editor.algorithm.parser.operand.Statement;
import edu.editor.algorithm.parser.operand.Text;

public class AbstractJavaAndCppTranslator implements Translator {
    @Override
    public String translate(Operand op) {
        //TODO !op.type!
        if (op instanceof Statement) {
            Statement statement = (Statement) op;
            //TODO translate of functions
//			String result = statement.getLeft().getValue() + statement.getValue() + statement.getRight().getValue();
            String result = translate(((Statement)op).getLeft()) + statement.getValue() +
                    translate(((Statement)op).getRight());
            if (statement.getRight() instanceof Function) {
                result += "(" + ((Function)statement.getRight()).getArgument().getValue() + ")";
            }
            return result;
        } else {
            if (op instanceof Text){
                String res = op.getValue();
                /*res.replaceAll("'", "''");
                res.replaceAll("\n", "',#13,'");*/
                res = "\""+res+"\"";
                return res;
            }
        }
//		return op.getValue()+"()";
        return op.getValue();
    }
}
