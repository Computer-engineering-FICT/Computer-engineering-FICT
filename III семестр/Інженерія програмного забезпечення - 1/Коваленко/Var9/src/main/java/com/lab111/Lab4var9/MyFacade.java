package com.lab111.Lab4var9;

/**
 * This is facade to create simple path to file, and two files
 * @author A
 * @version 4.9
 */
public class MyFacade {
	private Directory dir;
	private File file;
	private File text;
		
		/**
		* Creates 
		*/
		public void create(){
			dir = new Folder("D:"); 
			dir = new Folder("Dir1", dir); 
			dir = new Folder("Dir2", dir); 	
			
			file = new TextFile(); 
			file.open("file1", dir, false); 
			dir.printDirectories();
			
			text = new TextFile(); 
			file.open("file2", dir, false); 
			dir.printDirectories();
			
			text = new TextFile();			
			text.open("file3", dir.getRoot(), false); 
			dir.getRoot().printDirectories();
		}
		/**
		*	Destroys 
		*/
		public void destroy(){
			dir.emptyDirectory();
			file = null; 
			text = null; 
			dir = null;
		}
}
