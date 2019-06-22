package edu.editor.algorithm.language;

import edu.editor.algorithm.parser.operand.*;

public class AssemblerTranslator implements Translator {

    @Override
    public String translate(Operand op) {
        String res = op.getValue();
        if (op instanceof Text){
            /*res.replaceAll("'", "''");
            res.replaceAll("\n", "',#13,'");*/
//            res = "'"+res+"'";
        }
        return res;
    }
}
