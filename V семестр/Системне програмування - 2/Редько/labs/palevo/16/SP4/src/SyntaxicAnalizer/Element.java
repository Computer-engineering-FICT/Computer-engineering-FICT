package SyntaxicAnalizer;

import LexicalScaner.Token;
import tree.Node;

/**
 * Created by IntelliJ IDEA.
 * User: Александр
 * Date: 19.12.11
 * Time: 22:18
 * To change this template use File | Settings | File Templates.
 */
public class Element {
    public Token token;
    public String irrExpr;
    public boolean isToken;
    public Node tree;


    public Element(Token token1){
        if(token1==null){
            throw new IllegalArgumentException();
        }
        token=token1;
        isToken=true;
    }

    public Element(String irrExpr1){
        if(irrExpr1==null){
            throw new IllegalArgumentException();
        }
        irrExpr=irrExpr1;
        isToken=false;
    }

    public boolean equals(Object element){
        try{
            Element e=(Element)element;
            if(e.isToken==isToken && isToken==true){
                if(e.token.equals(this.token)){
                    return true;
                }
                return false;
            }else{
                if(e.irrExpr.equals(irrExpr)){
                    return true;
                }
                return false;
            }
        }catch (Exception e){
            return false;
        }
    }

    public void printElement(){
        if(isToken){
            System.out.println("token element="+token.line);
        }else{
            System.out.println("expr element="+irrExpr);
        }
    }
}

