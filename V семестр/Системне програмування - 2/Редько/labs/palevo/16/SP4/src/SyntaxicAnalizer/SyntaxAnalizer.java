package SyntaxicAnalizer;

import LexicalScaner.LexicalAnalizator;
import LexicalScaner.Token;
import tree.Node;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Александр
 * Date: 19.12.11
 * Time: 22:01
 * To change this template use File | Settings | File Templates.
 */
public class SyntaxAnalizer {
    public ArrayList<Element> buff;
    public ArrayList<StartRule> activeRules;
    public ArrayList<Rule> rules;
    public LexicalAnalizator lexicalAnalizator;
    public Node tree;

    public SyntaxAnalizer(ArrayList<Rule> rules1){
        if(rules1==null){
            throw new IllegalArgumentException();
        }
        rules=rules1;
    }
    public void analize(LexicalAnalizator lexicalAnalizator1){
        if(lexicalAnalizator1==null){
            throw new IllegalArgumentException();
        }
        buff=new ArrayList<Element>();
        activeRules=new ArrayList<StartRule>();
        lexicalAnalizator=lexicalAnalizator1;
        for(int i=0;i<lexicalAnalizator.tokens.length+1;i++){
            if(i==lexicalAnalizator.tokens.length){
                try{
                    activeRules.add(new StartRule(new Rule("nop",new ArrayList<Element>(),0),lexicalAnalizator.tokens.length));
                }catch (Exception e){
                    e.printStackTrace();
                }
            }else {
                buff.add(new Element(lexicalAnalizator.tokens[i]));
                System.out.println("Add token="+lexicalAnalizator.tokens[i].line+" type="+lexicalAnalizator.tokens[i].type+" pos="+(buff.size()-1));
                activeRules.addAll(getRuleForExpresstion(new Element(lexicalAnalizator.tokens[i]),buff.size()-1));
            }

            for(int j=0;j<activeRules.size();j++){
                //System.out.println("active rule="+activeRules.get(j).rule.name+" pos="+activeRules.get(j).position);
            }
            while (checkExitindRules(lexicalAnalizator)){};

        }

    }

    public ArrayList<StartRule> getRuleForExpresstion(Element element,int pos){
        ArrayList<StartRule> rulesForCurrentPos=new ArrayList<StartRule>();
        for(int i=0;i<rules.size();i++){
            if(rules.get(i).elements.get(0).equals(element)){
                rulesForCurrentPos.add(new StartRule(rules.get(i),pos));
            }
        }
        return rulesForCurrentPos;
    }

    public boolean checkExitindRules(LexicalAnalizator lexicalAnalizator){
        ArrayList<StartRule> rulesByPriority=new ArrayList<StartRule>();
        for(int i=0;i<activeRules.size();i++){
            boolean isCanStart=activeRules.get(i).rule.isExprForThisRule(buff,activeRules.get(i).position);
            System.out.println("iscanstart="+isCanStart+" rulename="+activeRules.get(i).rule.name+" pos="+activeRules.get(i).position);
            if(isCanStart){
                rulesByPriority.add(activeRules.get(i));
            }
        }

        boolean[] isCorrectOrder=new boolean[rulesByPriority.size()];
        for(int i=0;i<rulesByPriority.size();i++){
            isCorrectOrder[i]=false;
            for(int j=0;j<activeRules.size();j++){
                if(activeRules.get(j).position>rulesByPriority.get(i).position && activeRules.get(j).rule.priority<rulesByPriority.get(i).rule.priority){
                    isCorrectOrder[i]=true;
                    break;
                }
            }
        }

        for(int i=0;i<isCorrectOrder.length;i++){
            System.out.println("isCorectOrder="+isCorrectOrder[i]);
        }

        if(rulesByPriority.size()==0){

            return false;
        }
        int n=0;
        int max=-1;
        int p=-1;
        for(int i=0;i<rulesByPriority.size();i++){
            if(isCorrectOrder[i]){
                if(max<rulesByPriority.get(i).rule.priority){
                    max=rulesByPriority.get(i).rule.priority;
                    n++;
                    p=i;
                }
            }
        }
        if(p==-1){
            return false;
        }
        rulesByPriority.get(p).rule.executeRule(lexicalAnalizator,rulesByPriority.get(p),buff);
        System.out.println("Start execute rule="+rulesByPriority.get(p).rule.name+" pos="+rulesByPriority.get(p).position);
        int pos=rulesByPriority.get(p).position;
        Element el=buff.get(pos);
        activeRules.addAll(getRuleForExpresstion(el,pos));
        activeRules.remove(rulesByPriority.get(p));

        return true;
    }
}
