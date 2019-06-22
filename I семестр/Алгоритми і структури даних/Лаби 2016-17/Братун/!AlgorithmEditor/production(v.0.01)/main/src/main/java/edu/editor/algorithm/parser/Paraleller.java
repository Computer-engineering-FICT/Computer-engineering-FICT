package edu.editor.algorithm.parser;

import edu.editor.algorithm.parser.operand.*;

public class Paraleller {
	Operand first;
	public Paraleller(Operand first) {
		this.first = first;
	}
	
	public Operand parallel (){
		if (first instanceof Statement){
			parallelAdd((Statement) first);
			parallelAdd2((Statement) first);
			parallelMul((Statement) first);
			/*System.out.println();
			System.out.println("1st stage paralleling");
			first.testPrint();
			System.out.println();*/
			parallelDiv((Statement) first);
		}
		return first;
	}
	
	public void parallelAdd(Statement current){
		
		if (current.getValue().equals("+") && current.getLeft().getValue().equals("+") && isSimpleOperand(current.getRight())&&
				 !isSimpleOperand(((Statement) ((Statement)current).getLeft()).getLeft())){
			Operand left = ((Statement) current.getLeft()).getRight();
			Operand right = current.getRight();
			Statement add = new Statement(left,current.getValue());
			add.setRight(right);
			Statement root = new Statement(((Statement) current.getLeft()).getLeft(),current.getLeft().getValue());
			root.setRight(add);
			setOperandInsteadThis(current,root);
			parallelAdd((Statement) root.getLeft());
			if (((Statement) current.getLeft()).getRight() instanceof Statement)
				parallelAdd((Statement) ((Statement) current.getLeft()).getRight());
		}else{
			if (current.getValue().equals("-") && current.getLeft().getValue().equals("-") && isSimpleOperand(current.getRight())&&
					isSimpleOperand(((Statement) ((Statement)current).getLeft()).getRight()) ){
				Operand left = ((Statement) current.getLeft()).getRight();
				Operand right = current.getRight();
				Statement add = new Statement(left,"+");
				add.setRight(right);
				Statement root = new Statement(((Statement)current.getLeft()).getLeft(),"-");
				root.setRight(add);
				setOperandInsteadThis(current,root);
				if (root.getLeft() instanceof Statement)
					parallelAdd((Statement) root.getLeft());
			}else{
				if (current.getLeft() instanceof Statement){
					parallelAdd((Statement) current.getLeft());
				}
				if (current.getRight() instanceof Statement){
					parallelAdd((Statement) current.getRight());
				}
				if (current.getLeft() instanceof Bracket){
					Paraleller par = new Paraleller(((Bracket)current.getLeft()).getExpression());
					((Bracket) current.getLeft()).setExpression(par.parallel());
				}
				if (current.getRight() instanceof Bracket){
					Paraleller par = new Paraleller(((Bracket)current.getRight()).getExpression());
					((Bracket) current.getRight()).setExpression(par.parallel());
				}
			}
		}
	}
	//a+b*(c-d/e/c/k)/f+k+2*f*(r-2-x-y)+5
	
	public void parallelAdd2(Statement current){
		if (current.getValue().equals("-") && current.getLeft().getValue().equals("-")&& current.getRight().getValue().equals("+")){
			Operand left = ((Statement) current.getLeft()).getRight();
			Operand right = current.getRight();
			Statement mul = new Statement(left,"+");
			mul.setRight(right);
			Statement root = new Statement(((Statement) current.getLeft()).getLeft(),"-");
			root.setRight(mul);
			setOperandInsteadThis(current,root);
			if (root.getLeft() instanceof Statement)
				parallelAdd2(root);
		
		}else{
			if (current.getValue().equals("+") && current.getLeft().equals("+")){
				Operand left = ((Statement) current.getLeft()).getRight();
				Operand right = current.getRight();
				Statement add = new Statement(left,current.getValue());
				add.setRight(right);
				Statement root = new Statement(((Statement) current.getLeft()).getLeft(),current.getLeft().getValue());
				root.setRight(add);
				setOperandInsteadThis(current,root);
				if (root.getLeft() instanceof Statement)
					parallelAdd2((Statement) root.getLeft());
			}
			else{
				if (current.getLeft() instanceof Statement){
					parallelAdd2((Statement) current.getLeft());
				}
				if (current.getRight() instanceof Statement){
					parallelAdd2((Statement) current.getRight());
				}
			}
		}
	}
	
	public void parallelMul(Statement current){
		if (current.getValue().equals("*") && current.getLeft().getValue().equals("*") && isSimpleOperand(current.getRight())&&
				isSimpleOperand(((Statement) ((Statement)current).getLeft()).getRight()) &&
				!isSimpleOperand(((Statement) ((Statement)current).getLeft()).getLeft())){
			Operand left = ((Statement) current.getLeft()).getRight();
			Operand right = current.getRight();
			Statement mul = new Statement(left,"*");
			mul.setRight(right);
			Statement root = new Statement(((Statement) current.getLeft()).getLeft(),"*");
			root.setRight(mul);
			setOperandInsteadThis(current,root);
			parallelMul((Statement) root.getLeft());
		}else{
			if (current.getValue().equals("/") && current.getLeft().getValue().equals("/") && isSimpleOperand(current.getRight())&&
					isSimpleOperand(((Statement) ((Statement)current).getLeft()).getRight()) ){
				Operand left = ((Statement) current.getLeft()).getRight();
				Operand right = current.getRight();
				Statement mul = new Statement(left,"*");
				mul.setRight(right);
				Statement root = new Statement(((Statement)current.getLeft()).getLeft(),"/");
				root.setRight(mul);
				setOperandInsteadThis(current,root);
				if (root.getLeft() instanceof Statement)
					parallelMul((Statement) root.getLeft());
			}else{
				if (current.getLeft() instanceof Statement){
					parallelMul((Statement) current.getLeft());
				}
				if (current.getRight() instanceof Statement){
					parallelMul((Statement) current.getRight());
				}
			}
			
		}
	}
	
	public void parallelDiv(Statement current){
		if (current.getValue().equals("/") && current.getLeft().getValue().equals("/")&& current.getRight().getValue().equals("*")/*&&
				((Statement) current.getLeft()).getRight().getValue().equals("*")*/){
			Operand left = ((Statement) current.getLeft()).getRight();
			Operand right = current.getRight();
			Statement mul = new Statement(left,"*");
			mul.setRight(right);
			Statement root = new Statement(((Statement) current.getLeft()).getLeft(),"/");
			root.setRight(mul);
			setOperandInsteadThis(current,root);
			if (root.getLeft() instanceof Statement)
				parallelDiv(root);
		}else{
			/*if (current.getValue().equals("*") && current.getLeft().getValue().equals("*")){
				Operand left = ((Statement) current.getLeft()).getRight();
				Operand right = current.getRight();
				Statement mul = new Statement(left,"*");
				mul.setRight(right);
				Statement root = new Statement(((Statement) current.getLeft()).getLeft(),"*");
				root.setRight(mul);
				setOperandInsteadThis(current,root);
				if (root.getLeft() instanceof Statement)
					parallelDiv(root);
			}else{*/
				if (current.getLeft() instanceof Statement){
					parallelDiv((Statement) current.getLeft());
				}
				if (current.getRight() instanceof Statement){
					parallelDiv((Statement) current.getRight());
				}
		//	}
		}	
	}
	
	public boolean isSimpleOperand(Operand op){
		return (op instanceof IntArg || op instanceof Variable);
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
	
	public boolean isAddStatement (Operand op){
		return (op instanceof Statement)&&(((Statement)op).getValue().equals("+")||((Statement)op).getValue().equals("-"));
	}
	
	public boolean isMulStatement (Operand op){
		return (op instanceof Statement)&&(((Statement)op).getValue().equals("*")||((Statement)op).getValue().equals("/"));
	}
	
}
