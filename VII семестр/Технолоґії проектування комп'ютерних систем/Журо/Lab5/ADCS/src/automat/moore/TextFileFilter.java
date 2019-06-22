package automat.moore;

import javax.swing.filechooser.FileFilter;
import java.io.File;

public class TextFileFilter extends FileFilter {

    public static String TEXT_FILE_EXTENSION = ".txt";

    private static String TEXT_FILE_DESCRIPTION = "Text File";

    public boolean accept(File pathname) {
        return (pathname.getName().toLowerCase().endsWith(TEXT_FILE_EXTENSION) || pathname.isDirectory());
    }

    public String getDescription() {
        return TEXT_FILE_DESCRIPTION;
    }

}
