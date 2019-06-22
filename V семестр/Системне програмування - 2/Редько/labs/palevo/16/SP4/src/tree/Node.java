package tree;

import LexicalScaner.LexicalAnalizator;
import LexicalScaner.Token;
import table.IncorectIndex;

public class Node {
    public Node child1;
    public Node child2;
    public int type;
    public int index;
    /**
     * concatType=0 -- operation at left
     * concatType=1 -- operation at centre
     * concatType=2 -- operation at right
     */
    public static int SPLIT_LEFT=0;
    public static int SPLIT_CENTRE=1;
    public static int SPLIT_RIGHT=2;
    public int concatType;
    public LexicalAnalizator lexicalAnalizator;
    public Node(Node ch1,Node ch2,int type1,int index1,int concatType1, LexicalAnalizator lexicalAnalizator1) throws IncorectNodeException{
        child1=ch1;
        child2=ch2;
       // System.out.println("type="+type1+" concatType="+concatType1+" lexicalanl="+lexicalAnalizator1);
        if(concatType1>3 || concatType1<0 || lexicalAnalizator1==null){
            throw new IncorectNodeException();
        }
        type=type1;
        index=index1;
        concatType=concatType1;
        lexicalAnalizator=lexicalAnalizator1;
    }

    public Node(){

    }

    public String calculateValue() throws IncorectIndex{
        String ch1="";
        String ch2="";
        if(child1!=null){
            ch1=child1.calculateValue();
        }
        if(child2!=null){
            ch2=child2.calculateValue();
        }
        String res="";
        String value="";
        if(type== Token.CONSTANT){
            value=lexicalAnalizator.constants.select(index).field;
        }
        if(type== Token.DELIMITER){
            value=lexicalAnalizator.delimiters.select(index).field;
        }
        if(type== Token.IDENTIFIER){
            value=lexicalAnalizator.identifiers.select(index).field;
        }
        if(type== Token.TERMINALWORD){
            value=lexicalAnalizator.terminalWords.select(index).field;
        }
        switch (concatType){
            case 0:res=value+ch1+ch2;break;
            case 1:res=ch1+value+ch2;break;
            case 2:res=ch1+ch2+value;break;
        }
        return res;
    }
}
