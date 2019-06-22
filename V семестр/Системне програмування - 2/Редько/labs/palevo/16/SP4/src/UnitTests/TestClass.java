package UnitTests;

import LexicalScaner.IncorectTokenException;
import LexicalScaner.LexicalAnalizator;
import LexicalScaner.Token;
import SyntaxicAnalizer.Element;
import SyntaxicAnalizer.Rule;
import SyntaxicAnalizer.SyntaxAnalizer;
import com.sun.javaws.exceptions.InvalidArgumentException;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import junit.textui.TestRunner;
import table.Record;
import table.Table;
import tree.Node;
import tree.TablesOperator;
import Automat.*;

import java.util.ArrayList;

public class TestClass extends TestCase{
    public TestClass(String testName) {
        super(testName);
    }

    public LexicalAnalizator createLexicalAnalizator(){
        String[]automateFiles=new String[2];
        automateFiles[0]="C:\\automats\\automat1.txt";
        automateFiles[1]="C:\\automats\\automat3.txt";
        LexicalAnalizator lexicalAnalizator=null;
        try{
            AutomatesManager automatesManager=new AutomatesManager(automateFiles);
            Table delimiters=new Table();
            delimiters.insert(new Record(" ",null));//0
            delimiters.insert(new Record(",",null));//1
            delimiters.insert(new Record(".",null));//2
            delimiters.insert(new Record("(",null));//3
            delimiters.insert(new Record(")",null));//4
            delimiters.insert(new Record("+",null));//5
            delimiters.insert(new Record("-",null));//6
            delimiters.insert(new Record("*",null));//7
            delimiters.insert(new Record("/",null));//8
            delimiters.insert(new Record("<",null));//9
            delimiters.insert(new Record(">",null));//10
            delimiters.insert(new Record("=",null));//11
            delimiters.insert(new Record(";",null));//12
            delimiters.insert(new Record("{",null));//13
            delimiters.insert(new Record("}",null));//14
            delimiters.insert(new Record("&",null));//17     \
            delimiters.insert(new Record("|",null));//18

            Table terminalWords=new Table();
            terminalWords.insert(new Record("if", null));//0
            terminalWords.insert(new Record("while",null));//1
            terminalWords.insert(new Record("int",null));//2
            terminalWords.insert(new Record("bool",null));//3
            terminalWords.insert(new Record("true",null));//4
            terminalWords.insert(new Record("false",null));//5
            terminalWords.insert(new Record("else",null));//6

            lexicalAnalizator=new LexicalAnalizator(delimiters,terminalWords,automatesManager);


        }catch (Exception e){
            e.printStackTrace();
        }
        return lexicalAnalizator;
    }


    public SyntaxAnalizer createSyntaxAnalizer(){
        ArrayList<Rule> rules=new ArrayList<Rule>();

        try{

            ArrayList<Element> elements=new ArrayList<Element>();
            elements.add(new Element(Rule.EXPR+"expr"));
            elements.add(new Element(Rule.EXPR+"unop"));
            Rule expr1=new Rule("expr",elements,89);
            rules.add(expr1);

            elements=new ArrayList<Element>();
            elements.add(new Element(Rule.EXPR+"expr"));
            elements.add(new Element(Rule.EXPR+"op"));
            elements.add(new Element(Rule.EXPR+"expr"));
            Rule expr2=new Rule("expr",elements,87);
            rules.add(expr2);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("(",Token.DELIMITER,3)));
            elements.add(new Element(Rule.EXPR+"expr"));
            elements.add(new Element(new Token(")",Token.DELIMITER,4)));
            Rule expr3=new Rule("expr",elements,88);
            rules.add(expr3);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("",Token.IDENTIFIER,0)));
            Rule expr4=new Rule("expr",elements,97);
            rules.add(expr4);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("",Token.CONSTANT,0)));
            Rule expr5=new Rule("expr",elements,97);
            rules.add(expr5);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("+",Token.DELIMITER,5)));
            Rule op1=new Rule("op",elements,90);
            rules.add(op1);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("-",Token.DELIMITER,6)));
            Rule op2=new Rule("op",elements,91);
            rules.add(op2);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("*",Token.DELIMITER,7)));
            Rule op3=new Rule("op",elements,92);
            rules.add(op3);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("/",Token.DELIMITER,8)));
            Rule op4=new Rule("op",elements,97);
            rules.add(op4);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("+",Token.DELIMITER,5)));
            elements.add(new Element(new Token("+",Token.DELIMITER,5)));
            Rule unop1=new Rule("unop",elements,100);
            rules.add(unop1);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("-",Token.DELIMITER,6)));
            elements.add(new Element(new Token("-",Token.DELIMITER,6)));
            Rule unop2=new Rule("unop",elements,99);
            rules.add(unop2);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token(">",Token.DELIMITER,10)));
            Rule boolOp1=new Rule("boolop",elements,94);
            rules.add(boolOp1);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("<",Token.DELIMITER,9)));
            Rule boolOp2=new Rule("boolop",elements,95);
            rules.add(boolOp2);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("=",Token.DELIMITER,11)));
            elements.add(new Element(new Token("=",Token.DELIMITER,11)));
            Rule boolOp3=new Rule("boolop",elements,96);
            rules.add(boolOp3);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("&",Token.DELIMITER,17)));
            elements.add(new Element(new Token("&",Token.DELIMITER,17)));
            Rule logicOp1=new Rule("logicop",elements,83);
            rules.add(logicOp1);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("|",Token.DELIMITER,18)));
            elements.add(new Element(new Token("|",Token.DELIMITER,18)));
            Rule logicOp2=new Rule("logicop",elements,82);
            rules.add(logicOp2);

            elements=new ArrayList<Element>();
            elements.add(new Element(Rule.EXPR+"expr"));
            elements.add(new Element(new Token("=",Token.DELIMITER,11)));
            elements.add(new Element(Rule.EXPR+"expr"));
            elements.add(new Element(new Token("",Token.DELIMITER,12)));
            Rule assignment=new Rule("assignment",elements,86);
            rules.add(assignment);

            elements=new ArrayList<Element>();
            elements.add(new Element(Rule.EXPR+"expr"));
            elements.add(new Element(Rule.EXPR+"boolop"));
            elements.add(new Element(Rule.EXPR+"expr"));
            Rule boolExpr1=new Rule("boolexpr",elements,81);
            rules.add(boolExpr1);

            elements=new ArrayList<Element>();
            elements.add(new Element(Rule.EXPR+"boolexpr"));
            elements.add(new Element(Rule.EXPR+"logicop"));
            elements.add(new Element(Rule.EXPR+"boolexpr"));
            Rule boolExpr2=new Rule("boolexpr",elements,80);
            rules.add(boolExpr2);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("",Token.TERMINALWORD,4)));
            Rule boolExpr3=new Rule("boolexpr",elements,85);
            rules.add(boolExpr3);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("",Token.TERMINALWORD,5)));
            Rule boolExpr4=new Rule("boolexpr",elements,84);
            rules.add(boolExpr4);

            elements=new ArrayList<Element>();
            elements.add(new Element(Rule.EXPR+"operator"));
            Rule operatorList1=new Rule("operatorlist",elements,75);
            rules.add(operatorList1);

            elements=new ArrayList<Element>();
            elements.add(new Element(Rule.EXPR+"operator"));
            elements.add(new Element(Rule.EXPR+"operatorlist"));
            Rule operatorLis2=new Rule("operatorlist",elements,74);
            rules.add(operatorLis2);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("if",Token.TERMINALWORD,0)));
            elements.add(new Element(new Token("(",Token.DELIMITER,3)));
            elements.add(new Element(Rule.EXPR+"boolexpr"));
            elements.add(new Element(new Token(")",Token.DELIMITER,4)));
            elements.add(new Element(Rule.EXPR+"operator"));
            elements.add(new Element(new Token(";",Token.DELIMITER,12)));
            Rule operator1=new Rule("operator",elements,78);
            rules.add(operator1);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("if",Token.TERMINALWORD,0)));
            elements.add(new Element(new Token("(",Token.DELIMITER,3)));
            elements.add(new Element(Rule.EXPR+"boolexpr"));
            elements.add(new Element(new Token(")",Token.DELIMITER,4)));
            elements.add(new Element(Rule.EXPR+"operator"));
            elements.add(new Element(new Token("else",Token.TERMINALWORD,6)));
            elements.add(new Element(Rule.EXPR+"operator"));
            elements.add(new Element(new Token(";",Token.DELIMITER,12)));
            Rule operator2=new Rule("operator",elements,79);
            rules.add(operator2);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("while",Token.TERMINALWORD,1)));
            elements.add(new Element(new Token("(",Token.DELIMITER,3)));
            elements.add(new Element(Rule.EXPR+"boolexpr"));
            elements.add(new Element(new Token(")",Token.DELIMITER,4)));
            elements.add(new Element(Rule.EXPR+"operator"));
            elements.add(new Element(new Token(";",Token.DELIMITER,12)));
            Rule operator3=new Rule("operator",elements,77);
            rules.add(operator3);

            elements=new ArrayList<Element>();
            elements.add(new Element(Rule.EXPR+"assignment"));
            Rule operator4=new Rule("operator",elements,76);
            rules.add(operator4);

            elements=new ArrayList<Element>();
            elements.add(new Element(new Token("{",Token.DELIMITER,13)));
            elements.add(new Element(Rule.EXPR+"operatorlist"));
            elements.add(new Element(new Token("}",Token.DELIMITER,14)));
            Rule operator5=new Rule("operator",elements,73);
            rules.add(operator5);

            elements=new ArrayList<Element>();
            elements.add(new Element(Rule.EXPR+"expr"));
            elements.add(new Element(new Token(";",Token.DELIMITER,12)));
            Rule operator6=new Rule("operator",elements,73);
            rules.add(operator6);

            SyntaxAnalizer syntaxAnalizer=new SyntaxAnalizer(rules);
            return  syntaxAnalizer;
        }catch (InvalidArgumentException ex){
            return null;
        }
        catch (IncorectTokenException e){
            return null;
        }
    }


    public void checkSyntaxAnalizer(){
        SyntaxAnalizer analizer=this.createSyntaxAnalizer();
        LexicalAnalizator lexicalAnalizator=this.createLexicalAnalizator();
        try{
            lexicalAnalizator.analize("c=(d+5)*a");
        }catch (Exception ex){
            System.out.println("Lexical analizer exception");
        }

        analizer.analize(lexicalAnalizator);
    }

    public static void main(String[] args) {
        TestRunner runner = new TestRunner();
        TestSuite suite = new TestSuite();
        //suite.addTest(new TestClass("testTree"));
        //suite.addTest(new TestClass("test1Tree"));
        //suite.addTest(new TestClass("testLoadAutomate"));
        //suite.addTest(new TestClass("testAutomate"));
        //suite.addTest(new TestClass("testMethodScan"));
        //suite.addTest(new TestClass("testLexicalAnalizator"));
        suite.addTest(new TestClass("checkSyntaxAnalizer"));
        runner.doRun(suite);
    }
}
