package SyntaxicAnalizer;

import LexicalScaner.LexicalAnalizator;
import LexicalScaner.Token;
import com.sun.javaws.exceptions.InvalidArgumentException;
import tree.IncorectNodeException;
import tree.Node;
import tree.TablesOperator;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Александр
 * Date: 19.12.11
 * Time: 21:58
 * To change this template use File | Settings | File Templates.
 */
public class Rule {
    public String name;
    public ArrayList<Element> elements;
    public int priority;

    public static final String EXPR="EE";
    public static final String ID="ID";
    public static final String CS="CS";
    public static final String TERMWORD="TM";
    public static final String DELIM="DM";

    public Rule(){

    }

    public Rule(String name1,ArrayList<Element> elements1,int priority1) throws InvalidArgumentException{
        if(name1==null || elements1==null){
            throw new IllegalArgumentException();
        }
        name=name1;
        elements=elements1;
        priority=priority1;
    }


    public boolean isExprForThisRule(ArrayList<Element> buf,int pos){
        if(buf.size()<elements.size()+pos){
            return false;
        }
        int n=0;
        boolean isCorect;
        for(int i=pos;i<buf.size();i++){
            isCorect=false;
            if(!buf.get(i).equals(elements.get(n))){
                return false;
            }

            if(n ==elements.size()-1){
                return true;
            }
            n++;
        }
        return true;
    }


    public Node executeRule(LexicalAnalizator lexicalAnalizator,StartRule rule,ArrayList<Element>buff,ArrayList<Node>){
        Node head=new Node();
        int n=1;
        Node[] nodes=new Node[elements.size()];
        try{
            for(int i=0;i<elements.size();i++){
                if(elements.get(i).isToken){
                    nodes[i]=new Node(null,null,elements.get(i).token.type,elements.get(i).token.index,Node.SPLIT_CENTRE,lexicalAnalizator);
                }
            }
        }catch (IncorectNodeException e){
            e.printStackTrace();
        }

        if(name.equals("if")){
            Node head=new Node(
        }

        Element newElement=new Element(EXPR+rule.rule.name);
        newElement.tree=head;

        for(int i=0;i<rule.rule.elements.size();i++){
            buff.remove(rule.position);
        }
        buff.add(rule.position,newElement);

    }
}
