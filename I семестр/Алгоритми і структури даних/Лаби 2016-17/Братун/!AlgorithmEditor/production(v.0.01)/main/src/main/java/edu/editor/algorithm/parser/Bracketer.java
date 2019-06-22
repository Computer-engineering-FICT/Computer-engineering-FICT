package edu.editor.algorithm.parser;

import java.util.ArrayList;

import edu.editor.algorithm.parser.operand.Bracket;
import edu.editor.algorithm.parser.operand.IntArg;
import edu.editor.algorithm.parser.operand.Operand;
import edu.editor.algorithm.parser.operand.Statement;
import edu.editor.algorithm.parser.operand.Variable;

public class Bracketer {
	Statement first;
	public Bracketer(Statement stat) {
		first = stat;
	}
	
	public ArrayList<Operand> makeOneList(ArrayList<Operand> add, ArrayList<Operand> remove){
		ArrayList<Operand> res = new ArrayList<Operand>();
		for (Operand op: add){
			res.add(op);
		}
		for (Operand op: remove){
			if (op instanceof Statement){
				Statement tmp = (Statement) op;
				while(tmp.getLeft() instanceof Statement) tmp = (Statement) tmp.getLeft();
				tmp.getLeft().setValue("-"+tmp.getLeft().getValue());
			}else{
				op.setValue("-"+op.getValue());
			}
			res.add(op);
		}
		return res;
	} 
	
	public void getAddTerms(ArrayList<Operand> add, ArrayList<Operand> remove, Statement current){
		if (current.getValue().equals("+") || current.getValue().equals("-")){
			if(isAddStatement(current.getLeft())){
				getAddTerms(add, remove, (Statement) current.getLeft());
			}else{
				add.add(current.getLeft());
			}
			if(isAddStatement(current.getRight())){
				if (current.getRight().getValue().equals("+")){
					getAddTerms(add, remove, (Statement) current.getRight());
				}else{
					//Если там минус - списки меняются местами.
					getAddTerms( remove, add,(Statement) current.getRight());
				}
				
			}else{
				if (current.getValue().equals("+")){
					add.add(current.getRight());
				}else{
					remove.add(current.getRight());
				}
			}
			
		}
		
	}
	
	
	
	public void getMultTerms(ArrayList<Operand> mul, ArrayList<Operand> div, Statement current){
		if (current.getValue().equals("*") || current.getValue().equals("/")){
			if (isMulStatement(current.getLeft())){
				getMultTerms(mul, div, (Statement) current.getLeft());
			}else{
				mul.add(current.getLeft());
			}
			if (isMulStatement(current.getRight())){
				if (current.getRight().getValue().equals("*")){
					getMultTerms(mul, div, (Statement) current.getRight());
				}else{
					getMultTerms( div,mul, (Statement) current.getRight());
				}
			}else{
				if(current.getValue().equals("*")){
					mul.add(current.getRight());
				}else{
					div.add(current.getRight());
				}
			}
		}
	}
	
	public void getSimilarOperands(ArrayList<Operand> similarMul, ArrayList<Operand> similarDiv,ArrayList<Operand> allMul, ArrayList<Operand> allDiv, Operand term){
		if (isAddStatement(term)){
			ArrayList<Operand> add = new ArrayList<Operand>();
			ArrayList<Operand> remove = new ArrayList<Operand>();
			getAddTerms(add,remove,(Statement) term);
			ArrayList<Operand> localSimilarMul = new ArrayList<Operand>();
			ArrayList<Operand> localSimilarDiv = new ArrayList<Operand>();
			ArrayList<Operand> localAllMul = new ArrayList<Operand>(); 
			ArrayList<Operand> localAllDiv = new ArrayList<Operand>();
			for (Operand op:add){
				getSimilarOperands(localSimilarMul, localSimilarDiv,localAllMul, localAllDiv, op);
			}
			for (Operand op:remove){
				getSimilarOperands(localSimilarMul, localSimilarDiv,localAllMul, localAllDiv, op);
			}
			//получили одинаковые множители
			for (Operand op:localSimilarMul){
				if (!allMul.contains(op)){
					allMul.add(op);
				}else{
					if(!similarMul.contains(op))
						similarMul.add(op);
				}
			}
			for (Operand op: localSimilarDiv){
				if (!allDiv.contains(op)){
					allDiv.add(op);
				}else{
					if(!similarDiv.contains(op))
						similarDiv.add(op);
				}
			}
			
			
			
		}
		if(isMulStatement(term)){
			ArrayList<Operand> mul = new ArrayList<Operand>();
			ArrayList<Operand> div = new ArrayList<Operand>();
			getMultTerms(mul, div, (Statement) term);
			for (Operand op:mul){
				if (!allMul.contains(op)){
					allMul.add(op);
					//op.testPrint();
				}else{
					if(!similarMul.contains(op))
						similarMul.add(op);
				}
			}
			for (Operand op:div){
				if (!allDiv.contains(op)){
					allDiv.add(op);
				}else{
					if(!similarDiv.contains(op))
						similarDiv.add(op);
				}
			}
			
		}
		if (term instanceof Bracket){
			getSimilarOperands(similarMul, similarDiv,allMul, allDiv, ((Bracket) term).getExpression());
		}
		//simple operand
		if (!allMul.contains(term)){
			allMul.add(term);
			
		}else{
			if(!similarMul.contains(term))
				similarMul.add(term);
				//term.testPrint();
		}
	}
	
	public ArrayList<Operand> getBracketVariants (Operand term){
		ArrayList<Operand>  res = new ArrayList<Operand>();
		ArrayList<Operand> similarMul = new ArrayList<Operand>();
		ArrayList<Operand> similarDiv = new ArrayList<Operand>();
		ArrayList<Operand> allMul = new ArrayList<Operand>();
		ArrayList<Operand> allDiv = new ArrayList<Operand>();
		ArrayList<Operand> add = new ArrayList<Operand>();
		ArrayList<Operand> remove = new ArrayList<Operand>();
		if (term instanceof Statement){
			getAddTerms(add, remove, (Statement) term);
		}else{
			add.add(term);
		}
		for (Operand op:add){
			getSimilarOperands(similarMul, similarDiv, allMul, allDiv, op);
		}
		for (Operand op:remove ){
			getSimilarOperands(similarMul, similarDiv, allMul, allDiv, op);
		}
		for (Operand op:similarMul){
			System.out.println("!!!");
			op.testPrint();
			System.out.println();
		}
		if (similarMul.size()>0){
			/*ArrayList<Operand> add = new ArrayList<Operand>();
			ArrayList<Operand> remove = new ArrayList<Operand>();
			if (term instanceof Statement){
				getAddTerms(add, remove, (Statement) term);
			}else{
				add.add(term);
			}*/
			
			res.add(factorize(add, remove, similarMul.get(0), true,false));
			System.out.println("===");
			res.get(0).testPrint();
			System.out.println();
			System.out.println("===");
		}
		
		return res;
		
		
	}
	
	
	public ArrayList<Operand> getAllTermsContainsMul (ArrayList<Operand>source, Operand term, boolean type){
		ArrayList<Operand> res = new ArrayList<Operand>();
		for (Operand op: source){
			if(isMulStatement(op)){
				ArrayList<Operand> mul = new ArrayList<Operand>();
				ArrayList<Operand> div = new ArrayList<Operand>();
				getMultTerms(mul, div, (Statement) op);
				if (type && mul.contains(term)){
					res.add(op);
				}
				if(!type && div.contains(term)){
					res.add(op);
				}
			}
			if (isSimpleOperand(op)){
				if (type && op.equals(term)){
					res.add(op);
				}
			}
			if (op instanceof Bracket){
				Operand ex = ((Bracket) op).getExpression();
				if (isAddStatement(ex)){
					ArrayList<Operand> add = new ArrayList<Operand>();
					ArrayList<Operand> remove = new ArrayList<Operand>();
					getAddTerms(add, remove, (Statement) ex);
					for (Operand tmp:remove){
						add.add(tmp);
					}
					if (getAllTermsContainsMul(add, term, type).equals(add)){
						res.add(op);
					}
				}else{
					ArrayList<Operand> tmp = new ArrayList<Operand>();
					tmp.add(ex);
					if (tmp.equals(getAllTermsContainsMul(tmp, term, type))){
						res.add(op);
					}
				}
				
				
			}
		}
		return res;
	}
	
	
	//Если type=true, то term - множитель, иначе - делитель
	private Operand factorize (ArrayList <Operand> add, ArrayList <Operand> remove, Operand term, boolean type, boolean flag){
		ArrayList<Operand> resAdd = new ArrayList <Operand>();
		ArrayList<Operand> resRemove = new ArrayList <Operand>();
		ArrayList<Operand> resAdd2 = new ArrayList <Operand>();
		ArrayList<Operand> resRemove2 = new ArrayList <Operand>();
		for (Operand op: add){
			
			if (isAddStatement(op)){
				//ТОЛЬКО для скобок
				ArrayList<Operand>localAdd = new ArrayList<Operand>();
				ArrayList<Operand>localRemove = new ArrayList<Operand>();
				getAddTerms(localAdd, localRemove, (Statement) op);
				ArrayList <Operand> tmp = new ArrayList<Operand>();
				for (Operand loc: localRemove){
					tmp.add(loc);
				}
				if (tmp.equals(getAllTermsContainsMul(tmp, term, type))){
					Operand f = factorize(localAdd, localRemove, term, type,true);
					return f;
					//return ((Bracket)((Statement)f).getRight()).getExpression();
					//return ((Bracket)((Statement) ((Statement)f).getRight()).getRight()).getExpression();
				}else{
					return op;
				}
				
				
				//resAdd.add(factorize(localAdd,localRemove,term,type));
			}
			
			if(isMulStatement(op)){
				ArrayList<Operand> mul = new ArrayList<Operand>();
				ArrayList<Operand> div = new ArrayList<Operand>();
				getMultTerms(mul, div, (Statement) op);
				boolean check=false;
				if (type){
					//Если его там нет, ничего не поменяется.
					check=mul.remove(term);					
				}else{
					check=div.remove(term);
				}
				if (check){
					resAdd.add(buildMulTerm(mul, div));
				}else{
					resAdd2.add(op);
				}
			}
			if (isSimpleOperand(op)){
				/*if(!op.equals(term)){
					resAdd.add(op);
				}else{
					resAdd.add(new IntArg(1));
				}*/
				if(op.equals(term)){
					resAdd.add(new IntArg(1));
				}else{
					resAdd2.add(op);
				}
			}
			if (op instanceof Bracket){
				Operand ex = ((Bracket) op).getExpression();
				ArrayList<Operand>localAdd = new ArrayList<Operand>();
				ArrayList<Operand>localRemove = new ArrayList<Operand>();
				localAdd.add(ex);
				((Bracket) op).setExpression(factorize(localAdd,localRemove,term,type,true));
				if (!ex.equals(((Bracket) op).getExpression())){
					resAdd.add(op);
				}else{
					resAdd2.add(op);
				}
				
			}
			
		}
		
		
		
		for (Operand op: remove){
			
			if (isAddStatement(op)){
				ArrayList<Operand>localAdd = new ArrayList<Operand>();
				ArrayList<Operand>localRemove = new ArrayList<Operand>();
				getAddTerms(localAdd, localRemove, (Statement) op);
				resRemove.add(factorize(localAdd,localRemove,term,type,true));
			}
			
			if(isMulStatement(op)){
				ArrayList<Operand> mul = new ArrayList<Operand>();
				ArrayList<Operand> div = new ArrayList<Operand>();
				getMultTerms(mul, div, (Statement) term);
				boolean check =false;
				if (type){
					//Если его там нет, ничего не поменяется.
					check =mul.remove(term);					
				}else{
					check =div.remove(term);
				}
				if (check){
					resRemove.add(buildMulTerm(mul, div));
				}else{
					resRemove2.add(op);
				}
				
			}
			if (isSimpleOperand(op)){
				if(!op.equals(term)){
					resRemove2.add(op);
				}else{
					resRemove.add(new IntArg(1));
				}
			}
			if (op instanceof Bracket){
				Operand ex = ((Bracket) op).getExpression();
				ArrayList<Operand>localAdd = new ArrayList<Operand>();
				ArrayList<Operand>localRemove = new ArrayList<Operand>();
				localAdd.add(ex);
				((Bracket) op).setExpression(factorize(localAdd,localRemove,term,type,true));
				if (!ex.equals(((Bracket) op).getExpression())){
					resRemove.add(op);
				}else{
					resRemove2.add(op);
				}
				
			}
			
		}
		
		if (flag){
			return buildAddTerm(resAdd, resRemove);
		}
		
		
		Statement res = new Statement(term,"*");
		res.setRight(new Bracket( buildAddTerm(resAdd, resRemove)));
		if (resAdd2.size()>0 || resRemove2.size()>0){
			res = new Statement(res,"+");
			res.setRight(buildAddTerm(resAdd2,resRemove2));
		}
		
		return res;
	}
	
	public Operand buildMulTerm(ArrayList <Operand> mul, ArrayList <Operand> div){
		Operand first;
		if (mul.size()>0){
			first = mul.get(0);
			if (mul.size()>1){
				Operand op;
				for (int i=1; i<mul.size(); i++){
					op=mul.get(i);
					first = new Statement(first,"*");
					((Statement)first).setRight(op);
				}
			}
		}else{
			first = new IntArg(1);
		}
		if (div.size()>0){
			Operand op;
			for (int i=0; i<div.size(); i++){
				op = div.get(i);
				first = new Statement(first,"/");
				((Statement)first).setRight(op);
			}
		}
		
		
		return first;
	}
	
	public Operand buildAddTerm(ArrayList <Operand>add, ArrayList<Operand> remove){
		Operand first;
		if (add.size()>0){
			first=add.get(0);
			for (int i=1; i<add.size(); i++){
				first = new Statement(first,"+");
				((Statement) first).setRight(add.get(i));
			}
		}else{
			first=new IntArg(0);
		}
		if (remove.size()>0){
			for (int i=0; i<remove.size();i++){
				first = new Statement(first,"-");
				((Statement) first).setRight(remove.get(i));
			}
		}
		return first;
		
	}
	
	public boolean isAddStatement (Operand op){
		return (op instanceof Statement)&&(((Statement)op).getValue().equals("+")||((Statement)op).getValue().equals("-"));
	}
	
	public boolean isMulStatement (Operand op){
		return (op instanceof Statement)&&(((Statement)op).getValue().equals("*")||((Statement)op).getValue().equals("/"));
	}
	public boolean isSimpleOperand(Operand op){
		return(op instanceof IntArg || op instanceof Variable);
	}
	
}
