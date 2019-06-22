package edu.editor.algorithm.parser.actions;

import edu.editor.algorithm.parser.Thinker;
import edu.editor.algorithm.parser.operand.OperandWrapper;
import edu.editor.algorithm.parser.operand.Text;
import edu.editor.algorithm.parser.tables.ParseText;

public class BeginString implements Action{

	public void doSmth(char c, Thinker thinker) throws Exception {
		OperandWrapper ow = new OperandWrapper(new Text(),thinker.getString(),thinker.getPosition());
		Thinker texth = new Thinker(new ParseText(), ow);
		ow = texth.parse();
		thinker.setCurrent(ow.operand);
		thinker.setPosition(ow.position);
	}

}
