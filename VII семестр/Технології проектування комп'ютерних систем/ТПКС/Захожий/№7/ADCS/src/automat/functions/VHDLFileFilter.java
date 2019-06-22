package automat.functions;

import javax.swing.filechooser.FileFilter;
import java.io.File;

/**
 * Created by IntelliJ IDEA.
 * User: Zak
 * Date: 24.11.2010
 * Time: 5:00:59
 * To change this template use File | Settings | File Templates.
 */
public class VHDLFileFilter extends FileFilter {

    public static String VHDL_FILE_EXTENSION = ".vhd";

    private static String VHDL_FILE_DESCRIPTION = "VHDL File";

    public boolean accept(File pathname) {
        return (pathname.getName().toLowerCase().endsWith(VHDL_FILE_EXTENSION) || pathname.isDirectory());
    }

    public String getDescription() {
        return VHDL_FILE_DESCRIPTION;
    }

}
