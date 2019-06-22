package edu.editor.algorithm.parser;

import java.util.ArrayList;
import java.util.Collections;

import edu.editor.algorithm.parser.operand.Bracket;
import edu.editor.algorithm.parser.operand.Function;
import edu.editor.algorithm.parser.operand.IntArg;
import edu.editor.algorithm.parser.operand.Operand;
import edu.editor.algorithm.parser.operand.Statement;
import edu.editor.algorithm.parser.operand.Variable;

public class Commutator {
	String str;
	Statement first;
	/*public Commutator(String statement) {
		str = statement;
	}*/
	public Commutator(Statement op){
		first = op;
	}
	
	int weightPlus =1;
	int weightMult =4;
	int weightDiv = 6;
	
	
	public ArrayList<Operand> doIt(){
		ArrayList<Operand> add = new ArrayList<Operand>();
		ArrayList<Operand> remove = new ArrayList<Operand>();
		getAddTerms(add,remove,(Statement) first);
		
		ArrayList<Operand> all = makeOneList(add, remove);
		//System.out.println(all.size());
		if (all.size()<=1){
			if (isMulStatement(first)){
					ArrayList<Operand> arr = new ArrayList<Operand>();
					ArrayList<Operand>mul = new ArrayList<Operand>();
					ArrayList<Operand>div = new ArrayList<Operand>();
					ArrayList<Operand> m = new ArrayList<Operand>();
					ArrayList<Operand> d = new ArrayList<Operand>();
					 getMultTerms(mul, div, (Statement) first);
					 if (mul.size()>1){
						 m = getMultCombinations(mul);
					 }else{
						 m.add(mul.get(0));
					 }
					 
						 for (Operand tmp:m){
							 if (div.size()>1){
								 d = getMultCombinations(div);
								 for (Operand buf:d){
									 Statement stat = new Statement(tmp,"/");
									 stat.setRight(buf);
									 arr.add(stat);
							 	 }
							 }
							 if (div.size()==1){
								 Statement stat = new Statement(tmp,"/");
								 stat.setRight(div.get(0));
								 arr.add(stat);
							 }
							 if (div.size()==0){
								 arr.add(tmp);
							 }
						 }

				return arr;	
				
			}
			ArrayList<Operand> res = new ArrayList<Operand>();
			res.add(first);
			return res;
		}
		//return getCombinations(all);
		return combine(all);
		
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
		//ArrayList<Operand> list = new ArrayList<Operand>();
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
		
		//return list;
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
	
	public ArrayList<ArrayList<Operand>> sortMultOperands (ArrayList<Operand> list){
		ArrayList<ArrayList<Operand>> res = new ArrayList<ArrayList<Operand>>();
		ArrayList<Integer> rankList = new ArrayList<Integer>();
		for (int i=0; i<list.size(); i++){
			int c = calcOperandWeight(list.get(i));
			if(!rankList.contains(c)) rankList.add(c);
		}
		for (int i=0; i<rankList.size(); i++){
			res.add(new ArrayList<Operand>());
		}
		for (int i=0; i<list.size(); i++){
			Operand op = list.get(i);
			res.get(rankList.indexOf(calcOperandWeight(op))).add(op);
		}	
		
		
		return res;
		
	}
	
	public ArrayList<ArrayList<ArrayList<Operand>>> sortOperands(ArrayList<Operand> list){
		ArrayList<ArrayList<ArrayList<Operand>>> res = new ArrayList<ArrayList<ArrayList<Operand>>>();
		ArrayList<Integer> rankList = new ArrayList<Integer>();
		for (int i=0; i<list.size(); i++){
			int c = calcOperandWeight(list.get(i));
			if(!rankList.contains(c)) rankList.add(c);
		}
		for (int i=0; i<rankList.size(); i++){
			res.add(new ArrayList<ArrayList<Operand>>());
			//res.get(i).add(new ArrayList<Operand>());
		}
		for (int i=0; i<list.size(); i++){
			Operand op = list.get(i);
			
			ArrayList<Operand> arr = new ArrayList<Operand>();
			if (isMulStatement(op)){
				ArrayList<Operand>mul = new ArrayList<Operand>();
				ArrayList<Operand>div = new ArrayList<Operand>();
				ArrayList<Operand> m = new ArrayList<Operand>();
				ArrayList<Operand> d = new ArrayList<Operand>();
				 getMultTerms(mul, div, (Statement) op);
				 if (mul.size()>1){
					 m = getMultCombinations(mul);
				 }else{
					 m.add(mul.get(0));
				 }
				 
					 for (Operand tmp:m){
						 if (div.size()>1){
							 d = getMultCombinations(div);
							 for (Operand buf:d){
								 Statement stat = new Statement(tmp,"/");
								 stat.setRight(buf);
								 arr.add(stat);
						 	 }
						 }
						 if (div.size()==1){
							 Statement stat = new Statement(tmp,"/");
							 stat.setRight(div.get(0));
							 arr.add(stat);
						 }
						 if (div.size()==0){
							 arr.add(tmp);
						 }
					 }
				
				 /*System.out.println("---");
				 for (int j=0; j<m.size(); j++){
					 m.get(j).testPrint();
					 System.out.println();
				 }
				 System.out.println("---");*/
				 
				 //arr.add(op);
				
			}else{
				if (op instanceof Bracket && ((Bracket) op).getExpression() instanceof Statement){
					Commutator comm = new Commutator((Statement) ((Bracket) op).getExpression());
					arr = comm.doIt();
					
				}else{
					arr.add(op);
				}
				
			}			
			res.get(rankList.indexOf(calcOperandWeight(op))).add(arr);
		}
		return res;
	}
	
	public int [] makeIndexArray(ArrayList<Operand> list){
		ArrayList<Integer> rankList = new ArrayList<Integer>();
		for (int i=0; i<list.size(); i++){
			int c = calcOperandWeight(list.get(i));
			if(!rankList.contains(c)) rankList.add(c);
		}
		int [] res = new int[list.size()];
		for (int i=0; i<list.size(); i++){
			res[i] = rankList.indexOf(calcOperandWeight(list.get(i)));
		}
		return res;
	}
	public int getIndexCount(ArrayList<Operand> list){
		ArrayList<Integer> rankList = new ArrayList<Integer>();
		for (int i=0; i<list.size(); i++){
			int c = calcOperandWeight(list.get(i));
			if(!rankList.contains(c)) rankList.add(c);
		}
		
		return rankList.size();
	}
	
	public ArrayList<Operand> getDivCombinations(Operand mulTree,ArrayList<Operand> list){
		ArrayList<Operand> res = new ArrayList<Operand>();
		
		ArrayList<ArrayList<Operand>> sorted = sortMultOperands(list);
		int [] index = makeIndexArray(list);
		//int indexCount = getIndexCount(list);
		ArrayList<String> indexList = new ArrayList<String>();
		int [] tmp = new int [index.length];
		
		for (int i=0; i<tmp.length; i++){
			tmp[i]=i;
		}
		indexList.add(generateStringOfIndexes(index));
		int cur=0;
		//генерируем коды вариантов
		while(cur<index.length){
			cur=combineIndexes(index, indexList, tmp, cur);
			/*System.out.println();
			for (int i: tmp){
				System.out.print(i+" ");
			}
			System.out.println();*/
		}
		/*System.out.println("---");
		for (String s :indexList){
			System.out.println(s);
		}
		System.out.println("---");*/
		//строим деревья
		for( int i=0; i<indexList.size(); i++){
			tmp = strToIntArr(indexList.get(i));
			int [] ind	= new int [sorted.size()];
			
			Operand current=null;
			Operand first = null;
			/*
			 * берем из тмп число, берем операнд с такой сложностью, вставляем его в дерево
			 */
			
			for (int j = 0; j < tmp.length; j++) {
				if (first==null){
					first = sorted.get(tmp[j]).get(ind[tmp[j]]);
					current = first;
				}else{
					if(j==tmp.length-1){
						Statement prev = getStatementBefore(first,current);
						if (prev != null){
							prev.setRight(sorted.get(tmp[j]).get(ind[tmp[j]]));
						}else{
							first = new Statement(first,"*");
							((Statement) first).setRight(sorted.get(tmp[j]).get(ind[tmp[j]]));
						}
					}else{
						first = new Statement(first,"*");
						//System.out.println(tmp[j]);
						((Statement) first).setRight(sorted.get(tmp[j]).get(ind[tmp[j]]));
					}
				}
				
				ind[tmp[j]]++;
			}
			Operand div = first;
			first = new Statement(mulTree, "/");
			((Statement) first).setRight(div);
			//дерево скомпоновано
			res.add(first);
		}
		return res;
				
	}
	
	
	public ArrayList<Operand> getMultCombinations(ArrayList<Operand> list){
		ArrayList<Operand> res = new ArrayList<Operand>();
		
		ArrayList<ArrayList<Operand>> sorted = sortMultOperands(list);
		int [] index = makeIndexArray(list);
		//int indexCount = getIndexCount(list);
		ArrayList<String> indexList = new ArrayList<String>();
		int [] tmp = new int [index.length];
		
		for (int i=0; i<tmp.length; i++){
			tmp[i]=i;
		}
		indexList.add(generateStringOfIndexes(index));
		int cur=0;
		//генерируем коды вариантов
		while(cur<index.length){
			cur=combineIndexes(index, indexList, tmp, cur);
			/*System.out.println();
			for (int i: tmp){
				System.out.print(i+" ");
			}
			System.out.println();*/
		}
		/*System.out.println("---");
		for (String s :indexList){
			System.out.println(s);
		}
		System.out.println("---");*/
		//строим деревья
		for( int i=0; i<indexList.size(); i++){
			tmp = strToIntArr(indexList.get(i));
			int [] ind	= new int [sorted.size()];
			Operand current=null;
			Operand first = null;
			/*
			 * берем из тмп число, берем операнд с такой сложностью, вставляем его в дерево
			 */
			
			for (int j = 0; j < tmp.length; j++) {
				if (first==null){
					first = sorted.get(tmp[j]).get(ind[tmp[j]]);
					current = first;
				}else{
					if(j==tmp.length-1){
						Statement prev = getStatementBefore(first,current);
						if (prev != null){
							prev.setRight(sorted.get(tmp[j]).get(ind[tmp[j]]));
						}else{
							first = new Statement(first,"*");
							((Statement) first).setRight(sorted.get(tmp[j]).get(ind[tmp[j]]));
						}
					}else{
						first = new Statement(first,"*");
						//System.out.println(tmp[j]);
						((Statement) first).setRight(sorted.get(tmp[j]).get(ind[tmp[j]]));
					}
				}
				
				ind[tmp[j]]++;
			}
			//дерево скомпоновано
			res.add(first);
		}
		return res;
				
	}
	
	
	public ArrayList<ArrayList<Operand>> sortOperands2(ArrayList<Operand> list){
		ArrayList<ArrayList<Operand>> res = new ArrayList<ArrayList<Operand>>();
		ArrayList<Integer> rankList = new ArrayList<Integer>();
		for (int i=0; i<list.size(); i++){
			int c = calcOperandWeight(list.get(i));
			if(!rankList.contains(c)) rankList.add(c);
		}
		Collections.sort(rankList);
		System.out.println();
		for (int i=0; i<rankList.size(); i++){
			System.out.print(rankList.get(i)+" ");
		}
		System.out.println();
		for (int i=0; i<rankList.size(); i++){
			res.add(new ArrayList<Operand>());
			//res.get(i).add(new ArrayList<Operand>());
		}
		for (int i=0; i<list.size(); i++){
			Operand op = list.get(i);
			res.get(rankList.indexOf(calcOperandWeight(op))).add(op);
		}
		return res;
	}
	
	public ArrayList <Operand> combine (ArrayList<Operand> list){
		ArrayList <Operand> res = new ArrayList<Operand>();
		
		ArrayList<ArrayList<Operand>> raw = sortOperands2(list);
		ArrayList<ArrayList<Operand>> combinedLevels = new ArrayList<ArrayList<Operand>>();
		
		for (int i=0; i<raw.size();i++){
			/*System.out.println("i="+i+" ");
			raw.get(i).get(0).testPrint();
			System.out.println();*/
			combinedLevels.add(getCombinationsOnLevel(raw.get(i)));
		}
		/*for (int i=0; i<combinedLevels.size();i++){
			System.out.println("i="+i);
			for (int j=0; j<combinedLevels.get(i).size(); j++){
				combinedLevels.get(i).get(j).testPrint();
				System.out.println();
			}
			System.out.println();
		}
		System.out.println();*/
		
		int [] multIndex = new int[combinedLevels.size()];
		
		for (int i=0; i<combinedLevels.size(); i++){
			multIndex[i] = combinedLevels.get(i).size();
		}
		/*System.out.println("index");
		for ( int i :multIndex){
			System.out.print(i+" ");
		}
		System.out.println();*/
		
		
		ArrayList <String> multIndexList = getAllCombinations (multIndex);
		for (String s: multIndexList){
			System.out.println(s);
		}
		//System.out.println("!!!!!"+multIndexList.size());
		
		for (int i=0; i<multIndexList.size();i++){
			//System.out.println("i="+i);
			multIndex = strToIntArr(multIndexList.get(i));
			//System.out.println(multIndex.length);
			ArrayList<Operand> arr = new ArrayList<Operand>();
			for (int j=0; j<multIndex.length;j++){
				Operand op =combinedLevels.get(j).get(multIndex[j]); 
				/*op.testPrint();
				System.out.println();*/
				arr.add(op);
			}
			res.add(combineToTree(arr, "+"));
			/*System.out.println("####");
			res.get(i).testPrint();
			System.out.println();
			System.out.println("###");*/
			
		}
		return res;
	}
	
	public ArrayList <Operand>  getCombinationsOnLevel(ArrayList<Operand> list){
		/*System.out.println("--comb");
		for (Operand op:list){
			op.testPrint();
			System.out.println();
		}
		System.out.println("comb--");*/
		
		ArrayList<Operand> res = new ArrayList<Operand>();
		if (calcOperandWeight(list.get(0))!=0){
			
			Operand [] a = new Operand[list.size()];
			for (int i=0; i<a.length;i++){
				a[i] = list.get(i);
			}
			int [] index = new int[list.size()];
			for (int i=0; i<index.length;i++){
				index[i] = getIndexTerm(list.get(i));
			}
			//System.out.println("Index size "+index.length);
			ArrayList<String> indexList = new ArrayList<String>();
			ArrayList<String> numList = new ArrayList<String>();
			int [] tmp = new int [index.length];
			
			for (int i=0; i<tmp.length; i++){
				tmp[i]=i;
			}
			
			indexList.add(generateStringOfIndexes(index));
			numList.add(generateStringOfIndexes(tmp));
			
			int cur=0;
			//генерируем коды вариантов
			while(cur<index.length){
				cur=combineIndexes2(index, indexList,numList, tmp, cur);
				
			/*	System.out.println();
				for (int i: tmp){
					System.out.print(i+" ");
				}
				System.out.println();*/
			}
			for (int i=0;i<numList.size();i++){
				//System.out.println(numList.get(i));
				tmp = strToIntArr(numList.get(i));
				ArrayList<Operand> arr = new ArrayList<Operand>();
				for (int j=0; j<tmp.length; j++){
					arr.add(list.get(tmp[j]));
				}
				/*System.out.println("--comb");
				for (Operand op:arr){
					op.testPrint();
					System.out.println();
				}
				System.out.println("comb--");*/
				res.add(combineToTree(arr, "+"));
				/*System.out.println("---, maxi="+(numList.size()-1));
				res.get(i).testPrint();
				System.out.println();
				System.out.println("ppp");*/
				
			}
			return res;
		}else{
			res.add(combineToTree(list, "+"));
			/*for (Operand op:list){
				System.out.println();
				op.testPrint();
				System.out.println();
			}
			System.out.println("ggg");
			System.out.println();
			res.get(0).testPrint();
			System.out.println();*/
		}
		
		return res;
	}
	
	private int combineIndexes2(int [] indexes, ArrayList<String> indexList,ArrayList<String> numList,int [] generated, int cur){
		/*System.out.println("start operation array");
		for (int i: generated){
			System.out.print(i+" ");
		}
		System.out.println();
		System.out.println(cur);*/
		int max = indexes.length-1;
		int [] res = new int [indexes.length];
		if (generated[cur]!=max){
			int prev = findIndexOfElement(generated[cur]+1, generated);
			generated[cur]++;
			generated[prev]--;
			for (int i=0; i<res.length; i++){
				res[i]=indexes[generated[i]];
			}
			String str = generateStringOfIndexes(res);
			if(!indexList.contains(str)){
				indexList.add(str);
				numList.add(generateStringOfIndexes(generated));
			}
			
		}else{
			cur++;
			
		}
		return cur;
		
	}
	
	public Operand combineToTree (ArrayList <Operand> list, String statVal){
		Statement first = null;
		
		/*
		 * берем из тмп число, берем операнд с такой сложностью, вставляем его в дерево
		 */
		if (list.size()==1){
			return list.get(0);
		}
		if (list.size()==2){
			Statement stat = new Statement(list.get(0),statVal);
			stat.setRight(list.get(1));
			return stat;
		}if (list.size()>2){
			first = new Statement(list.get(0),statVal);
			first.setRight(list.get(1));
			for (int i=0; i<list.size()/2-1; i++){
				/*System.out.println("##");
				list.get(2+i*2).testPrint();
				System.out.println();*/
				Statement stat = new Statement(list.get(2+i*2),statVal);
				stat.setRight(list.get(3+i*2));
				first = new Statement(first, statVal);
				first.setRight(stat);
			}
			if (list.size()%2==1){
				first = new Statement(first, statVal);
				first.setRight(list.get(list.size()-1));
			}
			
		}
		

			
		return first;

	}
		
	public int getIndexTerm(Operand op){
		if (isMulStatement(op)){
			if (op.getValue().equals("*")){
				if (isSimpleOperand(((Statement) op).getLeft()) && isSimpleOperand(((Statement) op).getRight())){
					return 0;
				}
				if (isSimpleOperand(((Statement) op).getLeft()) || isSimpleOperand(((Statement) op).getRight())){
					return 1;
				}
				return 2;
			}else{
				if (isSimpleOperand(((Statement) op).getLeft()) && isSimpleOperand(((Statement) op).getRight())){
					return 3;
				}
				if (isSimpleOperand(((Statement) op).getLeft()) ){
					return 4;
				}
				if (isSimpleOperand(((Statement) op).getRight()) ){
					return 5;
				}
				return 6;
			}
		}else{
			return 7;
		}
	}
	
	public ArrayList<Operand> getCombinations(ArrayList<Operand> list){
		ArrayList<Operand> res = new ArrayList<Operand>();
		
		ArrayList<ArrayList<ArrayList<Operand>>> sorted = sortOperands(list);
		int [] index = makeIndexArray(list);
		//int indexCount = getIndexCount(list);
		ArrayList<String> indexList = new ArrayList<String>();
		int [] tmp = new int [index.length];
		
		for (int i=0; i<tmp.length; i++){
			tmp[i]=i;
		}
		indexList.add(generateStringOfIndexes(index));
		int cur=0;
		//генерируем коды вариантов
		while(cur<index.length){
			cur=combineIndexes(index, indexList, tmp, cur);
			/*System.out.println();
			for (int i: tmp){
				System.out.print(i+" ");
			}
			System.out.println();*/
		}
		/*System.out.println("---");
		for (String s :indexList){
			System.out.println(s);
		}
		System.out.println("---");*/
		
		int multCol = 0;
		for (int i=0; i<sorted.size(); i++){
			multCol+=sorted.get(i).size();
		}
		
		int [] multIndex = new int[multCol];
		int counter=0;
		for (int i=0; i<sorted.size(); i++){
			for (int j=0; j<sorted.get(i).size(); j++){
				multIndex[counter+j]= sorted.get(i).get(j).size();
			}
			counter+=sorted.get(i).size();
			//multIndex[i] = sorted.get(i).size();
		}
		ArrayList <String> multIndexList = getAllCombinations (multIndex);
		
		//строим деревья
		for (int k=0; k<multIndexList.size(); k++){
			//System.out.println("!!!"+multIndexList.get(k));
			int [] multInd = strToIntArr(multIndexList.get(k));	
		
			for( int i=0; i<indexList.size(); i++){
				tmp = strToIntArr(indexList.get(i));
				int [] ind	= new int [sorted.size()];
				Operand current=null;
				Operand first = null;
				/*
				 * берем из тмп число, берем операнд с такой сложностью, вставляем его в дерево
				 */
			
				for (int j = 0; j < tmp.length; j++) {
					counter=0;
					for (int c=0; c<tmp[j]; c++){
						counter+=sorted.get(c).size();
					}
					if (first==null){
						first = sorted.get(tmp[j]).get(ind[tmp[j]]).get(multInd[counter+ind[tmp[j]]]);
						current = first;
					}else{
						if(j==tmp.length-1){
							Statement prev = getStatementBefore(first,current);
							if (prev != null){
								prev.setRight(sorted.get(tmp[j]).get(ind[tmp[j]]).get(0));
							}else{
								first = new Statement(first,"+");
								((Statement) first).setRight(sorted.get(tmp[j]).get(ind[tmp[j]]).get(0));
							}
						}else{
							first = new Statement(first,"+");
							//System.out.println(tmp[j]);
							((Statement) first).setRight(sorted.get(tmp[j]).get(ind[tmp[j]]).get(0));
						}
					}
				
					ind[tmp[j]]++;
				}
				//дерево скомпоновано
				res.add(first);
			}
		}
		return res;
				
	}
	
	public ArrayList <String> getAllCombinations(int [] indexes){
		ArrayList<String> res = new ArrayList<String>();
		for (int i=0; i<indexes[0]; i++){
			res.add(Integer.toString(i));
		}
		for (int i=1; i<indexes.length;i++){
			ArrayList<String> res1 = new ArrayList<String>();
			for (int j=0; j<res.size(); j++){
				for (int k=0; k<indexes[i]; k++){
					res1.add(res.get(j)+" "+k);
				}
			}
			res = res1;
		}
		return res;
	}
	
	public Statement getStatementBefore(Operand first,Operand current){
		Operand op = getOperandBefore(first,current);
		while (op!=null && op instanceof Function){
			op = getOperandBefore(first,op);
		}
		if (op instanceof Statement){
			return (Statement)op;
		}else {
			return null;
		}
	}
	
	private Operand getOperandBefore(Operand first, Operand cur){
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
	
	private int combineIndexes(int [] indexes, ArrayList<String> indexList,int [] generated, int cur){
		/*System.out.println("start operation array");
		for (int i: generated){
			System.out.print(i+" ");
		}
		System.out.println();
		System.out.println(cur);*/
		int max = indexes.length-1;
		int [] res = new int [indexes.length];
		if (generated[cur]!=max){
			int prev = findIndexOfElement(generated[cur]+1, generated);
			generated[cur]++;
			generated[prev]--;
			for (int i=0; i<res.length; i++){
				res[i]=indexes[generated[i]];
			}
			String str = generateStringOfIndexes(res);
			if(!indexList.contains(str)){
				indexList.add(str);
			}
			
		}else{
			cur++;
			
		}
		return cur;
		
	}
	
	
	
	int findIndexOfElement(int value, int [] a){
		for (int i=0; i<a.length; i++){
			if(a[i]==value) return i;
		}
		System.out.print("There is no element with value "+value+" in array ");
		for (int i=0; i<a.length; i++){
			System.out.print(a[i]+" ");
		}
		System.out.println();
		return -1;
	}
	private String generateStringOfIndexes(int []a){
		String res="";
		for (int i = 0; i < a.length-1; i++) {
			res+=a[i]+" ";
		}
		res+=a[a.length-1];
		return res;
	}
	
	private int[] strToIntArr(String str){
		String [] arr = str.split(" ");
		int [] a = new int[arr.length];
		for (int i = 0; i < a.length; i++) {
			a[i]=Integer.parseInt(arr[i]);
		}
		return a;
	}
	
	public int calcOperandWeight (Operand op){
		int res=0;
		//if (isSimpleOperand(op)) return 0;
		if (op instanceof Statement){
			res = getOpWeight((Statement) op);
			res+=calcOperandWeight(((Statement) op).getLeft());
			res+=calcOperandWeight(((Statement) op).getRight());
		}
		if (op instanceof Bracket){
			return calcOperandWeight(((Bracket) op).getExpression());
		}
		return res;
	}
	
	//private int 
	
	public int getOpWeight(Statement stat){		
		if(stat.getValue().equals("*") ) return weightMult;
		if(stat.getValue().equals("/") ) return weightDiv;
		return weightPlus;
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
