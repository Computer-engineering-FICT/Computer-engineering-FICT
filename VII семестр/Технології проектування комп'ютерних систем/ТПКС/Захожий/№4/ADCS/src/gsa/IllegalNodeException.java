package gsa;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 09.09.2010
 * Time: 22:15:18
 * To change this template use File | Settings | File Templates.
 */
public class IllegalNodeException extends Exception {

    private static String TEXT1 = "The ";
    private static String TEXT2 = " node has already exist.";
    private static String BEGIN_TEXT = "Begin";
    private static String END_TEXT = "End";

    private String text;

    public IllegalNodeException(boolean beginNode) {
        if (beginNode) {
            text = TEXT1 + BEGIN_TEXT + TEXT2;
        }
        else {
            text = TEXT1 + END_TEXT + TEXT2;
        }
    }

    @Override
    public String getMessage() {
        return text;
    }
    
}
