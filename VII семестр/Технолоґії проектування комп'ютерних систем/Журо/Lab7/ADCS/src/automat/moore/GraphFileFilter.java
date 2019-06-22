package automat.moore;

import javax.swing.filechooser.FileFilter;
import java.io.File;

public class GraphFileFilter extends FileFilter {

    public static String GRAPH_EXTENSION = ".graph";

    private static String GRAPH_DESCRIPTION = "Graph File";

    public boolean accept(File pathname) {
        return (pathname.getName().toLowerCase().endsWith(GRAPH_EXTENSION) || pathname.isDirectory());
    }

    public String getDescription() {
        return GRAPH_DESCRIPTION;
    }
    
}
