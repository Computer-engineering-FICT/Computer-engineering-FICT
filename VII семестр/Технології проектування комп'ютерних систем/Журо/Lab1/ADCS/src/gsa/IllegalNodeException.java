package gsa;

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
