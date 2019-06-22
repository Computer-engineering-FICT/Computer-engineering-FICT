package lab1_8;

import java.io.File;

import javax.swing.filechooser.FileFilter;

public class LSAF_Filter extends FileFilter {

	@Override
	public boolean accept(File f) {

		return f.getName().toLowerCase().endsWith(".lsaf") || f.isDirectory();
	}

	@Override
	public String getDescription() {
		
		return "LSAF File";
	}

}
