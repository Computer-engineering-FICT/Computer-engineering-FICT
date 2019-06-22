package edu.editor.algorithm.parser;

import java.util.ArrayList;

import edu.editor.algorithm.parser.operand.Bracket;
import edu.editor.algorithm.parser.operand.DoubleArg;
import edu.editor.algorithm.parser.operand.Function;
import edu.editor.algorithm.parser.operand.IntArg;
import edu.editor.algorithm.parser.operand.Operand;
import edu.editor.algorithm.parser.operand.Statement;

public class Calculator {
	Operand first;
	
	
	public Calculator(Operand first) {
		this.first = first;
	}
	
	
	/**
	 * "Причесывает" дерево от лишних констант.
	 */
	/*public Operand comb (){
		ArrayList <Statement> plus = new ArrayList<Statement>();
		if (first instanceof Statement &&( ((Statement)first).getValue().equals("+") || ((Statement)first).getValue().equals("-") )){
			lookForPlusConst((Statement) first, plus);
			
			ArrayList <IntArg> add = new ArrayList<IntArg>();
			ArrayList <IntArg> remove = new ArrayList<IntArg>();
			Statement root;
			if (plus.size()==1){
				
				root = plus.get(0);
				
				
				/*if (root.getLeft() instanceof IntArg) num.add((IntArg) root.getLeft());
				if (root.getLeft() instanceof IntArg) num.add((IntArg) root.getLeft());*/
				/*if (root.getLeft() instanceof IntArg && root.getRight() instanceof IntArg){
					/*if (root.getLeft() instanceof DoubleArg || root.getRight() instanceof DoubleArg){
						DoubleArg fin = new DoubleArg(((IntArg)root.getLeft()).getDoubleValue()
								+((IntArg)root.getRight()).getDoubleValue()
								);
						setOperandInsteadThis(root, fin);
						return first;
					}*/
		/*			add.add((IntArg) root.getLeft());
					if (root.getValue().equals("+")){
						add.add((IntArg) root.getRight());
					}else{
						remove.add((IntArg) root.getRight());
					}
					setOperandInsteadThis(root,calculateSum(add, remove));
				}
				
			}
			
			if (plus.size()>1){
				
				for (int i=0; i<plus.size(); i++){
					root = plus.get(i);
					if (root.getLeft() instanceof IntArg){
						add.add((IntArg) root.getLeft());
					}
					if (root.getRight() instanceof IntArg){
						if (root.getValue().equals("+")){
							add.add((IntArg) root.getRight());
						}else{
							remove.add((IntArg) root.getRight());
						}
					}					
				}
				
				IntArg res = calculateSum(add, remove);
				//Statement start = new Statement(res,"+");
				
				root = plus.get(0);
				if (root.getLeft() instanceof IntArg && root.getRight() instanceof IntArg){
					setOperandInsteadThis(root, res);
				}else{
					if (root.getLeft() instanceof IntArg){
						root.setLeft(res);
					}else{
						root.setRight(res); 
					}
				}
				//cleaning
				for (int i=1; i<plus.size(); i++){
					root = plus.get(i);
					if (root.getLeft() instanceof IntArg && root.getRight() instanceof IntArg){
						Statement prev = (Statement) StatementParser.lookForOperandBefore(root,first);
						while (prev!=null & plus.contains(prev) && prev != first){
							prev = (Statement) StatementParser.lookForOperandBefore(prev,first);
						}
						
					}
				}
				
			}
		}
		return first;
	}
	*/
	/*public void lookForPlusConst (Statement current, ArrayList <Statement> list){		
		if (current.getValue().equals("+") || current.getValue().equals("-")){
			//looking for numeric constants
			if (current.getLeft() instanceof IntArg || 	current.getRight() instanceof IntArg ){
				list.add(current);
			}
			
			//looking for other +/- nodes
			if (current.getLeft() instanceof Statement &&
								( ((Statement)current.getLeft()).getValue().equals("+") ||
								((Statement)current.getLeft()).getValue().equals("-") ))  {
				lookForPlusConst((Statement) current.getLeft(), list);
			}

			if (current.getRight() instanceof Statement &&
								( ((Statement)current.getRight()).getValue().equals("+") ||
								((Statement)current.getRight()).getValue().equals("-") ))  {
				lookForPlusConst((Statement) current.getRight(), list);
			}
		}
		
			
	}*/
	
	public Operand clearTree(){
		clearMul();
		ArrayList <IntArg> add = new ArrayList<IntArg>();
		ArrayList <IntArg> remove = new ArrayList<IntArg>();
		if (first instanceof Statement && !(first.getValue().equals("-")
				&& ((Statement) first).getLeft() instanceof IntArg  )){
			lookAndRemovePlusConst((Statement) first, add, remove);
			IntArg sum = calculateSum(add, remove);
			if (first!=null){
				if (sum.getDoubleValue() != 0){
					
					// Причесывает выражения вида а + -14 до а - 14
					if (sum.getDoubleValue()>0){
						first = new Statement(first, "+");
					}else{
						first = new Statement(first, "-");
						if (sum.getDoubleValue()==sum.getIntValue()){
							sum = new IntArg(-1*sum.getIntValue());
						}else{
							sum = new DoubleArg(-1*sum.getDoubleValue());
						}
					}
					((Statement) first).setRight(sum);
				}
			}else{
				first = sum;
			}
		}
		return first;
		
		
	}
	
	public void lookAndRemovePlusConst (Statement current, ArrayList <IntArg> add, ArrayList <IntArg> remove){		
		/*Добавлено, чтобы избежать
		 * Before
			2 - 3 - l
			After
			l - 1*/
		if (current.getValue().equals("+") || current.getValue().equals("-")){
			if (current.getLeft() instanceof IntArg && 	current.getRight() instanceof IntArg ){
				
				if (current==first){
					first = null;
					if (current.getLeft() instanceof IntArg){
						add.add((IntArg) current.getLeft());
					}
					if (current.getRight() instanceof IntArg){
						if (current.getValue().equals("+")){
							add.add((IntArg) current.getRight());
						}else{
							remove.add((IntArg) current.getRight());
						}
					}
					return;
				}else{
					double sum = ((IntArg) current.getLeft()).getDoubleValue();
					if (current.getValue().equals("+")){
						sum+=((IntArg) current.getRight()).getDoubleValue();
					}else{
						sum-=((IntArg) current.getRight()).getDoubleValue();
					}
					IntArg res=null;
					if((int)sum==sum){
						res = new IntArg((int)sum);
					}else{
						res = new DoubleArg(sum);
					}
					Statement prev = (Statement) StatementParser.lookForOperandBefore(current, first);	
					setOperandInsteadThis(current, res);
					
					lookAndRemovePlusConst(prev, add, remove);
					return;
				}
			}
			//looking for numeric constants
			if (current.getLeft() instanceof IntArg){
				add.add((IntArg) current.getLeft());
			}
			if (current.getRight() instanceof IntArg){
				if (current.getValue().equals("+")){
					add.add((IntArg) current.getRight());
				}else{
					remove.add((IntArg) current.getRight());
				}
			}
			/*if (current.getLeft() instanceof IntArg && 	current.getRight() instanceof IntArg ){
				if (current==first){
					first = null;
				}else{
					setOperandInsteadThis(StatementParser.lookForOperandBefore(current, first), getOtherOperandBefore(current));
				}
			}*/
				if (current.getLeft() instanceof IntArg){
					if (current == first){
						if (first.getValue().equals("+")){
							first = current.getRight();
						}else{
							first = new Statement(new IntArg(-1),"*");
							((Statement)first).setRight(current.getRight());
						}
						
					}else{
						if (current.getValue().equals("+")){
							setOperandInsteadThis(current, current.getRight());
						}else{
							Statement tmp = new Statement(new IntArg(-1),"*");
							tmp.setRight(current.getRight());
							setOperandInsteadThis(current, tmp);
						}
					}
					
				}
				if (current.getRight() instanceof IntArg) {
					if (current == first){
						first = current.getLeft();
					}
					setOperandInsteadThis(current, current.getLeft());
				}
			
			
			
		}
		
		
		//looking for other +/- nodes
		if (current.getLeft() instanceof Statement /*&&
							( ((Statement)current.getLeft()).getValue().equals("+") ||
							((Statement)current.getLeft()).getValue().equals("-") )*/)  {
			lookAndRemovePlusConst((Statement) current.getLeft(), add, remove);
			
		}

		if (current.getRight() instanceof Statement/* &&
							( ((Statement)current.getRight()).getValue().equals("+") ||
							((Statement)current.getRight()).getValue().equals("-") )*/)  {
			lookAndRemovePlusConst((Statement) current.getRight(), add,remove);
		}
		
		if (current.getLeft() instanceof Bracket){
			//System.out.println("Left bracket before");
			//((Bracket)current.getLeft()).getExpression().testPrint();
			Calculator calc = new Calculator(((Bracket)current.getLeft()).getExpression());
			((Bracket)current.getLeft()).setExpression(calc.clearTree());
		}
		if (current.getRight() instanceof Bracket){
			//System.out.println("Right bracket before");
			//((Bracket)current.getRight()).getExpression().testPrint();
			Calculator calc = new Calculator(((Bracket)current.getRight()).getExpression());
			((Bracket)current.getRight()).setExpression(calc.clearTree());
			
		}
			
	}
	
	public boolean isAddStatement (Operand op){
		return (op instanceof Statement)&&(((Statement)op).getValue().equals("+")||((Statement)op).getValue().equals("-"));
	}
	
	public boolean isMulStatement (Operand op){
		return (op instanceof Statement)&&(((Statement)op).getValue().equals("*")||((Statement)op).getValue().equals("/"));
	}
	
	public Operand clearMul(){
		if (first instanceof Statement ){
			if (isMulStatement(first) && !((((Statement) first).getLeft() instanceof IntArg) && !(((Statement) first).getRight() instanceof IntArg))){
				ArrayList<IntArg> mul = new ArrayList<IntArg>();
				ArrayList<IntArg> div = new ArrayList<IntArg>();
				first = lookAndRemoveMulConst((Statement) first, mul, div);
				IntArg res = calculateMul(mul, div);
				if (first !=null){
					if (res.getDoubleValue()!=0 && res.getDoubleValue()!=1){
						first = new Statement(first,"*");
						((Statement) first).setRight(res);
					}else{
						if (res.getDoubleValue()==0)
							first=new IntArg(0);
					}
				}else{
					first = res;
				}
			}
			if (isAddStatement(first)){
				lookingMul((Statement) first);
			}
		}
		return first;
	}
	
	public void lookingMul(Statement cur){
		if (isMulStatement(cur)){
			Calculator calc = new Calculator(cur);
			setOperandInsteadThis(cur, calc.clearMul());
		}else{
			if (cur.getLeft() instanceof Statement){
				lookingMul((Statement) cur.getLeft());
			}
			if (cur.getRight() instanceof Statement){
				lookingMul((Statement) cur.getRight());
			}
		}
	}
	
	
	public Operand lookAndRemoveMulConst ( Statement current, ArrayList <IntArg> mul, ArrayList <IntArg> div){
		if (current.getValue().equals("/") || current.getValue().equals("*")){
			if (current.getLeft() instanceof IntArg){
				mul.add((IntArg) current.getLeft());
			}
			if (current.getRight() instanceof IntArg){
				if (current.getValue().equals("*")){
					mul.add((IntArg) current.getRight());
				}else{
					div.add((IntArg) current.getRight());
				}
			}
			
			if (current.getLeft() instanceof IntArg && 	current.getRight() instanceof IntArg ){
				if (current==first){
					first = null;
				}else{
					setOperandInsteadThis(StatementParser.lookForOperandBefore(current, first), getOtherOperandBefore(current));
				}
			}else{
				if (current.getLeft() instanceof IntArg){
					if (current == first){
						if (first.getValue().equals("*")){
							first = current.getRight();
						}else{// !!!!! проверить, может первое - деление с левым числом
							first = new Statement(new IntArg(1),"/");
							((Statement)first).setRight(current.getRight());
						}
						
					}else{
						setOperandInsteadThis(current, current.getRight());
					}
					
				}
				if (current.getRight() instanceof IntArg) {
					if (current == first){
						first = current.getLeft();
					}
					setOperandInsteadThis(current, current.getLeft());
				}
			}
			
			if (isMulStatement(current.getLeft())){
				lookAndRemoveMulConst((Statement) current.getLeft(), mul, div);
			}
			
			if (isMulStatement(current.getRight())){
				lookAndRemoveMulConst((Statement) current.getRight(), mul, div);
			}
			
			/*if (current.getLeft() instanceof Bracket){
				Calculator calc = new Calculator(((Bracket)current.getLeft()).getExpression());
				
			}
			
			if (current.getRight() instanceof Bracket){
				Calculator calc = new Calculator(((Bracket)current.getRight()).getExpression());
			}*/
		}
		return first;
	}
	
	/*
	 * Ищет предыдущий операнд. Если он - оператор, то возвращает другой
	 * связанный с ним операнд.
	 * private, потому что домустимо использовать только в верхушке дерева, где все плюсы и минусы.
	 */
	private Operand getOtherOperandBefore(Operand cur){
		Operand prev = StatementParser.lookForOperandBefore(cur, first);
		if (prev instanceof Statement){
			if (((Statement)prev).getLeft()==cur) return ((Statement)prev).getRight();
			return ((Statement)prev).getLeft();
		}
		System.out.println("Error in search other tree branch for "+cur.getValue());
		return null;
	}
	
	/**
	 * 
	 * @param root - operand to be replaced
	 * @param fin - operand that we want to use instead of root.
	 */
	public void setOperandInsteadThis (Operand root, Operand fin){
		if (root==first){
			first = fin;
			return;
		}
		Operand prev = StatementParser.lookForOperandBefore(root, first);
	
		if (prev instanceof Statement){
			if (((Statement) prev).getLeft()==root){
				((Statement) prev).setLeft(fin);
			}else{
				((Statement) prev).setRight(fin);
			}
		}
		if (prev instanceof Function){
			((Function)prev).setArgument(fin);
		}
		if (prev instanceof Bracket){
			setOperandInsteadThis(prev, fin);
		}
		return ;
	}
	
	public IntArg calculateSum (ArrayList<IntArg> add, ArrayList<IntArg> remove){
		double sum = 0;
		for (int i=0; i<add.size(); i++){
			sum+=add.get(i).getDoubleValue();
		}
		for (int i=0; i<remove.size(); i++){
			sum-=remove.get(i).getDoubleValue();
		}
		if ((int)sum==sum){
			return new IntArg((int)sum);
		}
		return new DoubleArg(sum);
	}
	
	
	public IntArg calculateMul (ArrayList <IntArg> mul,ArrayList <IntArg> div){
		double res=1;
		for (int i = 0; i < mul.size(); i++) {
			res*=mul.get(i).getDoubleValue();
		}
		for (int i=0; i<div.size(); i++){
			res/=div.get(i).getDoubleValue();
		}
		if ((int)res==res){
			return new IntArg((int)res);
		}
		return new DoubleArg(res);
	}
	/*public void copyTreeWithoutPlusNums(Operand curNew, Operand curOld){
		if (curNew instanceof Statement){
			
		}
	}*/
	
	
}
