package automat.functions;

import javax.swing.filechooser.FileFilter;
import java.io.File;

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
