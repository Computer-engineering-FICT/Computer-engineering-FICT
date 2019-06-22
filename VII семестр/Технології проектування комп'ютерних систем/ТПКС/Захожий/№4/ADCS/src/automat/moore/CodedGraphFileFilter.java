package automat.moore;

import javax.swing.filechooser.FileFilter;
import java.io.File;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 28.10.2010
 * Time: 2:56:28
 * To change this template use File | Settings | File Templates.
 */
public class CodedGraphFileFilter extends FileFilter {

    public static String CODED_GRAPH_EXTENSION = ".cgraph";

    private static String CODED_GRAPH_DESCRIPTION = "Coded Graph File";

    public boolean accept(File pathname) {
        return (pathname.getName().toLowerCase().endsWith(CODED_GRAPH_EXTENSION) || pathname.isDirectory());
    }

    public String getDescription() {
        return CODED_GRAPH_DESCRIPTION;
    }

}
