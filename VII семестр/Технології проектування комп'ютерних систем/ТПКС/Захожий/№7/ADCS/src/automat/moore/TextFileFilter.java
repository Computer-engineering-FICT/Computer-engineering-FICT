package automat.moore;

import javax.swing.filechooser.FileFilter;
import java.io.File;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 03.11.2010
 * Time: 15:29:26
 * To change this template use File | Settings | File Templates.
 */
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
