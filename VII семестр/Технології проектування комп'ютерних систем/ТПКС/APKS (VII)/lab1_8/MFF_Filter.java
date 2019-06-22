package lab1_8;

import java.io.File;

import javax.swing.filechooser.FileFilter;

public class MFF_Filter extends FileFilter {

	@Override
	public boolean accept(File f) {

		return f.getName().toLowerCase().endsWith(".mff") || f.isDirectory();
	}

	@Override
	public String getDescription() {
		
		return "MFF File";
	}

}
