package lab1;

import lab1.command.AddEnd;
import lab1.command.AddToName;
import lab1.command.ChangeRule;
import lab1.command.EndSomeElement;
import lab1.command.Error;
import lab1.command.Exit;
import lab1.command.NullOp;
import lab1.command.ReactionManager;
import lab1.command.StartBlock;
import lab1.rule.Rule;
import lab1.rule.RulesManager;
import lab1.ui.MyFrame;

/**
 * @author Dmytro Pogrebnjuk
 *
 */
public class Main {
	public static final String endOfLine = "/eol";
	public static final String endOfFile = "/eof";
	public static final String space = "/space";
	public static final String defaultS = "/default";
	public static final String digit = "1 2 3 4 5 6 7 8 9 0";
	
	public static enum TypeOfBlock {
		begin, operation, condition, up, down, end
	}

	public static void main(String[] args) {

		ReactionManager instance = ReactionManager.getInstance();
		// ------------Action---------------------------------------------------
		NullOp nullOp = new NullOp("NullOp");
		AddToName addToNamen = new AddToName("AddToName");
		AddEnd addEnd = new AddEnd("AddEnd");
		EndSomeElement endSomeElement = new EndSomeElement("EndSomeElement");
		StartBlock startOperation = new StartBlock("StartOperation", 
				TypeOfBlock.operation);
		StartBlock startCondition = new StartBlock("StartCondition", 
				TypeOfBlock.condition);
		StartBlock startUp = new StartBlock("StartUp", 
				TypeOfBlock.up);
		StartBlock startDown = new StartBlock("StartDown", 
				TypeOfBlock.down);
		Exit exit = new Exit("Exit");

		instance.addReaction(nullOp);
		instance.addReaction(addToNamen);
		instance.addReaction(endSomeElement);
		instance.addReaction(startOperation);
		instance.addReaction(startCondition);
		instance.addReaction(startUp);
		instance.addReaction(startDown);
		instance.addReaction(exit);
		instance.addReaction(addEnd);
		// ----------Rule changing----------------------------------------------
		// 1й параметр - назва зміни правил
		// 2й параметр - назва реакції, яку потрібно виконати
		// 3й параметр - назва правила, на яке змінити
		ChangeRule centreRuleCH = new ChangeRule("CentreRuleCH", 
				"EndSomeElement", "CentreRule");
		ChangeRule operationCH = new ChangeRule("OperationCH",
				"StartOperation", "OperationRule");
		ChangeRule conditionCH = new ChangeRule("ConditionCH",
				"StartCondition", "ConditionRule");
		ChangeRule upCH = new ChangeRule("UpCH",
				"StartUp", "UpRule");
		ChangeRule downCH = new ChangeRule("DownCH",
				"StartDown", "DownRule");
		
		instance.addReaction(centreRuleCH);
		instance.addReaction(operationCH);
		instance.addReaction(conditionCH);
		instance.addReaction(upCH);
		instance.addReaction(downCH);
		// -------------Errors--------------------------------------------------
		Error noBegin = new Error("NoBegin", "No begin.");
		Error unknownCharacter = new Error("UnknownCharacter",
				"Unknown character.");

		instance.addReaction(noBegin);
		instance.addReaction(unknownCharacter);
		// -------------Rules---------------------------------------------------
		String b = "B b"; String y = "Y y"; String x = "X x"; String u = "^";
		String d = "V v"; String e = "E e";
		String[][] startRule = { 
				{ b,                       "Rule CentreRuleCH" },
				{ space + " " + endOfLine, "1 NullOp" },
				{ defaultS,                "Error NoBegin" } 
				};
		String[][] centreRule = { 
				{ space + " " + endOfLine, "1 NullOp" },
				{ endOfFile,                "1 Exit" },
				{ y,                       "Rule OperationCH" },
				{ x,                       "Rule ConditionCH" },
				{ u,                       "Rule UpCH" },
				{ d,                       "Rule DownCH" },
				{ e,                       "1 AddEnd"},
				{ defaultS,                "Error UnknownCharacter" }
				};
		String[][] operationRule = {
				{ digit,                   "1 AddToName" },
				{ space + " " + endOfLine, "Rule CentreRuleCH" },
				{ endOfFile,                "1 Exit" },				
				{ defaultS,                "Error UnknownCharacter" }				
				};
		String[][] conditionRule = {
				{ digit,                   "1 AddToName" },
				{ space + " " + endOfLine, "Rule CentreRuleCH" },
				{ endOfFile,                "1 Exit" },				
				{ defaultS,                "Error UnknownCharacter" }
				};
		String[][] upRule = {
				{ digit,                   "1 AddToName" },
				{ space + " " + endOfLine, "Rule CentreRuleCH" },
				{ endOfFile,                "1 Exit" },				
				{ defaultS,                "Error UnknownCharacter" }
				};
		String[][] downRule = {
				{ digit,                   "1 AddToName" },
				{ space + " " + endOfLine, "Rule CentreRuleCH" },
				{ endOfFile,                "1 Exit" },				
				{ defaultS,                "Error UnknownCharacter" }
				};

		// після виявлення помилки стан буде мати номер -1

		Rule rule = new Rule("StartRule", startRule);
		RulesManager.getInstance().addRule(rule, true);

		rule = new Rule("CentreRule", centreRule);
		RulesManager.getInstance().addRule(rule);

		rule = new Rule("OperationRule", operationRule);
		RulesManager.getInstance().addRule(rule);
		
		rule = new Rule("ConditionRule", conditionRule);
		RulesManager.getInstance().addRule(rule);
		
		rule = new Rule("UpRule", upRule);
		RulesManager.getInstance().addRule(rule);		

		rule = new Rule("DownRule", downRule);
		RulesManager.getInstance().addRule(rule);

		ServiceClass.set_curBlock(TypeOfBlock.begin);
		
		Parser parser = Parser.getInstance();
		//покажемо це все на фреймі

		try {
			parser.start("E:\\work\\Java\\Eclipse\\APKS\\src\\lab1\\text.txt");
			System.out.println("All right with your algorithm.");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		@SuppressWarnings("unused")
		MyFrame mf = new MyFrame(); 
	}
}
