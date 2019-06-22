package gsa;

public class BeginEndNodesNotFoundException extends Exception {

    private static String BEGIN_TEXT = "Begin node ";
    private static String END_TEXT = "End node ";
    private static String BEGIN_END_TEXT = "Begin and End nodes ";
    private static String COMMON_TEXT1 = "has not been found.";
    private static String COMMON_TEXT2 = "have not been found.";

    private String text;

    public BeginEndNodesNotFoundException(boolean beginNode, boolean endNode) {
        if (beginNode && endNode) {
            text = BEGIN_END_TEXT + COMMON_TEXT2;
        }
        else {
            if (beginNode) {
                text = BEGIN_TEXT + COMMON_TEXT1;
            }
            else {
                if (endNode) {
                    text = END_TEXT + COMMON_TEXT1;
                }
            }
        }
    }

    @Override
    public String getMessage() {
        return text;
    }

}
