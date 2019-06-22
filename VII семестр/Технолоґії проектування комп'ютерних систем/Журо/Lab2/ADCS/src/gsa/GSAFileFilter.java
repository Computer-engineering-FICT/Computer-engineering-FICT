package gsa;

import javax.swing.filechooser.FileFilter;
import java.io.File;

public class GSAFileFilter extends FileFilter {

    public static String GSA_EXTENSION = ".gsa";
    
    private static String GSA_DESCRIPTION = "GSA File";

    public boolean accept(File pathname) {
        return (pathname.getName().toLowerCase().endsWith(GSA_EXTENSION) || pathname.isDirectory());
    }

    public String getDescription() {
        return GSA_DESCRIPTION;
    }

}
