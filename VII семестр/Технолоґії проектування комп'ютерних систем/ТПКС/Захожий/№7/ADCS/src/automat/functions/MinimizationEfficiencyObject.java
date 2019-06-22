package automat.functions;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 18.11.2010
 * Time: 3:44:35
 * To change this template use File | Settings | File Templates.
 */
public class MinimizationEfficiencyObject {

    private int elementCount1;
    private int elementCount2;
    private int entryCount1;
    private int entryCount2;
    private int exitCount1;
    private int exitCount2;
    private int wayLength1;
    private int wayLength2;

    public MinimizationEfficiencyObject(int elementCount1, int elementCount2, int entryCount1, int entryCount2,
                                        int exitCount1, int exitCount2) {
        this.elementCount1 = elementCount1;
        this.elementCount2 = elementCount2;
        this.entryCount1 = entryCount1;
        this.entryCount2 = entryCount2;
        this.exitCount1 = exitCount1;
        this.exitCount2 = exitCount2;
    }

    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("The count of elements:\n");
        builder.append("Before minimization - ");
        builder.append(String.valueOf(elementCount1));
        builder.append("\nAfter minimization - ");
        builder.append(String.valueOf(elementCount2));
        builder.append("\n\nThe count of entries:\n");
        builder.append("Before minimization - ");
        builder.append(String.valueOf(entryCount1));
        builder.append("\nAfter minimization - ");
        builder.append(String.valueOf(entryCount2));
        builder.append("\n\nThe count of exits:\n");
        builder.append("Before minimization - ");
        builder.append(String.valueOf(exitCount1));
        builder.append("\nAfter minimization - ");
        builder.append(String.valueOf(exitCount2));
        return builder.toString();
    }

}
