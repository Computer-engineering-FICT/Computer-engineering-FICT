package automat.moore;

import javax.swing.filechooser.FileFilter;
import java.io.File;

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
