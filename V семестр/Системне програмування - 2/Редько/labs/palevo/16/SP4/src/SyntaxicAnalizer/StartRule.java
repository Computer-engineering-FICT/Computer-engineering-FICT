package SyntaxicAnalizer;

/**
 * Created by IntelliJ IDEA.
 * User: Александр
 * Date: 19.12.11
 * Time: 22:41
 * To change this template use File | Settings | File Templates.
 */
public class StartRule {
    public Rule rule;
    public int position;
    public StartRule(Rule rule1,int position1){
        if(position1<0 || rule1==null){
            throw new IllegalArgumentException();
        }
        rule=rule1;
        position=position1;
    }
}
