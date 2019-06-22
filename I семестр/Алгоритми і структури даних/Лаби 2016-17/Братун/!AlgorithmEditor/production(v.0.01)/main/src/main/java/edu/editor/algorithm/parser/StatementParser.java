package edu.editor.algorithm.parser;

import edu.editor.algorithm.codegenerator.PseudoLanguage;
import edu.editor.algorithm.model.AlgorithmModel;
import edu.editor.algorithm.model.component.AbstractComponent;
import edu.editor.algorithm.model.component.block.*;
import edu.editor.algorithm.parser.operand.*;
import edu.editor.algorithm.parser.tables.Initiator;
import edu.editor.algorithm.parser.tables.ParseStatement;

import javax.swing.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;

public class StatementParser extends Thinker{
	/**
	 * Вершина дерева разбора
	 */
	private Operand first;
	
	/**
	 * Текущий операнд, который парсится
	 */
	//private Operand current = first;
	
	/**
	 * Строка, которая парсится
	 */
	//private String str;
	
	/**
	 * Текущая позиция, которая парсится (номер символа в строке).
	 */
	//private int position = 0;
	
	
	public StatementParser(Initiator init, OperandWrapper ow){
		super(init,ow);
		first = current;
	}
	
	public StatementParser(AlgorithmModel model){
		super(new ParseStatement(),new OperandWrapper(""));
		this.model = model;
		first = current;
	}
	
	public StatementParser(Initiator init, OperandWrapper ow, AlgorithmModel m){
		super(init,ow, m);
		first = current;
	}
//5+2*3*8/4*6*8


	public void parseModel(){
		model.firstVariablesAppearanceMap = new HashMap<AbstractBlock, ArrayList<String>>();
		model.setVariables(new ArrayList<Variable>());
		ArrayList <AbstractBlock> list = new ArrayList<AbstractBlock>();
		ArrayList<AbstractComponent> comp = model.getComponents();

		for (int i=0; i<comp.size(); i++){
            if ((comp.get(i) instanceof Begin) || (comp.get(i) instanceof BeginActivity)) {
				//!todo null is Ok?
                addBlockStructureToList(((AbstractBlock) comp.get(i)).getOutputConnection(), null, list);
            }
		}

		for (int i=0; i<list.size(); i++){
			currentBlock = list.get(i);
			str = currentBlock.getValue();
			first = new Operand();
			current = first;
			position = 0;
			state = 0;
			try {
				currentBlock.setParsedValue(parse().operand);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

    private void addBlockStructureToList(Connection start, AbstractBlock end, ArrayList<AbstractBlock> list) {
        currentBlock = start.getEndBlock();
        if (!currentBlock.equals(end)) {
            if ((currentBlock instanceof Operator && !(currentBlock instanceof ComplexOperator)) ||
                    //currentBlock instanceof Condition ||
                    currentBlock instanceof Output ||
                    currentBlock instanceof Input) {
                list.add(currentBlock);

                addBlockStructureToList(currentBlock.getOutputConnection(), end, list);
                /*//!todo! add Condition.SecondOutput and Connector*/

            /*if (currentBlock instanceof Condition) {
                addBlockStructureToList(((Condition) currentBlock).getSecondOutputConnection(), list);
            }*/
            } else {
                if (currentBlock instanceof AbstractTimerBlock) {
                    addBlockStructureToList(currentBlock.getOutputConnection(), end, list);
                } else {
                    if (currentBlock instanceof Connector) {
                        Connection sec = ((Connector) currentBlock).getSecondInputConnection();
                        if (sec.equals(start)) sec = currentBlock.getInputConnection();
                        if (sec.getStartBlock() instanceof Condition) {
                            addBlockStructureToList(currentBlock.getOutputConnection(), sec.getStartBlock(), list);
                            addBlockStructureToList(sec.getStartBlock().getOutputConnection(), end, list);
                        } else {
                            if (currentBlock.getOutputConnection().getEndBlock() instanceof Condition) {
                                Condition cond = (Condition) currentBlock.getOutputConnection().getEndBlock();
                                list.add(cond);
                                addBlockStructureToList(cond.getOutputConnection(), currentBlock, list);
                                addBlockStructureToList(cond.getSecondOutputConnection(), end, list);
                            }
                        }
                    } else {
                        if (currentBlock instanceof Condition) {
                            list.add(currentBlock);
                            Condition currentCondition = (Condition) currentBlock;
                            Connector appropriateConnector = PseudoLanguage.getEndIf(currentCondition);
                            addBlockStructureToList(currentCondition.getOutputConnection(), appropriateConnector, list);
                            addBlockStructureToList(currentCondition.getSecondOutputConnection(), appropriateConnector, list);
                            addBlockStructureToList(appropriateConnector.getOutputConnection(), end, list);
                        }
                    }
                }

            /*if (currentBlock.getOutputConnection() != null) {
            }*/
            }
        }
    }

    public OperandWrapper parse () throws Exception{
//ASD	if (str.equals("")|| str ==null) return null;
		if (str == null) return null;
		char c;
		int sym;
		for (;position<=str.length(); position++){
			if (position==str.length()){
				c = 0;
			}else{
				c = str.charAt(position);
			}
			sym = classTable[c];
			actions[table[sym][state][1]].doSmth(c, this);
			state = table[sym][state][0];
			if (state == table[0].length){
				break;
			}
			if(state>table[0].length){
				System.out.println("root exeption");
				System.out.println("Parsed string: "+str);
				if (position<str.length()){
					System.out.println("Parsed symbol: "+str.charAt(position)+" at "+position);
				}
				throw errors[state-table[0].length-1];
			}
		}
		return new OperandWrapper(first,str, position);
	}
	
	public Operand getFirst (){
		return first;
	}
	
	public void setFirst (Operand op){
		first = op;
	}
	
	public static String getBracketedExpression (String str, int pos) throws Exception{
		String res = "";
		if (str.charAt(pos) == '('){
			int count = 1;
			int i=++pos;
			while (i<str.length() && count !=0){
				if (str.charAt(i)==')'){
					count--;
				}
				if (str.charAt(i)=='('){
					count++;
				}
				if (count !=0){
					res+=str.charAt(i);
				}
				i++; 
			}
			if (count >0){
				System.out.println("Parsed string: "+str);
				if (i<str.length()){
					System.out.println("Parsed symbol: "+str.charAt(i)+" at "+i);
					throw new Exception ("unbalanced parentheses");
				}
				throw new Exception ("unbalanced parentheses at the END of string");
			}
		}
		
		return res;
	}
	
	public Statement getStatementBeforeCurrent(){
		Operand op = getOperandBefore(current);
		while (op!=null && op instanceof Function){
			op = getOperandBefore(op);
		}
		if (op instanceof Statement){
			return (Statement)op;
		}else {
			return null;
		}
	}
	
	public Statement getStatementBefore(Operand current){
		Operand op = getOperandBefore(current);
		while (op!=null && op instanceof Function){
			op = getOperandBefore(op);
		}
		if (op instanceof Statement){
			return (Statement)op;
		}else {
			return null;
		}
	}
	
	
	public static Operand lookForOperandBefore (Operand target, Operand currentStage){
		if (target == currentStage) return null; 
		if (currentStage instanceof Function){
			if (((Function)currentStage).getArgument() == target){
				return currentStage;
			}
			return lookForOperandBefore(target, ((Function)currentStage).getArgument());
		}
		if (currentStage instanceof Statement){
			if ( ((Statement)currentStage).getLeft()==target){
				return currentStage;
			}
			if ( ((Statement)currentStage).getRight()==target){
				return currentStage;
			}
			Operand res = lookForOperandBefore(target, ((Statement)currentStage).getLeft() );
			if (res !=null) return res;
			res = lookForOperandBefore(target, ((Statement)currentStage).getRight() );
			return res;
		}
		if (currentStage instanceof Bracket){
			if (((Bracket)currentStage).getExpression()==target){
				return currentStage;
			}
			return lookForOperandBefore(target, ((Bracket)currentStage).getExpression());
		}
		return null;
	}
	
	//private, потому что не обходит все дерево, а ходит только по самой правой ветке
	private Operand getOperandBefore(Operand cur){
		Operand op = first;
		Operand op1 = op;
		while (op!=null && !op.equals(cur)){
			if (op instanceof Function){
				op1 = op;
				op = ((Function)op).getArgument();
			}else{
				if (op instanceof Statement){
					op1 = op;
					op=((Statement)op).getRight();
				}else{
					//На всякий пожарный. Вдруг там дерево порвано)
					op=null;
					op1 = null;
				}
			}
		}
		return op1;
	}
	
	public static void main(String[] args) {
		
		BufferedReader bin = new BufferedReader(new InputStreamReader(System.in));
		try {
			String s = bin.readLine();
			OperandWrapper ow = new OperandWrapper(s);
			StatementParser thinker = new StatementParser(new ParseStatement(), ow);
			try {
				ow = thinker.parse();
				System.out.println("Before");
				ow.operand.testPrint();
				System.out.println("After");
				JFrame frame1 = new JFrame("Tree");
				frame1.setBounds(100,100,400, 600);
				frame1.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
				frame1.getContentPane().add(new TreeApplet(ow.operand));
				frame1.setVisible(true);
				Calculator calc = new Calculator(ow.operand);
				calc.clearTree().testPrint();
				Paraleller par = new Paraleller(calc.first);
				System.out.println();
				System.out.println("Parallel form");
				par.parallel().testPrint();
				JFrame frame = new JFrame("Tree");
				frame.setBounds(100,100,400, 600);
				frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
				frame.getContentPane().add(new TreeApplet(par.first));
				frame.setVisible(true);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
	
	public void setCurrent(Operand op){
		Statement stat = getStatementBeforeCurrent();
		if (stat != null){
			stat.setRight(op);
		}
		if (first == current){
			first = op;
		}
		current = op;
	}
	
	
}
